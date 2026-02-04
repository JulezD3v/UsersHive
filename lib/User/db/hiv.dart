import 'package:hive/hive.dart';
part 'main.g.dart';

@HiveType(typeId:1)
class User{
  @HiveField(0)
  String? name;

  @HiveField(1)
  String? email;

  @HiveField(2)
  String ?role;

  User({required this.email, required this.name, required this.role});
   factory User.fromJson(Map<String, String>? json) =>
   User (role: json?["role"]?? "", name: json?["name"]?? "", email: json?["email"]?? "");
}