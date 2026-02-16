import 'package:flutter_bloc/flutter_bloc.dart';
import 'employee_event.dart';
import 'employee_state.dart';
import 'package:user_profile/User/Employee/db/employee_usecase.dart';

class EmployeeBloc extends Bloc<EmployeeEvent, EmployeeState> {

  final EmployeeUseCase useCase;

  EmployeeBloc(this.useCase)
      : super(EmployeeState(employees: [])) {

    // When screen loads
    on<LoadEmployees>((event, emit) async {
      final employees = await useCase.getEmployees();
      emit(EmployeeState(employees: employees));
    });

    // When adding employee
    on<AddEmployee>((event, emit) async {
      await useCase.addEmployee(event.employee);
      final employees = await useCase.getEmployees();
      emit(EmployeeState(employees: employees));
    });
  }
}
