import 'package:hungerkitchen/url.dart';
import 'package:http/http.dart' as http;

Future<String> deleteFood(int foodId) async {
  try {
    final response = await http.delete(
      Uri.parse('$baseUrl/hotel/$foodId'),
    );

    if(response.statusCode == 200) {
      return 'Food deleted successfully';
    }else if (response.statusCode == 400) {
      return 'Can not delete, This Food Exist In Order List';
    }else {
      return 'Failed to delete food';
    }
    
  } catch (e) {
    print('Error deleting food: $e');
    return 'Failed to delete food';
  }
}
