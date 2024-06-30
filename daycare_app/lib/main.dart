import 'package:flutter/material.dart';
import 'screen/login.dart';
import 'screen/register.dart';
import 'screen/activity_input.dart';
import 'screen/child_input.dart';
import 'screen/child_activities.dart';
import 'screen/login_selection.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DAYCARE APP',

      initialRoute: '/',
      routes: {
        '/': (context) => const LoginSelectionPage(),
        '/register': (context) => const RegisterPage(),
        '/login': (context) => const LoginPage(),
        '/home_caregiver': (context) => const ActivityInputPage(),
        '/home_parent': (context) => const ChildInputPage(),
        '/child_activities': (context) => const ChildActivitiesPage(          
          childName: '',
          childAge: 0,
          ),
      },
    );
  }
}
