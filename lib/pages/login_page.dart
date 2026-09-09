import 'package:flutter/material.dart';

import '../routes/app_routes.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() {
    return _LoginPageState();
  }
}

class _LoginPageState extends State<LoginPage> {
  final loginController = TextEditingController();
  final passwordController = TextEditingController();

  bool showPassword = false;

  void login() {
    String login = loginController.text;
    String password = passwordController.text;

    if (login.isEmpty || password.isEmpty) {
      showMessage('Please enter phone/email and password');
    } else {
      Navigator.pushReplacementNamed(context, AppRoutes.twoStepAuth);
    }
  }

  void showMessage(String message) {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(message)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),

          child: Container(
            width: 420,

            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 35),

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
              mainAxisSize: MainAxisSize.min,

              children: [
                // ================= LOGO =================

                const Icon(Icons.cloud, size: 72, color: Color(0xFF1877F2)),

                const SizedBox(height: 8),

                const Text(
                  'OneCloud',
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF1877F2),
                    letterSpacing: -1,
                  ),
                ),

                const SizedBox(height: 2),

                const Text(
                  'Enterprise Platform',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF555555),
                  ),
                ),

                const SizedBox(height: 8),

                const Text(
                  'One Platform • Infinite Possibilities',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 13, color: Color(0xFF777777)),
                ),

                const SizedBox(height: 30),

                // ================= LOGIN TITLE =================
                const Align(
                  alignment: Alignment.centerLeft,

                  child: Text(
                    'Welcome Back',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF1C1E21),
                    ),
                  ),
                ),

                const SizedBox(height: 6),

                const Align(
                  alignment: Alignment.centerLeft,

                  child: Text(
                    'Login to access your account',
                    style: TextStyle(fontSize: 14, color: Color(0xFF65676B)),
                  ),
                ),

                const SizedBox(height: 25),

                // ================= EMAIL / PHONE =================
                TextField(
                  controller: loginController,

                  decoration: InputDecoration(
                    labelText: 'Phone Number or Email',

                    prefixIcon: const Icon(Icons.person_outline),

                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),

                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),

                      borderSide: const BorderSide(
                        color: Color(0xFF1877F2),
                        width: 2,
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 15),

                // ================= PASSWORD =================
                TextField(
                  controller: passwordController,

                  obscureText: !showPassword,

                  decoration: InputDecoration(
                    labelText: 'Password',

                    prefixIcon: const Icon(Icons.lock_outline),

                    suffixIcon: IconButton(
                      icon: Icon(
                        showPassword ? Icons.visibility : Icons.visibility_off,
                      ),

                      onPressed: () {
                        setState(() {
                          showPassword = !showPassword;
                        });
                      },
                    ),

                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),

                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),

                      borderSide: const BorderSide(
                        color: Color(0xFF1877F2),
                        width: 2,
                      ),
                    ),
                  ),
                ),

                // ================= FORGOT PASSWORD =================
                Align(
                  alignment: Alignment.centerRight,

                  child: TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, AppRoutes.forgotPassword);
                    },

                    child: const Text('Forgot Password?'),
                  ),
                ),

                const SizedBox(height: 8),

                // ================= LOGIN BUTTON =================
                SizedBox(
                  width: double.infinity,
                  height: 50,

                  child: ElevatedButton(
                    onPressed: login,

                    child: const Text('LOGIN'),
                  ),
                ),

                const SizedBox(height: 25),

                // ================= DIVIDER =================
                Row(
                  children: [
                    Expanded(child: Divider(color: Colors.grey[300])),

                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10),

                      child: Text(
                        'OR',
                        style: TextStyle(color: Colors.grey, fontSize: 12),
                      ),
                    ),

                    Expanded(child: Divider(color: Colors.grey[300])),
                  ],
                ),

                const SizedBox(height: 20),

                // ================= SIGN UP =================
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,

                  children: [
                    const Text(
                      "Don't have an account?",
                      style: TextStyle(color: Color(0xFF65676B)),
                    ),

                    TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, AppRoutes.signup);
                      },

                      child: const Text('Create Account'),
                    ),
                  ],
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
    loginController.dispose();
    passwordController.dispose();

    super.dispose();
  }
}
