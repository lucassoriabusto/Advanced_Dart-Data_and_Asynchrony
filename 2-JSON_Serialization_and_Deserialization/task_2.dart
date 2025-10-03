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

List<User> parseUsers(String jsonStr){
  List<User> newList = [];
  List<dynamic> listMap = jsonDecode(jsonStr);

  for(var i = 0; i < listMap.length; i++){
    newList.add(User.fromJson(listMap[i]));
  }
  return (newList);
}

void main(){
    String jsonString = '''[
    {"id": 1, "name": "Alice", "email": "alice@example.com"},
    {"id": 2, "name": "Bob", "email": "bob@example.com"},
    {"id": 3, "name": "Charlie", "email": "charlie@example.com"}
    ]''';
    
    List<User> users = parseUsers(jsonString);
    for (var user in users) {
    print('${user.id} - ${user.name} - ${user.email}');
  }
}
