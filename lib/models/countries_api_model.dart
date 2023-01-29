// // To parse this JSON data, do
// //
// //     final welcome1 = welcome1FromJson(jsonString);


// class ApiModel {
//     ApiModel({
//         this.code,
//         this.name,
//         this.phone,
//         this.continent,
//         this.capital,
//         this.currency,
//         this.emoji,
//     });

//     String? code;
//     String? name;
//     String? phone;
//     Continent? continent;
//     String? capital;
//     String? currency;
//     String? emoji;

//     factory ApiModel.fromJson(Map<String, dynamic> json) => ApiModel(
//         code: json["code"],
//         name: json["name"],
//         phone: json["phone"],
//         continent: Continent.fromJson(json["continent"]),
//         capital: json["capital"],
//         currency: json["currency"],
//         emoji: json["emoji"],
//     );

//     Map<String, dynamic> toJson() => {
//         "code": code,
//         "name": name,
//         "phone": phone,
//         "continent": continent!.toJson(),
//         "capital": capital,
//         "currency": currency,
//         "emoji": emoji,
//     };
// }

// class Continent {
//     Continent({
//         this.code,
//         this.name,
//     });

//     String? code;
//     String? name;

//     factory Continent.fromJson(Map<String, dynamic> json) => Continent(
//         code: json["code"],
//         name: json["name"],
//     );

//     Map<String, dynamic> toJson() => {
//         "code": code,
//         "name": name,
//     };
// }
