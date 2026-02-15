import 'package:hive/hive.dart';
import 'employee_dto.dart';

class EmployeeDataSource {

  final Box<EmployeeDto> box;

  EmployeeDataSource(this.box);

  Future<void> add(EmployeeDto dto) async {
    await box.put(dto.name, dto);
  }

  List<EmployeeDto> getAll() {
    return box.values.toList();
  }

  Future<void> delete(String id) async {
    await box.delete('names');
  }
}
// Only file that talks to hive