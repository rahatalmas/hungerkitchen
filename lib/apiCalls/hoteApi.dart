import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:hungerkitchen/models/hotelModel.dart';
import 'package:hungerkitchen/url.dart';

Future<Hotel?> fetchHotelDetails(int hotelId) async {
  final url = Uri.parse("$baseUrl/hotel/$hotelId"); // Replace with your actual API endpoint
  try {
    final response = await http.get(url);
    if (response.statusCode == 200) {
      return Hotel.fromJson(jsonDecode(response.body)['hotel']);
    } else {
      throw Exception('Failed to load hotel details');
    }
  } catch (e) {
    print('Error fetching hotel details: $e');
    return null;
  }
}
