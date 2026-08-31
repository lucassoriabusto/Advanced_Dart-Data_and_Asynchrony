import 'package:http/http.dart' as http;

Future get() async{
  var url = Uri.parse("https://jsonplaceholder.typicode.com/posts");
  var response = await http.get(url);

  if(response.statusCode == 200){
    return response.body;
  }else{
    return "Error: ${response.statusCode}";
  }
}

Future post(notesJson) async{
  var url = Uri.parse("https://jsonplaceholder.typicode.com/posts");
  var response = await http.post(
    url,
    headers: {
      "Content-Type": "application/json",
    },
    body: notesJson,
  );

  if(response.statusCode == 201) {
    return "Solicitud exitosa";
  }else{
    return "Error";
  }
}