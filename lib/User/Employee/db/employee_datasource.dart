import 'package:hive/hive.dart';
import 'employee_dto.dart';

class EmployeeDataSource {
  final Box<EmployeeDto> box;

  EmployeeDataSource(this.box);

  Future<void> addEmployee(EmployeeDto dto) async {
    await box.put(dto.name, dto);
  }

  Future<List<EmployeeDto>> getEmployees() async {
    return box.values.toList();
  }

  Future<void> deleteEmployee(String name) async {
    await box.delete(name);
  }
}