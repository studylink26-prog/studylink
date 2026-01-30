import 'package:flutter/material.dart';
// These must match your folder names exactly
import 'screens/MentorHome.dart';

class StudyLinkApp extends StatelessWidget {
  const StudyLinkApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'StudyLink',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // Using standard blue to fix the AppColors error
        primarySwatch: Colors.blue,
      ),
      // Removed 'const' to fix the MentorHome error
      home: MentorHome(),
    );
  }
}