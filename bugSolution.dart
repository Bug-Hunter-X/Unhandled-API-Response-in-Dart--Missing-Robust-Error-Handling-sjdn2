```dart
import 'dart:convert';
import 'package:http/http.dart' as http;

Future<void> fetchData() async {
  try {
    final response = await http.get(Uri.parse('https://api.example.com/data'));
    if (response.statusCode == 200) {
      try {
        final jsonData = jsonDecode(response.body);
        if (jsonData is List) {
          for (final item in jsonData) {
            if (item is Map && item.containsKey('name')) {
              print(item['name']);
            } else {
              print('Invalid data format: $item');
            }
          }
        } else {
          print('Unexpected data format: $jsonData');
        }
      } catch (e) {
        print('Error decoding JSON: $e');
      }
    } else {
      print('API request failed with status: ${response.statusCode}');
    }
  } catch (e) {
    print('Error fetching data: $e');
  }
}
```