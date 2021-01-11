import 'dart:convert';

Sticker userFromJson(String str) => Sticker.fromJson(json.decode(str));

String userToJson(Sticker data) => json.encode(data.toJson());

class Sticker {
  String useremail;
  String name;
  String package;

  Sticker({this.useremail, this.name, this.package});

  factory Sticker.fromJson(Map<String, dynamic> json) => Sticker(
        useremail: json["useremail"],
        name: json["name"],
        package: json["package"],
      );

  Map<String, dynamic> toJson() => {
        "useremail": useremail,
        "name": name,
        "package": package,
      };
}
