import 'dart:convert';
import 'vpds_component.dart';

class VPDSLibrary {
  String? name;
  String? version;
  String datetime = DateTime.now().toString();
  Map<String, VPDSComponent> entries = {};

  VPDSLibrary({
    required String? name,
    required String? version,
  }) {
    this.name = name ?? 'vpds-flutter';
    this.version = version ?? '';
  }

  static Map<String, dynamic> toMap(VPDSLibrary library) {
    return {
      'name': library.name,
      'version': library.version,
      'datetime': library.datetime,
      'entries':
          library.entries.values.map((e) => VPDSComponent.toMap(e)).toList(),
    };
  }

  static String encode(VPDSLibrary library) =>
      json.encode(VPDSLibrary.toMap(library));
}