//import'package:flutter/material.dart';
import'package:hive/hive.dart';

part 'employee_dto.g.dart';

@HiveType(typeId: 0)
class EmployeeDto extends HiveObject{
  @HiveField(0)
  final String name;

  @HiveField(1)
  final String role;

  @HiveField(2)
  final String status;

  EmployeeDto({
    required this.name,
    required this.role,
    required this.status,
  });
}