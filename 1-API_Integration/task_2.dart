import 'package:http/http.dart' as http;
import 'dart:convert';

Future<List<String>> fetchPostTitles() async {
  var url = Uri.parse("https://jsonplaceholder.typicode.com/posts");
  var response = await http.get(url);

  if (response.statusCode == 200) {
    var data = jsonDecode(response.body);
    List<String> titles = [];
    for(var i = 0; i < data.length; i++){
      titles.add(data[i]["title"].toString());
    }
    return titles;
  
  } else {
    throw Exception("Error: ${response.statusCode}");
  }
}

void main()async{
  var titles = await fetchPostTitles();
  print(titles);
}