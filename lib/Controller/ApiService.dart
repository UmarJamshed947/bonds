import 'dart:convert';
import 'package:bonds/Models/Draw_Date.dart';
import 'package:bonds/Models/Bond_Type.dart';
import 'package:bonds/exceptions/app_exception.dart';
import 'package:http/http.dart' as http;
import '../Models/Range_Search.dart';
import '../Models/Search_Bond.dart';

class ApiService {
  final bool _loading = false;
  bool get loading => _loading;
  String Baseurl = 'https://prizebond.idev.im/api/v1/';

  Future<List<BondType>> fetchBondTypeData() async {
    var url = Uri.parse('${Baseurl}prize-bond-types');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      return jsonResponse.map((data) => BondType.fromJson(data)).toList();
    } else {
      throw Exception('Unexpected error occured!');
    }
  }


  //////////////////////////////////////////////////////////////////////////////////////////
  Future<List<DrawDate>> fetchDrawDateData(String drawuid) async {
    var url = Uri.parse('${Baseurl}draw/dates');

    Map<String, String> body = {
      'prize_bond_type_uid': drawuid,
    };

    final response = await postApiCall(url: url, body: body);

    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      return jsonResponse.map((data) => DrawDate.fromJson(data)).toList();
    } else {
      throw Exception('Unexpected error occured!');
    }
  }

  ///////////////////////////////////////////////////////////////////////////////////////////
  Future<List<SearchBond>> fetchSearchBondData(
      String prizeBondTypeUid, String drawuid, String prizeBond) async {
    // If drawuid is 'ALL', treat it as an empty string
    drawuid = (drawuid == 'ALL') ? '' : drawuid;

    Uri url = Uri.parse('${Baseurl}search/single');

    Map<String, String> body = {
      'prize_bond_type_uid': prizeBondTypeUid,
      'prize_bond_number': prizeBond,
    };

    // if (drawuid != '') {
    //   body['draw_uid'] = drawuid;
    // }
    if (drawuid.isNotEmpty) {
      body['draw_uid'] = drawuid;
    }

    final response = await postApiCall(url: url, body: body);

    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      return jsonResponse.map((data) => SearchBond.fromJson(data)).toList();
    } else {
      // Handle other status codes appropriately
      print("Error: ${response.statusCode}");
      return [];
    }
  }

  //////////////////////////////////////////////////////////////////////////////////////////
  Future<List<RangeSearch>> fetchRangeSearchData(String drawUid,  int firstNumber, int lastNumber, String prizeBondTypeUid) async {
   // drawUid = (drawUid == 'ALL') ? '' : drawUid;
    prizeBondTypeUid = (prizeBondTypeUid == 'ALL') ? '' : prizeBondTypeUid;
    final url = Uri.parse('https://prizebond.idev.im/api/v1/search/range');

    // Headers
    Map<String, String> headers = {
      'Accept': 'application/json',
    };
    print("drawUid");
    print(drawUid);
    print("prizeBondTypeUid");
    print(prizeBondTypeUid);

    // Body
    Map<String, dynamic> body = {
      'prize_bond_number_first': firstNumber.toString(),
      'prize_bond_number_last': lastNumber.toString(),
      'prize_bond_type_uid': drawUid,
    };
    if (prizeBondTypeUid.isNotEmpty) {
      body['draw_uid'] = prizeBondTypeUid;
    }

    try {
      final response = await http.post(
        url,
        headers: headers,
        body: body,
      );
      if (response.statusCode == 200) {
        // If the server returns a 200 OK response, parse the JSON
        final List<dynamic> jsonData = json.decode(response.body);
        List<RangeSearch> result = jsonData.map((data) => RangeSearch.fromJson(data)).toList();
        return result;
      } else {
        // If the server did not return a 200 OK response,
        // throw an exception with detailed error message
        print('Non-200 status code. Response body: ${response.body}');
        throw Exception('Failed to load data. Server returned status code ${response.statusCode}.');
      }
    } catch (error) {
      // Handle network or decoding errors
      print('Error: $error');
      throw Exception('Failed to load data. Error: $error');
    }
  }


  //////////////////////////////////////////////////////////////////////////////////////////
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



  Future<http.Response> postApiCall({required Uri url, required var body}) async {
    try {
      final response = await http.post(url, body: body);

      print(url);
      print(body);
      print(response.body);

      return response;
    } catch (e) {
      print("Error: $e");
      //return empty response
      return http.Response('Error: $e', 500);
    }
  }



  dynamic returnResponse(http.Response response) {
    switch (response.statusCode) {
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
        throw FetchException("Error occur during communication with server"
            "with status code ${response.statusCode.toString()}");
    }
  }



}
