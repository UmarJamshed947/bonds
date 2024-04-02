import 'dart:convert';

List<SecFeatures> secFeaturesFromJson(String str) => List<SecFeatures>.from(json.decode(str).map((x) => SecFeatures.fromJson(x)));

String secFeaturesToJson(List<SecFeatures> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class SecFeatures {
  String feature;
  String? description;
  String image;

  SecFeatures({
    required this.feature,
    required this.description,
    required this.image,
  });

  factory SecFeatures.fromJson(Map<String, dynamic> json) => SecFeatures(
    feature: json["feature"],
    description: json["description"],
    image: json["image"],
  );

  Map<String, dynamic> toJson() => {
    "feature": feature,
    "description": description,
    "image": image,
  };
}
