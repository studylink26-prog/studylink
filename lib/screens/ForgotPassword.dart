import 'package:flutter/material.dart';
import '../widgets/AppButton.dart';
import '../services/AuthService.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final TextEditingController _emailController = TextEditingController();
  bool _isSending = false;

  void _sendResetEmail() async {
    setState(() => _isSending = true);

    final result = await AuthService.sendPasswordReset(_emailController.text);

    setState(() => _isSending = false);

    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(result.message)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Forgot Password')),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _emailController,
              decoration: const InputDecoration(labelText: 'Enter your email'),
            ),
            const SizedBox(height: 20),
            AppButton(
              text: _isSending ? 'Sending...' : 'Send Reset Email',
              onPressed: _isSending ? null : _sendResetEmail,
            ),
          ],
        ),
      ),
    );
  }
}
