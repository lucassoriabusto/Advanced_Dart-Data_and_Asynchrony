import 'package:http/http.dart' as http;
import 'dart:convert';

Future<int> sendPost() async {
  try {
    var url = Uri.parse("https://jsonplaceholder.typicode.com/posts");
    var data = {
      "title": "Hello",
      "body": "This is a test post",
      "userId": 1
      };

    var response = await http.post(
      url,
      headers: {'Content-type': 'application/json; charset=UTF-8'},
      body: jsonEncode(data), // Convertir map de Dart a JSON
    );

    if (response.statusCode == 201) {
      var decode = jsonDecode(response.body);
      return decode["id"];
    } else {
      throw Exception("Error en POST: ${response.statusCode}");
    }
  } catch (e){
    throw Exception("Error de red o inesperado: $e");
  }
}

void main() async {
  var result = await sendPost();
  print(result);
}