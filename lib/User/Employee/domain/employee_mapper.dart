import 'package:user_profile/User/Employee/domain/employee_entity.dart';
import 'package:user_profile/User/Employee/db/employee_dto.dart';

class EmployeeMapper {

  // Entity → DTO (for saving to Hive)
  static EmployeeDto toDto(Employee employee) {
    return EmployeeDto(
      name: employee.name,
      role: employee.role,
      status: employee.status.name, 
    );
  }

  // DTO → Entity (for reading from Hive)
  static Employee toEntity(EmployeeDto dto) {
    return Employee(
      name: dto.name,
      role: dto.role,
      status: EmployeeStatus.values.firstWhere(
        (e) => e.name == dto.status,
      ),
    );
  }
}

// 🧠 Why Not Just Use DTO Everywhere?
// Good question.
// Because:
// DTO = storage model
// Entity = business model
// If tomorrow:
// You stop using Hivwe
// You use Firebase instead

// Or a REST API

// Only your DTO & datasource change.

// Your UI and business logic stay clean.

// That’s the power of the mapper.
