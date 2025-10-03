// To generate the task_4.g.dart file, run the following command in your terminal:
// dart run build_runner build
import 'package:json_annotation/json_annotation.dart';

part 'task_4.g.dart';

@JsonSerializable()
class User{
  final int id;
  final String name;
  final String email;

  User(this.id, this.name, this.email);

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
  Map<String, dynamic> toJson() => _$UserToJson(this);
}


void main() {
  User user = User(1, "Lucas", "lucas@email.com");
  print(user.toJson());
}
