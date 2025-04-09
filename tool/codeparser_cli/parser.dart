import 'dart:convert';
import 'dart:io';
import 'models/models.dart';

final Pattern beginSegment = RegExp(r'//\s+BEGIN');
final Pattern endSegment = RegExp(r'//\s+END');

const codeSnippetsSourcePath = 'demo/lib/ui';
const libSourcePath = 'lib/widgets';
const apiOutputPath = 'api.json';
const pubspecPath = 'pubspec.yaml';

Future<String> getCodeSnippets({
  String sourceDirectoryPath = codeSnippetsSourcePath,
}) async {
  final codeSnippets = await _createSnippets(sourceDirectoryPath);
  final codeSnippetsAndProperties =
      await _getProperties(libSourcePath, codeSnippets);
  return VPDSLibrary.encode(codeSnippetsAndProperties);
}

/// [_getPubspecInfo] walks through the file specified by
/// [pubspecPath] and reads every line in it, parsing out the
/// package name and version.
///
/// The output is a VPDSLibrary object.
Future<VPDSLibrary> _getPubspecInfo({String pubspecPath = pubspecPath}) async {
  try {
    final pubspec = await File(pubspecPath).readAsString();
    final pubspecLines = const LineSplitter().convert(pubspec);

    var pubIndex = 0;
    String? pubName, pubVersion;

    while (pubIndex < pubspecLines.length - 1) {
      if (pubName != null && pubVersion != null) break;
      if (pubVersion == null && pubspecLines[pubIndex].contains("version")) {
        pubVersion = pubspecLines[pubIndex].split(":")[1].toString().trim();
      } else if (pubName == null && pubspecLines[pubIndex].contains("name")) {
        pubName = pubspecLines[pubIndex].split(":")[1].toString().trim();
      }
      pubIndex++;
    }

    return VPDSLibrary(name: pubName, version: pubVersion);
  } catch (e) {
    throw PreformatterException(
        'Error parsing pubspec file at $pubspecPath - $e');
  }
}

/// [_createSnippets] walks through the directory specified by
/// [sourceDirectoryPath] and reads every file in it,
/// collects code segments marked by "// BEGIN <segment_name>" and "// END"
///
/// The output is a VPDSLibrary object.
Future<VPDSLibrary> _createSnippets(String sourceDirectoryPath) async {
  /// Fetch files.
  final files = Directory(sourceDirectoryPath)
      .listSync(recursive: true)
      .whereType<File>()
      .toList();

  /// Initialize VPDSLibrary object and fill with pubspec info.
  VPDSLibrary snippets = await _getPubspecInfo();

  var segments = <String, Snippet>{}; // Code snippets.
  var segmentPrologues = <String, String>{}; // For import statements.
  var appearedSegments = <String>{}; // To ensure no repeats.

  /// Loop through files.
  for (final file in files) {
    /// Skip .DS_Store files.
    if (file.path.contains('DS_Store')) continue;

    final content = file.readAsStringSync();
    final lines = const LineSplitter().convert(content);
    final prologue = StringBuffer(); // captures imports
    final activeSegments = <String>{};
    var status = _FileReadStatus.comments;

    /// Loops through file lines and collect snippets in-between BEGIN and END statements.
    for (final line in lines) {
      status = _updatedStatus(status, line);
      if (status != _FileReadStatus.finished) {
        prologue.writeln(line);
      }
      if (line.trim().startsWith(beginSegment)) {
        final beginName = line.replaceFirst(beginSegment, '').trim();
        activeSegments.add(beginName);
        appearedSegments.add(beginName);
        segments[beginName] = Snippet(buffer: StringBuffer(), path: file.path);
        segmentPrologues[beginName] = prologue.toString();
      } else if (line.trim().startsWith(endSegment)) {
        if (activeSegments.isNotEmpty) {
          activeSegments.remove(activeSegments.first);
        } else {
          throw PreformatterException(
              'END is used without a paired BEGIN in ${file.path}');
        }
      } else {
        for (final name in activeSegments) {
          segments[name]!.buffer.writeln(line);
        }
      }
    }
    if (activeSegments.isNotEmpty) {
      throw PreformatterException('File ${file.path} has unpaired BEGIN');
    }
  }

  /// Loops through segments and creates VPDSComponents from them.
  for (final seg in segments.entries) {
    final buffer = StringBuffer();
    String component;
    String? variantName;

    if (seg.key.contains('-')) {
      var parts = seg.key.split('-');
      component = parts[0];
      variantName = parts[1];
    } else {
      component = seg.key;
    }

    buffer.write(segmentPrologues[seg.key]!.trim().toString());
    buffer.write('\n\n');

    buffer.write(segments[seg.key]!.buffer.toString());
    buffer.write('\n\n');

    final variant = Variant(
      name: variantName,
      path: seg.value.path,
      snippet: buffer.toString(),
    );

    snippets.entries[component] ??= VPDSComponent(name: component);
    snippets.entries[component]?.variants.add(variant);
  }

  return snippets;
}

