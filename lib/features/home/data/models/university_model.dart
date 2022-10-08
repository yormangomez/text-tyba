class UniversityModel {
  UniversityModel({
    this.alphaTwoCode,
    this.domains,
    this.country,
    this.stateProvince,
    this.webPages,
    this.name,
  });

  String? alphaTwoCode;
  List<String>? domains;
  String? country;
  dynamic stateProvince;
  List<String>? webPages;
  String? name;

  factory UniversityModel.fromJson(Map<String, dynamic> json) =>
      UniversityModel(
        alphaTwoCode: json["alpha_two_code"],
        domains: List<String>.from(json["domains"].map((x) => x)),
        country: json["country"],
        stateProvince: json["state-province"],
        webPages: List<String>.from(json["web_pages"].map((x) => x)),
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "alpha_two_code": alphaTwoCode,
        "domains": List<dynamic>.from(domains!.map((x) => x)),
        "country": country,
        "state-province": stateProvince,
        "web_pages": List<dynamic>.from(webPages!.map((x) => x)),
        "name": name,
      };
}
