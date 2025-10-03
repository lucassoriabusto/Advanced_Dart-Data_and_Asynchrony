import 'package:http/http.dart' as http;
import 'dart:convert';              // para jsonDecode

Future<Map<String, String>> fetchPost() async {

  var url = Uri.parse("https://jsonplaceholder.typicode.com/posts/1");
  var response = await http.get(url);

  if (response.statusCode == 200) {
    var data = jsonDecode(response.body);
    return {
      'title': data['title'].toString(),
      'body': data['body'].toString(),
    };
  } else {
    throw Exception("Error: ${response.statusCode}");
  }
}

void main() async {
  var post = await fetchPost();
  print(post);
}