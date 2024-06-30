import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:hungerkitchen/models/foodModel.dart';


Future<List<Food>> fetchFood(int hotelId) async {
  final url = Uri.parse('http://192.168.243.213:5000/hotel/foods/$hotelId');
  final response = await http.get(url);
  if(response.statusCode == 200){
    List<dynamic> jsonData = jsonDecode(response.body);
    print(jsonData);
    List<Food> foods = jsonData.map((json)=>Food.fromJson(json)).toList();
    return foods;
  } else {
    throw Exception('Failed to load foods');
  }
}



