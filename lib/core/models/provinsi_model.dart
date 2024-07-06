import 'dart:convert';

class ProvinsiResult {
  String code;
  String messages;
  List<ProvinsiModel> value;

  ProvinsiResult({
    required this.code,
    required this.messages,
    required this.value,
  });

  factory ProvinsiResult.fromRawJson(String str) =>
      ProvinsiResult.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ProvinsiResult.fromJson(Map<String, dynamic> json) => ProvinsiResult(
        code: json["code"],
        messages: json["messages"],
        value: List<ProvinsiModel>.from(
            json["value"].map((x) => ProvinsiModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "messages": messages,
        "value": List<dynamic>.from(value.map((x) => x.toJson())),
      };
}

class ProvinsiModel {
  String id;
  String name;

  ProvinsiModel({
    required this.id,
    required this.name,
  });

  factory ProvinsiModel.fromRawJson(String str) =>
      ProvinsiModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ProvinsiModel.fromJson(Map<String, dynamic> json) => ProvinsiModel(
        id: json["id"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
      };
}
