// To parse this JSON data, do
//
//     final searchBond = searchBondFromJson(jsonString);

import 'dart:convert';

List<SearchBond> searchBondFromJson(String str) => List<SearchBond>.from(json.decode(str).map((x) => SearchBond.fromJson(x)));

String searchBondToJson(List<SearchBond> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class SearchBond {
  String drawUid;
  String drawNumber;
  DateTime drawDate;
  String heldAt;
  String prizeBondNumber;
  String prizeBondType;
  int prizeBondAmount;
  int prizeType;
  String prize;
  int prizeAmount;

  SearchBond({
    required this.drawUid,
    required this.drawNumber,
    required this.drawDate,
    required this.heldAt,
    required this.prizeBondNumber,
    required this.prizeBondType,
    required this.prizeBondAmount,
    required this.prizeType,
    required this.prize,
    required this.prizeAmount,
  });

  factory SearchBond.fromJson(Map<String, dynamic> json) => SearchBond(
    drawUid: json["draw_uid"],
    drawNumber: json["draw_number"],
    drawDate: DateTime.parse(json["draw_date"]),
    heldAt: json["held_at"],
    prizeBondNumber: json["prize_bond_number"],
    prizeBondType: json["prize_bond_type"],
    prizeBondAmount: json["prize_bond_amount"],
    prizeType: json["prize_type"],
    prize: json["prize"],
    prizeAmount: json["prize_amount"],
  );

  Map<String, dynamic> toJson() => {
    "draw_uid": drawUid,
    "draw_number": drawNumber,
    "draw_date": "${drawDate.year.toString().padLeft(4, '0')}-${drawDate.month.toString().padLeft(2, '0')}-${drawDate.day.toString().padLeft(2, '0')}",
    "held_at": heldAt,
    "prize_bond_number": prizeBondNumber,
    "prize_bond_type": prizeBondType,
    "prize_bond_amount": prizeBondAmount,
    "prize_type": prizeType,
    "prize": prize,
    "prize_amount": prizeAmount,
  };
}
