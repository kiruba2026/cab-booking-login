import 'package:flutter/material.dart';

import '../routes/app_routes.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({super.key});

  @override
  State<ForgotPasswordPage> createState() {
    return _ForgotPasswordPageState();
  }
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  final accountController = TextEditingController();

  void resetPassword() {
    String account = accountController.text;

    if (account.isEmpty) {
      showMessage('Please enter phone number or email');
    } else {
      showMessage('Password reset request submitted');
    }
  }

  void showMessage(String message) {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(message)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Forgot Password')),

      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),

          child: Container(
            width: 420,

            padding: const EdgeInsets.all(30),

            decoration: BoxDecoration(
              color: Colors.white,

              borderRadius: BorderRadius.circular(12),

              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.08),
                  blurRadius: 20,
                  offset: const Offset(0, 8),
                ),
              ],
            ),

            child: Column(
              children: [
                // ================= LOGO =================

                const Icon(Icons.cloud, size: 65, color: Color(0xFF1877F2)),

                const SizedBox(height: 8),

                const Text(
                  'OneCloud',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF1877F2),
                  ),
                ),

                const Text(
                  'Enterprise Platform',
                  style: TextStyle(
                    color: Color(0xFF555555),
                    fontWeight: FontWeight.w600,
                  ),
                ),

                const SizedBox(height: 30),

                // ================= TITLE =================
                const Text(
                  'Forgot Password?',
                  style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
                ),

                const SizedBox(height: 8),

                const Text(
                  'Enter your phone number or email',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Color(0xFF65676B)),
                ),

                const SizedBox(height: 25),

                // ================= ACCOUNT =================
                TextField(
                  controller: accountController,

                  decoration: InputDecoration(
                    labelText: 'Phone Number or Email',

                    prefixIcon: const Icon(Icons.person_outline),

                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),

                const SizedBox(height: 25),

                // ================= RESET BUTTON =================
                SizedBox(
                  width: double.infinity,
                  height: 50,

                  child: ElevatedButton(
                    onPressed: resetPassword,

                    child: const Text('RESET PASSWORD'),
                  ),
                ),

                const SizedBox(height: 15),

                // ================= BACK TO LOGIN =================
                TextButton(
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, AppRoutes.login);
                  },

                  child: const Text('Back to Login'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    accountController.dispose();

    super.dispose();
  }
}
