import 'package:flutter/material.dart';
import 'package:user_profile/User/Employee/db/employee_dto.dart';
import 'package:user_profile/User/user_opt/user_prof.dart';
import 'User/user_opt/DB-user/hiv.dart';
import 'package:hive_flutter/hive_flutter.dart';
// Adapter will be generated into `lib/User/db/hiv.g.dart` and included
// via the `part` directive in that file. No direct import needed here.

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(UserAdapter());
  Hive.registerAdapter(EmployeeDtoAdapter());

  await Hive.openBox<User>('users');
  await Hive.openBox<EmployeeDto>('employees');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: ProfileSettingsPage(),
    );
  }
}
