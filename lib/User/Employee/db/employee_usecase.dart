import 'package:user_profile/User/Employee/domain/employee_entity.dart';
import 'package:user_profile/User/Employee/db/employee_datasource.dart';
import 'package:user_profile/User/Employee/domain/employee_mapper.dart';

class EmployeeUseCase {

  final EmployeeDataSource datasource;

  EmployeeUseCase(this.datasource);

  // Get all employees
  Future<List<Employee>> getEmployees() async {
    final dtos = await datasource.getEmployees();
    return dtos.map(EmployeeMapper.toEntity).toList();
  }

  // Add new employee
  Future<void> addEmployee(Employee employee) async {
    final dto = EmployeeMapper.toDto(employee);
    await datasource.addEmployee(dto);
  }
}

//what the app wants
//usecase makes transition to firebase muuuch easier