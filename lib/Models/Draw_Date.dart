// To parse this JSON data, do
//
//     final drawDate = drawDateFromJson(jsonString);

import 'dart:convert';

List<DrawDate> drawDateFromJson(String str) => List<DrawDate>.from(json.decode(str).map((x) => DrawDate.fromJson(x)));

String drawDateToJson(List<DrawDate> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class DrawDate {
  String drawUid;
  String drawNumber;
  DateTime date;
  String heldAt;

  DrawDate({
    required this.drawUid,
    required this.drawNumber,
    required this.date,
    required this.heldAt,
  });

  factory DrawDate.fromJson(Map<String, dynamic> json) => DrawDate(
    drawUid: json["draw_uid"],
    drawNumber: json["draw_number"],
    date: DateTime.parse(json["date"]),
    heldAt: json["held_at"],
  );

  Map<String, dynamic> toJson() => {
    "draw_uid": drawUid,
    "draw_number": drawNumber,
    "date": "${date.year.toString().padLeft(4, '0')}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}",
    "held_at": heldAt,
  };
}
