import 'package:flutter/material.dart';
import 'screens/home/main_shell.dart';
import 'theme/app_theme.dart';
import 'screens/auth/login_screen.dart';

void main() {
  runApp(const InvestConnectApp());
}

class InvestConnectApp extends StatelessWidget {
  const InvestConnectApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'InvestConnect',
      theme: AppTheme.lightTheme,
      home: LoginScreen(),
    );
  }
}
