import 'package:http/http.dart' as http;
import 'package:hungerkitchen/url.dart';

Future<String> deleteOrder(int orderId) async {

  try {
    final response = await http.delete(
      Uri.parse('$baseUrl/order/delete/$orderId'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );

    if (response.statusCode == 200) {
      print(response.statusCode);
      return 'Order deleted successfully';
    } else {
      return 'Failed to delete order: ${response.statusCode}';
    }
  } catch (e) {
    print('Error deleting order: $e');
    return 'Failed to delete order: $e';
  }
}