import 'package:flutter/material.dart';
import 'package:studylink/screens/ForgotPassword.dart';
import 'package:studylink/screens/LogIn.dart';
import 'theme/theme.dart';
import 'screens/LogIn.dart';
import 'screens/role_screen.dart';
import 'screens/ForgotPassword.dart';
import 'screens/student_request_screen.dart';
import 'screens/MentorHome.dart';
import 'screens/Chat.dart';
import 'screens/admin_screen.dart';

class StudyLinkApp extends StatelessWidget {
  const StudyLinkApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'StudyLink',
      theme: appTheme, // from theme/theme.dart
      initialRoute: '/login',
      routes: {
        '/login': (context) => const LoginScreen(),
        '/role_screen': (context) => const RoleScreen(),
        '/forgot_password': (context) => const ForgotPasswordScreen(),
        '/student_request_screen': (context) => const StudentRequestScreen(),
        '/mentor_home_screen': (context) => const MentorHomeScreen(),
        '/chat_screen': (context) => const ChatScreen(),
        '/admin_screen': (context) => const AdminScreen(),
      },
    );
  }
}
