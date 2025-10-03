import 'dart:convert';

class User{
    int id;
    String name;
    String email;

    User(this.id, this.name, this.email);

    // Constructor especial para deserializar
    User.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'],
        email = json['email'];

    Map<String, dynamic> toJson(){
      return {
        'id': id,
        'name': name,
        'email': email
      };
    }
}

void main(){
    String jsonString = '{"id": 1, "name": "Alice", "email": "alice@example.com"}';

    Map<String, dynamic> jsonMap = jsonDecode(jsonString);
    
    User user = User.fromJson(jsonMap);
    Map<String, dynamic> userMap = user.toJson();
    String encode = jsonEncode(userMap);
    print(encode);
}