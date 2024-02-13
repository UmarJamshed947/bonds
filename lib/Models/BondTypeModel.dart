
import 'dart:convert';

List<BondType> bondTypeFromJson(String str) => List<BondType>.from(json.decode(str).map((x) => BondType.fromJson(x)));

String bondTypeToJson(List<BondType> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class BondType {
  String prizeBondTypeUid;
  String name;
  int amount;
  int firstPrize;
  int secondPrize;
  int thirdPrize;
  int premium;

  BondType({
    required this.prizeBondTypeUid,
    required this.name,
    required this.amount,
    required this.firstPrize,
    required this.secondPrize,
    required this.thirdPrize,
    required this.premium,
  });

  factory BondType.fromJson(Map<String, dynamic> json) => BondType(
    prizeBondTypeUid: json["prize_bond_type_uid"],
    name: json["name"],
    amount: json["amount"],
    firstPrize: json["first_prize"],
    secondPrize: json["second_prize"],
    thirdPrize: json["third_prize"],
    premium: json["premium"],
  );

  Map<String, dynamic> toJson() => {
    "prize_bond_type_uid": prizeBondTypeUid,
    "name": name,
    "amount": amount,
    "first_prize": firstPrize,
    "second_prize": secondPrize,
    "third_prize": thirdPrize,
    "premium": premium,
  };
}
