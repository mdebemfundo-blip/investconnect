import 'package:flutter/material.dart';
import '../../widgets/input_field.dart';
import '../../widgets/primary_button.dart';
import 'signup_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen>
    with TickerProviderStateMixin {
  late List<AnimationController> _controllers;

  @override
  void initState() {
    super.initState();
    _controllers = List.generate(
      3,
      (index) => AnimationController(
        duration: Duration(seconds: 6 + index * 2),
        vsync: this,
      )..repeat(),
    );
  }

  @override
  void dispose() {
    for (var controller in _controllers) {
      controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Animated floating circles background
          FloatingCirclesBackground(controllers: _controllers),
          // Main content
          SafeArea(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 40,
                ),
                child: Column(
                  children: [
                    // Logo
                    const SizedBox(height: 20),
                    const Text(
                      "InvestConnect",
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 60),
                    // Clean white card
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.08),
                            blurRadius: 16,
                            offset: const Offset(0, 4),
                          ),
                        ],
                      ),
                      padding: const EdgeInsets.all(24),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Welcome Back",
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 8),
                          const Text(
                            "Login to your account",
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 14,
                            ),
                          ),
                          const SizedBox(height: 24),
                          const InputField(
                            hint: "Email",
                            icon: Icons.email_outlined,
                          ),
                          const SizedBox(height: 16),
                          const InputField(
                            hint: "Password",
                            icon: Icons.lock_outline,
                            obscure: true,
                          ),
                          const SizedBox(height: 8),
                          Align(
                            alignment: Alignment.centerRight,
                            child: TextButton(
                              onPressed: () {},
                              child: const Text("Forgot password?"),
                            ),
                          ),
                          const SizedBox(height: 24),
                          PrimaryButton(
                            text: "Login",
                            onTap: () {},
                          ),
                          const SizedBox(height: 20),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                "Don't have an account? ",
                                style: TextStyle(fontSize: 14),
                              ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (_) => const SignupScreen(),
                                    ),
                                  );
                                },
                                child: const Text(
                                  "Sign Up",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 40),
                    // Privacy terms
                    GestureDetector(
                      onTap: () {},
                      child: Text(
                        "By signing in, you agree to our Privacy Policy",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey[600],
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// Performance-friendly floating circles widget
class FloatingCirclesBackground extends StatelessWidget {
  final List<AnimationController> controllers;

  const FloatingCirclesBackground({
    super.key,
    required this.controllers,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: Stack(
        children: [
          // Light gradient background
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Colors.blue.shade50,
                  Colors.purple.shade50,
                ],
              ),
            ),
          ),
          // Floating circles
          Positioned(
            top: 50,
            left: 20,
            child: AnimatedCircle(
              animation: controllers[0],
              size: 80,
              color: Colors.blue.withOpacity(0.15),
            ),
          ),
          Positioned(
            top: 200,
            right: 30,
            child: AnimatedCircle(
              animation: controllers[1],
              size: 120,
              color: Colors.purple.withOpacity(0.12),
            ),
          ),
          Positioned(
            bottom: 100,
            left: 50,
            child: AnimatedCircle(
              animation: controllers[2],
              size: 100,
              color: Colors.blue.withOpacity(0.1),
            ),
          ),
        ],
      ),
    );
  }
}

// Simple animated circle widget
class AnimatedCircle extends StatelessWidget {
  final Animation<double> animation;
  final double size;
  final Color color;

  const AnimatedCircle({
    super.key,
    required this.animation,
    required this.size,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animation,
      builder: (context, child) {
        return Transform.translate(
          offset: Offset(
            0,
            20 * (animation.value - 0.5).abs() * 2,
          ),
          child: Container(
            width: size,
            height: size,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: color,
            ),
          ),
        );
      },
    );
  }
}
