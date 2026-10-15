import 'package:ags_flutter_starter/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'menu_screen.dart';
import 'signup_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  // Controller to read name input for quick login
  final TextEditingController _nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white , // Login background color
      body: SafeArea(
        child: Column(
          children: [
            // 1. TOP SCROLLABLE CONTENT
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 32.0, vertical: 30.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // App Title & Tagline
                    const Text(
                      '404 solve',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 36,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey,
                      ),
                    ),
                    const Text(
                      'the algorithm 4 u!',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(height: 23),

                    // Quick Name Input Field
                    TextField(
                      controller: _nameController,
                      textAlign: TextAlign.center,
                      style: const TextStyle(color: Colors.black, fontSize: 16),
                      decoration: InputDecoration(
                        hintText: 'Enter your name',
                        hintStyle: const TextStyle(color: Colors.black),
                        prefixIcon: const Icon(Icons.person_outline, color: Colors.black),
                        filled: true,
                        fillColor: Colors.black.withValues(alpha: 0.1),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: const BorderSide(color: Colors.black),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: const BorderSide(color: Colors.black, width: 2),
                        ),
                      ),
                    ),
                    const SizedBox(height: 15),

                    // Button 1: Quick Log In
                    SizedBox(
                      width: double.infinity,
                      height: 52,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.grey,
                          foregroundColor: Colors.black,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          elevation: 2,
                        ),
                        onPressed: () {
                          final name = _nameController.text.trim().isEmpty
                              ? 'AGS Student'
                              : _nameController.text.trim();

                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => MenuScreen(userName: name),
                            ),
                          );
                        },
                        child: const Text(
                          'Log In',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 19),

                    // Divider
                    Row(
                      children: [
                        const Expanded(child: Divider(color: Colors.black)),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 12.0),
                          child: Text(
                            'NEW USER?',
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.black.withValues(alpha: 0.8),
                            ),
                          ),
                        ),
                        const Expanded(child: Divider(color: Colors.black)),
                      ],
                    ),
                    const SizedBox(height: 15),

                    // Button 2: Sign Up
                    SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: OutlinedButton.icon(
                        style: OutlinedButton.styleFrom(
                          foregroundColor: Colors.black,
                          side: const BorderSide(color: Colors.black, width: 1.5),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        icon: const Icon(Icons.person_add_alt_1),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const SignUpScreen(),
                            ),
                          );
                        },
                        label: const Text(
                          'Create New Account (Sign Up)',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // 2. FIXED BOTTOM IMAGE
            Image.asset(
              'assets/illustration.png',
              height: 400, // Increased height for more presence
              width: double.infinity, // Tells the image to take full screen width
              fit: BoxFit.fill, // <-- Change this line
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }
}
