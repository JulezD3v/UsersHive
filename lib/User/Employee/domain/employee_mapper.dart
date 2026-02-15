import 'package:user_profile/User/Employee/domain/employee_entity.dart';
import 'package:user_profile/User/Employee/db/employee_dto.dart';

class EmployeeMapper {

  static Employee toEntity(EmployeeDto dto) {
    return Employee(
      status: dto.status,
      name: dto.name,
      role: dto.role,
    );
  }

  static EmployeeDto toDto(Employee entity) {
    return EmployeeDto(
      status: entity.status,
      name: entity.name,
      role: entity.role,
    );
  }
}
