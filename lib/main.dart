import 'package:flutter/material.dart';
import 'package:user_profile/User/user_prof.dart';
import 'User/db/hiv.dart';
import'package:hive/hive.dart';

void main() {
  var path = Directory.current.path;
  Hive
    ..init(path)
    ..registerAdapter(UserAdapter());

  runApp(const MyApp());

}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: .fromSeed(seedColor: Colors.deepPurple),
      ),
      home: ProfileSettingsPage(),
    );
  }
}
