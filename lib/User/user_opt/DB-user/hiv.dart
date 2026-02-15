import 'package:hive/hive.dart';
part 'hiv.g.dart';

@HiveType(typeId: 0)
class User {
  @HiveField(0)
  final String name;

  @HiveField(1)
  final String email;

  @HiveField(2)
  final String role;

  User({required this.name, required this.email, required this.role});

  factory User.fromJson(Map<String, dynamic>? json) =>
      User(
        role: json?['role'] ?? '',
        name: json?['name'] ?? '',
        email: json?['email'] ?? '',
      );
}