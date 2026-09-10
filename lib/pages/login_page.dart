import 'package:flutter/material.dart';

import '../routes/app_routes.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage>
    with SingleTickerProviderStateMixin {
  // ================================================================
  // TEXT CONTROLLERS
  // ================================================================

  final TextEditingController usernameController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  // ================================================================
  // LOGIN STATE
  // ================================================================

  bool rememberMe = false;
  bool obscurePassword = true;

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
    // FADE ANIMATION
    // --------------------------------------------------------------

    _fadeAnimation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeOut,
    );

    // --------------------------------------------------------------
    // LOGO SCALE ANIMATION
    // --------------------------------------------------------------

    _logoScaleAnimation = Tween<double>(begin: 0.85, end: 1.0).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: const Interval(0.0, 0.45, curve: Curves.easeOutBack),
      ),
    );

    // --------------------------------------------------------------
    // CONTENT SLIDE ANIMATION
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
  // LOGIN
  // ================================================================

  void login() {
    if (usernameController.text.isEmpty || passwordController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please enter username and password')),
      );

      return;
    }

    Navigator.pushReplacementNamed(context, AppRoutes.twoStepAuth);
  }

  // ================================================================
  // GOOGLE LOGIN
  // ================================================================

  void continueWithGoogle() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Continue with Google selected')),
    );
  }

  // ================================================================
  // APPLE LOGIN
  // ================================================================

  void continueWithApple() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Continue with Apple selected')),
    );
  }

  // ================================================================
  // DISPOSE
  // ================================================================

  @override
  void dispose() {
    usernameController.dispose();
    passwordController.dispose();

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
                        // ONECLOUD NAME
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
                        // WELCOME BACK
                        // ==================================================
                        const Text(
                          'Welcome Back',

                          textAlign: TextAlign.center,

                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        const SizedBox(height: 25),

                        // ==================================================
                        // USERNAME
                        // ==================================================
                        TextField(
                          controller: usernameController,

                          keyboardType: TextInputType.emailAddress,

                          decoration: InputDecoration(
                            labelText: 'Username or Email',

                            hintText: 'Enter username or email',

                            prefixIcon: const Icon(Icons.person_outline),

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

                            hintText: 'Enter password',

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

                        const SizedBox(height: 8),

                        // ==================================================
                        // REMEMBER ME
                        // ==================================================
                        Row(
                          children: [
                            Checkbox(
                              value: rememberMe,

                              activeColor: const Color(0xFF1877F2),

                              onChanged: (value) {
                                setState(() {
                                  rememberMe = value ?? false;
                                });
                              },
                            ),

                            const Text(
                              'Remember me',

                              style: TextStyle(fontSize: 14),
                            ),

                            const Spacer(),

                            TextButton(
                              onPressed: () {
                                Navigator.pushNamed(
                                  context,
                                  AppRoutes.forgotPassword,
                                );
                              },

                              child: const Text('Forgot Password?'),
                            ),
                          ],
                        ),

                        const SizedBox(height: 12),

                        // ==================================================
                        // LOGIN BUTTON
                        // ==================================================
                        SizedBox(
                          height: 50,

                          child: ElevatedButton(
                            onPressed: login,

                            child: const Text(
                              'LOGIN',

                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),

                        const SizedBox(height: 24),

                        // ==================================================
                        // OR DIVIDER
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
                        // GOOGLE BUTTON
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
                        // APPLE BUTTON
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
                        // SIGN UP
                        // ==================================================
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,

                          children: [
                            const Text("Don't have an account? "),

                            TextButton(
                              onPressed: () {
                                Navigator.pushNamed(context, AppRoutes.signup);
                              },

                              child: const Text('Sign Up'),
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
