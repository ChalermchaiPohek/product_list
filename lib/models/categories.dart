import 'dart:convert';

Categories categoriesFromJson(String str) => Categories.fromJson(json.decode(str));

String categoriesToJson(Categories data) => json.encode(data.toJson());

class Categories {
  final String? slug;
  final String? name;
  final String? url;

  Categories({
    this.slug,
    this.name,
    this.url,
  });

  factory Categories.fromJson(Map<String, dynamic> json) => Categories(
    slug: json["slug"],
    name: json["name"],
    url: json["url"],
  );

  Map<String, dynamic> toJson() => {
    "slug": slug,
    "name": name,
    "url": url,
  };
}
