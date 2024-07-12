import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:hungerkitchen/models/orderModel.dart';
import 'package:hungerkitchen/url.dart';

Future<List<Order>> fetchOrders(int hotelId) async {
  final url = Uri.parse('$baseUrl/hotel/orders/$hotelId');

  try {
    final response = await http.get(url);
    if (response.statusCode == 200) {
      List<dynamic> jsonOrders = jsonDecode(response.body);
      print("fetching order");
      List<Order> orders = jsonOrders.map((json) => Order.fromJson(json)).toList();
      return orders;
    } else {
      throw Exception('Failed to load orders');
    }
  } catch (e) {
    throw Exception('Error api : $e');
  }
}
