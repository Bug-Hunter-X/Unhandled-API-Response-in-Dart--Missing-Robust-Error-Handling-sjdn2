```dart
Future<void> fetchData() async {
  try {
    final response = await http.get(Uri.parse('https://api.example.com/data'));
    if (response.statusCode == 200) {
      // Assuming the response body is a JSON list
      final List<dynamic> data = jsonDecode(response.body);
      // Process the data
      for (final item in data) {
        print(item['name']); // Accessing 'name' property
      }
    } else {
      throw Exception('Failed to load data: ${response.statusCode}');
    }
  } catch (e) {
    print('Error: $e');
    // Handle the error appropriately (e.g., show an error message to the user)
  }
}
```