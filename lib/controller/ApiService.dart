import 'dart:convert';
import 'dart:io';


import 'package:bonds/Models/BondDrawDate.dart';
import 'package:bonds/Models/BondTypeModel.dart';
import 'package:bonds/exceptions/app_exception.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';



class ApiService{

  bool _loading = false;
  bool get loading => _loading;


  String Baseurl= 'https://prizebond.idev.im/api/v1/';




  Future<List<BondType>> fetchBondTypeData() async {
    var url = Uri.parse(Baseurl+'prize-bond-types');
    final response = await http.get(url);
    print(response.body);
    print("Responasse");
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
    print(response.body);
    print("Responasse");
    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      return jsonResponse.map((data) => DrawDate.fromJson(data)).toList();
    } else {
      throw Exception('Unexpected error occured!');
    }
  }

/*
  Future<List<AllResturantModel>> AllResturant() async {
    var url = Uri.parse(Baseurl+'Restaurants');
    final response = await http.post(url);
    print(response.body);
    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      return jsonResponse.map((data) => AllResturantModel.fromJson(data)).toList();
    } else {
      throw Exception('Unexpected error occured!');
    }
  }

  Future<List<AllProductsModel>> AllProducts(String categoryid ,context) async {
    var url = Uri.parse(Baseurl+'Categories/Products?categoryid=$categoryid');
    final response = await http.post(url);
    print(response.body);
    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      return jsonResponse.map((data) => AllProductsModel.fromJson(data)).toList();
    } else {
      throw Exception('Unexpected error occured!');
    }
  }

  Future<List<PopularModel>> fetchPopularData() async {
    var url = Uri.parse(Baseurl+'Populars');
    final response = await http.post(url);
    print(response.body);
    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      return jsonResponse.map((data) => PopularModel.fromJson(data)).toList();
    } else {
      throw Exception('Unexpected error occured!');
    }
  }

  Future<List<ItemsModel>> fetchAllitemsData(String restaurantid ,context) async {
    var url = Uri.parse(Baseurl+'Shops/Products?restaurantid=$restaurantid');
    final response = await http.post(url);
    print(response.body);
    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      return jsonResponse.map((data) => ItemsModel.fromJson(data)).toList();
    } else {
      throw Exception('Unexpected error occured!');
    }
  }

  Future<ProfileModel> UserProfilePostApi(context) async{
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    _loading = true;
    ProfileModel responseJson;
    try{
      String? token = sharedPreferences.getString("token");
      print(token);
      Response response = await http.post(Uri.parse("hhttp://prestigesolution.co/projects/hsd/public/admin/profile?token=$token"),
      ).timeout(const Duration(seconds: 50));
      responseJson = ProfileModel.fromJson(jsonDecode(response.body));
      print(responseJson);
    }
    on SocketException {
      throw FetchException("No internet Connection");
    }
    catch(e)
    {
      throw e;
    }
    return responseJson;

  }*/



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