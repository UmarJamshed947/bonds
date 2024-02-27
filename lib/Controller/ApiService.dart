import 'dart:convert';
import 'dart:io';


import 'package:bonds/Models/Draw_Date.dart';
import 'package:bonds/Models/Bond_Type.dart';
import 'package:bonds/exceptions/app_exception.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

import '../Models/Search_Bond.dart';



class ApiService{

  bool _loading = false;
  bool get loading => _loading;


  String Baseurl= 'https://prizebond.idev.im/api/v1/';




  Future<List<BondType>> fetchBondTypeData() async {

    var url = Uri.parse(Baseurl+'prize-bond-types');
    final response = await http.get(url);
    print(response.body);
    print("Response");
    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      return jsonResponse.map((data) => BondType.fromJson(data)).toList();
    } else {
      throw Exception('Unexpected error occured!');
    }
  }

  Future<List<DrawDate>> fetchDrawDateData(String drawuid ) async {

    var url = Uri.parse(Baseurl+'draw/dates?prize_bond_type_uid=$drawuid');
    final response = await http.post(url);
    // print(response.body);
    // print("dateresponse");
    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      return jsonResponse.map((data) => DrawDate.fromJson(data)).toList();
    } else {
      throw Exception('Unexpected error occured!');
    }
  }

  // Future<List<SearchBond>> fetchSearchBondData(String drawuid, String prizeBond ) async {
  //
  //   var url = Uri.parse('$Baseurl/search/single?draw_uid=$drawuid&prize_bond_number=$prizeBond');
  //   final response = await http.post(url);
  //   print(response.body);
  //   print("Search Response");
  //   if (response.statusCode == 200) {
  //     List jsonResponse = json.decode(response.body);
  //     return jsonResponse.map((data) => SearchBond.fromJson(data)).toList();
  //   } else {
  //     throw Exception('Unexpected error occured!');
  //   }
  // }
  Future<List<SearchBond>> fetchSearchBondData(String drawuid, String prizeBond) async {
    try {
      var url = Uri.parse(Baseurl+'search/single?draw_uid=$drawuid&prize_bond_number=$prizeBond');
      final response = await http.post(url);

      print(response.body);
      print("Search Response");

      if (response.statusCode == 200) {
        List jsonResponse = json.decode(response.body);
        return jsonResponse.map((data) => SearchBond.fromJson(data)).toList();
      } else {
        // Handle other status codes appropriately
        print("Error: ${response.statusCode}");
        return []; // or throw an exception with a meaningful message
      }
    } catch (e) {
      // Handle other exceptions
      print("Error: $e");
      return []; // or throw an exception with a meaningful message
    }
  }






  dynamic returnResponse(http.Response response){
    switch(response.statusCode){
      case 200:
        dynamic responseJson = jsonDecode(response.body);
        return responseJson;
      case 601:
        throw BadRequestException(jsonDecode(response.body.toString()));
      case 602:
        throw UnAuthorisedRequest(jsonDecode(response.body.toString()));
      case 601:
        throw UnAuthorisedRequest(jsonDecode(response.body.toString()));
      default:
        throw FetchException("Error occur during communication with server"+ "with status code ${response.statusCode.toString()}");
    }
  }
}