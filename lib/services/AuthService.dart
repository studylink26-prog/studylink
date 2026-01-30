class AuthResult {
  final bool success;
  final String message;

  AuthResult({required this.success, required this.message});
}

class AuthService {
  get _auth => null;

  // Mock login function
  static Future<AuthResult> login(String email, String password) async {
    await Future.delayed(const Duration(seconds: 1)); // simulate API call

    // TEMP: allow any login
    if (email.isNotEmpty && password.isNotEmpty) {
      return AuthResult(success: true, message: 'Login successful');
    } else {
      return AuthResult(success: false, message: 'Email or password empty');
    }
  }

  // Mock password reset
  static Future<AuthResult> sendPasswordReset(String email) async {
    await Future.delayed(const Duration(seconds: 1)); // simulate API call

    if (email.isNotEmpty) {
      return AuthResult(success: true, message: 'Reset email sent');
    } else {
      return AuthResult(success: false, message: 'Please enter your email');
    }
  }

  // Optional: sign up / register
  static Future<AuthResult> register(String email, String password, String role) async {
    await Future.delayed(const Duration(seconds: 1));

    if (email.isNotEmpty && password.isNotEmpty && role.isNotEmpty) {
      return AuthResult(success: true, message: 'Registration successful');
    } else {
      return AuthResult(success: false, message: 'All fields are required');
    }
  }
  Future<void> signOut() async {
    try {
      await _auth.signOut();
    } catch (e) {
      print("Error signing out: $e");
    }
  }
}
