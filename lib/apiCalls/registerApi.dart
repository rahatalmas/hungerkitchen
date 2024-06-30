import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:hungerkitchen/models/hotelModel.dart';

Future<HotelRegisterResponse> hotelRegister(hotel_name,hotel_password,hotel_description,hotel_picture) async{
  String url = "http://192.168.243.213:5000/hotel/register";
  final response = await http.post(
      Uri.parse(url),
      headers:<String,String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body:jsonEncode(<String,String>{
        "hotel_name":hotel_name,
        "hotel_password":hotel_password,
        "hotel_description":hotel_description,
        "hotel_picture":hotel_picture
      })
  );
  if(response.statusCode == 200){
    return HotelRegisterResponse.formJson(jsonDecode(response.body));
  }
  throw Exception('login failed');
}