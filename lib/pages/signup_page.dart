import 'package:flutter/material.dart';

import '../routes/app_routes.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage>
    with SingleTickerProviderStateMixin {
  // ================================================================
  // TEXT CONTROLLERS
  // ================================================================

  final TextEditingController nameController = TextEditingController();

  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  final TextEditingController confirmPasswordController =
      TextEditingController();

  // ================================================================
  // PASSWORD VISIBILITY
  // ================================================================

  bool obscurePassword = true;

  bool obscureConfirmPassword = true;

  // ================================================================
  // ANIMATION
  // ================================================================

  late AnimationController _animationController;

  late Animation<double> _fadeAnimation;

  late Animation<double> _logoScaleAnimation;

  late Animation<Offset> _contentSlideAnimation;

  // ================================================================
  // INIT STATE
  // ================================================================

  @override
  void initState() {
    super.initState();

    // Main animation controller
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 900),
    );

    // --------------------------------------------------------------
    // FADE
    // --------------------------------------------------------------

    _fadeAnimation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeOut,
    );

    // --------------------------------------------------------------
    // LOGO SCALE
    // --------------------------------------------------------------

    _logoScaleAnimation = Tween<double>(begin: 0.85, end: 1.0).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: const Interval(0.0, 0.45, curve: Curves.easeOutBack),
      ),
    );

    // --------------------------------------------------------------
    // CONTENT SLIDE
    // --------------------------------------------------------------

    _contentSlideAnimation =
        Tween<Offset>(begin: const Offset(0, 0.08), end: Offset.zero).animate(
          CurvedAnimation(
            parent: _animationController,
            curve: const Interval(0.15, 1.0, curve: Curves.easeOutCubic),
          ),
        );

    // Start animation
    _animationController.forward();
  }

  // ================================================================
  // CREATE ACCOUNT
  // ================================================================

  void createAccount() {
    if (nameController.text.isEmpty ||
        emailController.text.isEmpty ||
        passwordController.text.isEmpty ||
        confirmPasswordController.text.isEmpty) {
      showMessage('Please fill all details');
      return;
    }

    if (passwordController.text != confirmPasswordController.text) {
      showMessage('Passwords do not match');
      return;
    }

    showMessage('Account created successfully');

    // Go back to Login
    Future.delayed(const Duration(milliseconds: 700), () {
      if (!mounted) return;

      Navigator.pushReplacementNamed(context, AppRoutes.login);
    });
  }

  // ================================================================
  // GOOGLE
  // ================================================================

  void continueWithGoogle() {
    showMessage('Continue with Google selected');
  }

  // ================================================================
  // APPLE
  // ================================================================

  void continueWithApple() {
    showMessage('Continue with Apple selected');
  }

  // ================================================================
  // SHOW MESSAGE
  // ================================================================

  void showMessage(String message) {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(message)));
  }

  // ================================================================
  // DISPOSE
  // ================================================================

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();

    _animationController.dispose();

    super.dispose();
  }

  // ================================================================
  // BUILD
  // ================================================================

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4F8FC),

      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),

          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 430),

            // ========================================================
            // CARD ANIMATION
            // ========================================================
            child: FadeTransition(
              opacity: _fadeAnimation,

              child: SlideTransition(
                position: _contentSlideAnimation,

                child: Card(
                  elevation: 3,

                  color: Colors.white,

                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),

                  child: Padding(
                    padding: const EdgeInsets.all(32),

                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,

                      children: [
                        // ==================================================
                        // ONECLOUD LOGO
                        // ==================================================

                        ScaleTransition(
                          scale: _logoScaleAnimation,

                          child: const Icon(
                            Icons.cloud,
                            size: 55,
                            color: Color(0xFF1877F2),
                          ),
                        ),

                        const SizedBox(height: 8),

                        // ==================================================
                        // ONECLOUD
                        // ==================================================
                        const Text(
                          'OneCloud',

                          textAlign: TextAlign.center,

                          style: TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF1877F2),
                          ),
                        ),

                        const SizedBox(height: 4),

                        const Text(
                          'Enterprise Platform',

                          textAlign: TextAlign.center,

                          style: TextStyle(fontSize: 14, color: Colors.grey),
                        ),

                        const SizedBox(height: 30),

                        // ==================================================
                        // CREATE ACCOUNT
                        // ==================================================
                        const Text(
                          'Create Account',

                          textAlign: TextAlign.center,

                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        const SizedBox(height: 25),

                        // ==================================================
                        // FULL NAME
                        // ==================================================
                        TextField(
                          controller: nameController,

                          decoration: InputDecoration(
                            labelText: 'Full Name',

                            hintText: 'Enter your full name',

                            prefixIcon: const Icon(Icons.person_outline),

                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                        ),

                        const SizedBox(height: 16),

                        // ==================================================
                        // EMAIL
                        // ==================================================
                        TextField(
                          controller: emailController,

                          keyboardType: TextInputType.emailAddress,

                          decoration: InputDecoration(
                            labelText: 'Email',

                            hintText: 'Enter your email',

                            prefixIcon: const Icon(Icons.email_outlined),

                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                        ),

                        const SizedBox(height: 16),

                        // ==================================================
                        // PASSWORD
                        // ==================================================
                        TextField(
                          controller: passwordController,

                          obscureText: obscurePassword,

                          decoration: InputDecoration(
                            labelText: 'Password',

                            hintText: 'Create a password',

                            prefixIcon: const Icon(Icons.lock_outline),

                            suffixIcon: IconButton(
                              onPressed: () {
                                setState(() {
                                  obscurePassword = !obscurePassword;
                                });
                              },

                              icon: Icon(
                                obscurePassword
                                    ? Icons.visibility_outlined
                                    : Icons.visibility_off_outlined,
                              ),
                            ),

                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                        ),

                        const SizedBox(height: 16),

                        // ==================================================
                        // CONFIRM PASSWORD
                        // ==================================================
                        TextField(
                          controller: confirmPasswordController,

                          obscureText: obscureConfirmPassword,

                          decoration: InputDecoration(
                            labelText: 'Confirm Password',

                            hintText: 'Re-enter your password',

                            prefixIcon: const Icon(Icons.lock_outline),

                            suffixIcon: IconButton(
                              onPressed: () {
                                setState(() {
                                  obscureConfirmPassword =
                                      !obscureConfirmPassword;
                                });
                              },

                              icon: Icon(
                                obscureConfirmPassword
                                    ? Icons.visibility_outlined
                                    : Icons.visibility_off_outlined,
                              ),
                            ),

                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                        ),

                        const SizedBox(height: 24),

                        // ==================================================
                        // CREATE ACCOUNT BUTTON
                        // ==================================================
                        SizedBox(
                          height: 50,

                          child: ElevatedButton(
                            onPressed: createAccount,

                            child: const Text(
                              'CREATE ACCOUNT',

                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),

                        const SizedBox(height: 24),

                        // ==================================================
                        // OR
                        // ==================================================
                        Row(
                          children: [
                            Expanded(
                              child: Divider(color: Colors.grey.shade300),
                            ),

                            const Padding(
                              padding: EdgeInsets.symmetric(horizontal: 12),

                              child: Text(
                                'OR',

                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 13,
                                ),
                              ),
                            ),

                            Expanded(
                              child: Divider(color: Colors.grey.shade300),
                            ),
                          ],
                        ),

                        const SizedBox(height: 20),

                        // ==================================================
                        // GOOGLE
                        // ==================================================
                        SizedBox(
                          height: 50,

                          child: OutlinedButton(
                            onPressed: continueWithGoogle,

                            style: OutlinedButton.styleFrom(
                              backgroundColor: Colors.white,

                              side: BorderSide(color: Colors.grey.shade300),

                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),

                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,

                              children: [
                                const GoogleLogo(),

                                const SizedBox(width: 12),

                                const Text(
                                  'Continue with Google',

                                  style: TextStyle(
                                    color: Color(0xFF202124),

                                    fontSize: 15,

                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),

                        const SizedBox(height: 12),

                        // ==================================================
                        // APPLE
                        // ==================================================
                        SizedBox(
                          height: 50,

                          child: ElevatedButton(
                            onPressed: continueWithApple,

                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.black,

                              foregroundColor: Colors.white,

                              elevation: 0,

                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),

                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,

                              children: [
                                const Icon(
                                  Icons.apple,
                                  size: 25,
                                  color: Colors.white,
                                ),

                                const SizedBox(width: 10),

                                const Text(
                                  'Continue with Apple',

                                  style: TextStyle(
                                    color: Colors.white,

                                    fontSize: 15,

                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),

                        const SizedBox(height: 24),

                        // ==================================================
                        // BACK TO LOGIN
                        // ==================================================
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,

                          children: [
                            const Text('Already have an account? '),

                            TextButton(
                              onPressed: () {
                                Navigator.pushReplacementNamed(
                                  context,
                                  AppRoutes.login,
                                );
                              },

                              child: const Text('Login'),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// ====================================================================
// GOOGLE LOGO
// ====================================================================

class GoogleLogo extends StatelessWidget {
  const GoogleLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text(
      'G',

      style: TextStyle(
        fontSize: 23,
        fontWeight: FontWeight.bold,
        fontFamily: 'Arial',
        color: Color(0xFF4285F4),
      ),
    );
  }
}
