import 'package:flutter/material.dart';
import 'package:user_profile/User/user_prof.dart';
import 'User/DB/hiv.dart';
import 'package:hive_flutter/hive_flutter.dart';
// Adapter will be generated into `lib/User/db/hiv.g.dart` and included
// via the `part` directive in that file. No direct import needed here.

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(UserAdapter());
  await Hive.openBox<User>('users');
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
