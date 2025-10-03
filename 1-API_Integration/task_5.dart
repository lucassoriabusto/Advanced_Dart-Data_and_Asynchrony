import 'package:http/http.dart' as http;
import 'dart:convert';

Future<dynamic> getJsonResponse(String url) async{
  var uri = Uri.parse(url);
  var response = await http.get(uri);

  if(response.statusCode == 200){
    var data = jsonDecode(response.body);
    return data;
  }else{
    return throw Exception("Error: ${response.statusCode}");
  }
}

void main() async{
  var post = await getJsonResponse("https://jsonplaceholder.typicode.com/posts/1");
  print(post);
}