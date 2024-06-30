import 'package:http/http.dart' as http;

Future<String> deleteOrder(int orderId) async {

  try {
    final response = await http.delete(
      Uri.parse('http://192.168.1.106:5000/order/delete/$orderId'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );

    if (response.statusCode == 200) {
      return 'Order deleted successfully';
    } else {
      return 'Failed to delete order: ${response.statusCode}';
    }
  } catch (e) {
    print('Error deleting order: $e');
    return 'Failed to delete order: $e';
  }
}