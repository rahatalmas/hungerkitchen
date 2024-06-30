import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:hungerkitchen/models/foodModel.dart';

Future<void> uploadFood(UploadFood food, int hotelId) async {
  final url = Uri.parse('http://192.168.1.106:5000/hotel/foodupload/$hotelId');

  try {
    final response = await http.post(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(food.toJson()),
    );

    if (response.statusCode == 201) {
      print('Food uploaded successfully');
    } else {
      print('Failed to upload food: ${response.statusCode}');
    }
  } catch (e) {
    print('Error uploading food: $e');
  }
}
