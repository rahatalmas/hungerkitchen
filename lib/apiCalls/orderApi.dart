import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:hungerkitchen/models/orderModel.dart';

Future<List<Order>> fetchOrders(int hotelId) async {
  final url = Uri.parse('http://192.168.1.106:5000/hotel/orders/$hotelId');

  try {
    final response = await http.get(url);

    if (response.statusCode == 200) {
      List<dynamic> jsonOrders = jsonDecode(response.body);
      print(jsonOrders);
      List<Order> orders = jsonOrders.map((json) => Order.fromJson(json)).toList();
      print(orders);
      return orders;
    } else {
      throw Exception('Failed to load orders');
    }
  } catch (e) {
    throw Exception('Error api : $e');
  }
}
