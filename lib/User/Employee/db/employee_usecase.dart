import 'package:user_profile/User/Employee/domain/employee_entity.dart';
import 'package:user_profile/User/Employee/db/employee_datasource.dart';
import 'package:user_profile/User/Employee/domain/employee_mapper.dart';

class EmployeeUseCase {

  final EmployeeDatasource datasource;

  EmployeeUseCase(this.datasource);

  // Get all employees
  List<Employee> getEmployees() {
    final dtos = datasource.getEmployees();
    return dtos.map(EmployeeMapper.toEntity).toList();
  }

  // Add new employee
  Future<void> addEmployee(Employee employee) async {
    final dto = EmployeeMapper.toDto(employee);
    await datasource.addEmployee(dto);
  }
}
