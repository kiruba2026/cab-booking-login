import 'package:flutter/material.dart';

import '../pages/login_page.dart';
import '../pages/signup_page.dart';
import '../pages/forgot_password_page.dart';
import '../pages/two_step_auth_page.dart';
import '../pages/dashboard_page.dart';

class AppRoutes {
  static const String login = '/login';
  static const String signup = '/signup';
  static const String forgotPassword = '/forgot-password';
  static const String twoStepAuth = '/two-step-auth';
  static const String dashboard = '/dashboard';

  static Map<String, WidgetBuilder> get routes {
    return {
      login: (context) => const LoginPage(),
      signup: (context) => const SignupPage(),
      forgotPassword: (context) => const ForgotPasswordPage(),
      twoStepAuth: (context) => const TwoStepAuthPage(),
      dashboard: (context) => const DashboardPage(),
    };
  }
}
