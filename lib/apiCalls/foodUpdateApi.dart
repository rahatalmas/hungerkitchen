import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:hungerkitchen/models/foodModel.dart';

Future<String> updateFoodFunc(UpdateFood food, int foodId) async {
  final url = Uri.parse('192.168.243.213:5000/hotel/foodupdate/${foodId}');

  try {
    final response = await http.put(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(food.toJson()),
    );

    if (response.statusCode == 200) {
      return 'Food updated successfully';
    } else {
      return 'Failed to update food: ${response.statusCode}';
    }
  } catch (e) {
    print('Error updating food: $e');
    return 'Failed to update food: $e';
  }
}