/// [_getProperties] walks through the directory specified by
/// [sourceDirectoryPath] and reads every file in it,
/// collects properties segments marked by "// BEGIN Properties" and "// END"
///
/// It adds the properties to the provided VPDSLibrary
Future<VPDSLibrary> _getProperties(
    String sourceDirectoryPath, VPDSLibrary snippets) async {
  /// Fetch files.
  final files = Directory(sourceDirectoryPath)
      .listSync(recursive: true)
      .whereType<File>()
      .toList();
  Map<String, List<Property>> properties = {};

  /// Loop through files.
  for (final file in files) {
    /// Skip .DS_Store files
    if (file.path.contains('DS_Store')) continue;

    final content = file.readAsStringSync();
    final lines = const LineSplitter().convert(content);
    bool activeSegment = false;
    String activeClass = '';
    Map<String, bool> requiredProps = {};
    String? activeComment;

    /// Loop through files lines.
    for (final line in lines) {
      final trimmed = line.trim();
      if (trimmed.startsWith('class')) {
        /// Get class name.
        final lineArr = trimmed.split(" ");
        properties[lineArr[1]] = [];
        activeClass = lineArr[1];
      } else if (trimmed.contains('required')) {
        /// Collect required properties.
        final propertyName = trimmed.split(".").last.replaceFirst(',', '');
        requiredProps[propertyName] = true;
      } else if (trimmed.startsWith(beginSegment)) {
        /// Toggle activeSegment to begin collecting properties.
        activeSegment = true;
      } else if (trimmed.startsWith(endSegment)) {
        /// Toggle activeSegment to stop collecting properties.
        if (activeSegment) {
          activeSegment = false;
        } else {
          throw PreformatterException(
              'END is used without a paired BEGIN in ${file.path}');
        }
      } else {
        /// Parse properties.
        if (!activeSegment) continue;
        if (trimmed.startsWith("//")) {
          activeComment = line.replaceFirst(RegExp(r'//'), '').trim();
        } else {
          final parsed = trimmed.split(" ");
          final isFinalProperty = parsed.first == 'final' && parsed.length > 2;
          final propertyName = (isFinalProperty ? parsed[2] : parsed.first).replaceAll(";", "");
          properties[activeClass] ??= [];
          properties[activeClass]?.add(Property(
            name: propertyName,
            type: isFinalProperty ? parsed[1] : parsed[0],
            description: activeComment,
            isRequired: requiredProps[propertyName] ?? false,
          ));
          activeComment = null;
        }
      }
    }
  }

  /// Match properties to provided VPDSLibrary object properties.
  properties.forEach((key, value) => snippets.entries[key]?.properties = value);

  return snippets;
}

/// Returns the new status of the scanner whose previous status was
/// [oldStatus], after scanning the line [line].
_FileReadStatus _updatedStatus(_FileReadStatus oldStatus, String line) {
  _FileReadStatus lineStatus;
  if (line.trim().startsWith('//')) {
    lineStatus = _FileReadStatus.comments;
  } else if (line.trim().startsWith('import')) {
    lineStatus = _FileReadStatus.imports;
  } else {
    lineStatus = _FileReadStatus.finished;
  }

  late _FileReadStatus newStatus;
  switch (oldStatus) {
    case _FileReadStatus.comments:
      newStatus =
          (line.trim().isEmpty || lineStatus == _FileReadStatus.comments)
              ? _FileReadStatus.comments
              : lineStatus;
      break;
    case _FileReadStatus.imports:
      newStatus = (line.trim().isEmpty || lineStatus == _FileReadStatus.imports)
          ? _FileReadStatus.imports
          : _FileReadStatus.finished;
      break;
    case _FileReadStatus.finished:
      newStatus = oldStatus;
      break;
  }
  return newStatus;
}

enum _FileReadStatus {
  comments,
  imports,
  finished,
}

class PreformatterException implements Exception {
  PreformatterException(this.cause);
  String cause;
}