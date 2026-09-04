import 'package:http/http.dart' as http;

Future get() async{
  try {
    var url = Uri.parse("https://jsonplaceholder.typicode.com/posts");
    var response = await http.get(url);

    if(response.statusCode == 200){
      return response.body;
    }else{
      throw Exception ("Error in request: ${response.statusCode}");
    }
  } catch (error) {
    print("Error making the request: $error");
    return "[]";
  }
}

Future post(notesJson) async{
  try {
    var url = Uri.parse("https://jsonplaceholder.typicode.com/posts");
    var response = await http.post(
      url,
      headers: {
        "Content-Type": "application/json",
      },
      body: notesJson,
    );

    if(response.statusCode == 201) {
      return "Request successful";
    }else{
      throw Exception("Error sending data: ${response.statusCode}");
    }
  } catch (error) {
    return "Error sending data: $error";
  }
}