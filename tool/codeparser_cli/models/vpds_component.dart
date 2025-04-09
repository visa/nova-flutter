import 'dart:convert';
class Property {
  String name;
  String type;
  String? description;
  bool? isRequired;

  Property({
    required this.name,
    required this.type,
    this.description,
    this.isRequired,
  });

  static Map<String, dynamic> toMap(Property prop) => {
        'name': prop.name,
        'type': prop.type,
        'description': prop.description,
        'required': prop.isRequired,
      };
}

class Variant {
  String? name;
  String? description;
  String? path;
  String? snippet;

  Variant({
    required this.name,
    this.description,
    required this.path,
    required this.snippet,
  });

  static Map<String, dynamic> toMap(Variant variant) => {
        'name': variant.name,
        'description': variant.description,
        'path': variant.path,
        'snippet': variant.snippet,
      };
}

class VPDSComponent {
  String? name;
  String? description;
  String? library = 'flutter';
  List<Property> properties = [];
  List<Variant> variants = [];

  VPDSComponent({
    required this.name,
  });

  static Map<String, dynamic> toMap(VPDSComponent component) => {
        'name': component.name,
        'description': component.description,
        'library': component.library,
        'properties':
            component.properties.map((e) => Property.toMap(e)).toList(),
        'variants': component.variants.map((e) => Variant.toMap(e)).toList(),
      };

  static String encode(VPDSComponent component) =>
      json.encode(VPDSComponent.toMap(component));
}