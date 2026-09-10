import 'package:flutter/material.dart';

import '../routes/app_routes.dart';

class TwoStepAuthPage extends StatefulWidget {
  const TwoStepAuthPage({super.key});

  @override
  State<TwoStepAuthPage> createState() {
    return _TwoStepAuthPageState();
  }
}

class _TwoStepAuthPageState extends State<TwoStepAuthPage>
    with SingleTickerProviderStateMixin {
  // ================================================================
  // OTP CONTROLLER
  // ================================================================

  final TextEditingController otpController = TextEditingController();

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
  // VERIFY OTP
  // ================================================================

  void verifyOtp() {
    String otp = otpController.text.trim();

    if (otp.isEmpty) {
      showMessage('Please enter the OTP');
      return;
    }

    if (otp.length != 6) {
      showMessage('Please enter a valid 6-digit OTP');
      return;
    }

    // Demo verification
    Navigator.pushReplacementNamed(context, AppRoutes.dashboard);
  }

  // ================================================================
  // RESEND OTP
  // ================================================================

  void resendOtp() {
    showMessage('A new OTP has been sent');
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
    otpController.dispose();

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
          padding: const EdgeInsets.all(20),

          child: FadeTransition(
            opacity: _fadeAnimation,

            child: SlideTransition(
              position: _contentSlideAnimation,

              child: Container(
                width: 420,

                padding: const EdgeInsets.symmetric(
                  horizontal: 30,
                  vertical: 35,
                ),

                decoration: BoxDecoration(
                  color: Colors.white,

                  borderRadius: BorderRadius.circular(12),

                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.08),

                      blurRadius: 20,

                      offset: const Offset(0, 8),
                    ),
                  ],
                ),

                child: Column(
                  mainAxisSize: MainAxisSize.min,

                  children: [
                    // ==================================================
                    // ONECLOUD LOGO
                    // ==================================================

                    ScaleTransition(
                      scale: _logoScaleAnimation,

                      child: const Icon(
                        Icons.cloud,
                        size: 65,
                        color: Color(0xFF1877F2),
                      ),
                    ),

                    const SizedBox(height: 8),

                    // ==================================================
                    // ONECLOUD
                    // ==================================================
                    const Text(
                      'OneCloud',

                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF1877F2),
                        letterSpacing: -1,
                      ),
                    ),

                    const SizedBox(height: 2),

                    const Text(
                      'Enterprise Platform',

                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF555555),
                      ),
                    ),

                    const SizedBox(height: 30),

                    // ==================================================
                    // TITLE
                    // ==================================================
                    const Text(
                      'Two-Step Verification',

                      textAlign: TextAlign.center,

                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF1C1E21),
                      ),
                    ),

                    const SizedBox(height: 10),

                    // ==================================================
                    // DESCRIPTION
                    // ==================================================
                    const Text(
                      'Enter the 6-digit verification code sent to your phone or email.',

                      textAlign: TextAlign.center,

                      style: TextStyle(fontSize: 14, color: Color(0xFF65676B)),
                    ),

                    const SizedBox(height: 25),

                    // ==================================================
                    // OTP FIELD
                    // ==================================================
                    TextField(
                      controller: otpController,

                      keyboardType: TextInputType.number,

                      maxLength: 6,

                      textAlign: TextAlign.center,

                      decoration: InputDecoration(
                        labelText: 'Verification Code',

                        hintText: 'Enter 6-digit OTP',

                        prefixIcon: const Icon(Icons.lock_outline),

                        counterText: '',

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

                    const SizedBox(height: 20),

                    // ==================================================
                    // VERIFY BUTTON
                    // ==================================================
                    SizedBox(
                      width: double.infinity,

                      height: 50,

                      child: ElevatedButton(
                        onPressed: verifyOtp,

                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF1877F2),

                          foregroundColor: Colors.white,

                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),

                        child: const Text(
                          'VERIFY',

                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 18),

                    // ==================================================
                    // RESEND OTP
                    // ==================================================
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,

                      children: [
                        const Text(
                          "Didn't receive the code?",

                          style: TextStyle(color: Color(0xFF65676B)),
                        ),

                        TextButton(
                          onPressed: resendOtp,

                          child: const Text(
                            'Resend OTP',

                            style: TextStyle(
                              color: Color(0xFF1877F2),

                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 5),

                    // ==================================================
                    // BACK TO LOGIN
                    // ==================================================
                    TextButton.icon(
                      onPressed: () {
                        Navigator.pushReplacementNamed(
                          context,
                          AppRoutes.login,
                        );
                      },

                      icon: const Icon(Icons.arrow_back, size: 18),

                      label: const Text('Back to Login'),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
