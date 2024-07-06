import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:hungerkitchen/models/hotelModel.dart';
import 'package:hungerkitchen/url.dart';

Future<HotelLoginResponse> hotelLogin(hotel_name,hotel_password) async{
  String url = "$baseUrl/hotel/login";
  final response = await http.post(
      Uri.parse(url),
      headers:<String,String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body:jsonEncode(<String,String>{
        "hotel_name":hotel_name,
        "hotel_password":hotel_password
      })
  );
  if(response.statusCode == 200){
    return HotelLoginResponse.formJson(jsonDecode(response.body));
  }
  throw Exception('login failed');
}