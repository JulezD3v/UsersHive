enum EmployeeStatus {
  active,
  onLeave,
  inactive,
}

class Employee {
  final EmployeeStatus status;
  final String name;
  final String role;

  Employee({
    required this.status,
    required this.name,
    required this.role,
  });
}
