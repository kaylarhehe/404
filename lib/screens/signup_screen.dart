import 'package:ags_flutter_starter/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'menu_screen.dart';

// ============================================================================
// SIGNUP SCREEN - KANTINKU STARTER TEMPLATE (Week 7: Form & Validation)
// Alta Global School | IT Grade 10 & 11 (SHS)
//
// STUDENT GUIDE:
// This is the Sign Up / Registration Screen.
// Here you will learn 3 core Flutter Form concepts:
// 1. GlobalKey<FormState>: Master key to validate all input fields simultaneously.
// 2. TextEditingController: Bridge to capture and read user text input.
// 3. validator: Rule checker (e.g., non-empty, minimum 6 characters for password).
// ============================================================================

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  // --------------------------------------------------------------------------
  // 1. FORM KEY & CONTROLLERS
  // --------------------------------------------------------------------------
  // _formKey acts as the validator lock before data is submitted
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  // Controllers to read text typed into each TextFormField
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _userController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  // State to toggle password visibility (hide/show characters)
  bool _obscurePassword = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // [CHANGE HERE]: Background color
      appBar: AppBar(
        title: const Text(
          'Create 404 Account', // [CHANGE HERE]: App bar title
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.grey, // [CHANGE HERE]: Main theme color
        foregroundColor: Colors.white,
        elevation: 0,
      ),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(24.0),
            // ------------------------------------------------------------------
            // 2. FORM WIDGET
            // Form wraps all TextFormFields so they can be validated together
            // ------------------------------------------------------------------
            child: Form(
              key: _formKey, // Attach form key here
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Header & Greeting
                  const Text(
                    'Ready to 404?', // [CHANGE HERE]: Form title
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 6),
                  const Text(
                    'Fill this out to play our app!', // [CHANGE HERE]: Subtitle
                    style: TextStyle(fontSize: 14, color: Color(0xFF64748B)),
                  ),
                  const SizedBox(height: 28),

                  // ============================================================
                  // INPUT 1: FULL NAME
                  // ============================================================
                  const Text(
                    'Your Name',
                    style: TextStyle(fontWeight: FontWeight.w600, color: Colors.black),
                  ),
                  const SizedBox(height: 6),
                  TextFormField(
                    controller: _nameController,
                    decoration: const InputDecoration(
                      hintText: 'e.g. Alex Johnson', // [CHANGE HERE]
                      prefixIcon: Icon(Icons.person_outline, color: Colors.black),
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(12))),
                    ),
                    // VALIDATOR: Cannot be empty, min 3 characters
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return 'Name is required';
                      }
                      if (value.trim().length < 3) {
                        return 'Name must be at least 3 characters';
                      }
                      return null; // null means VALID
                    },
                  ),
                  const SizedBox(height: 18),

                  // ============================================================
                  // INPUT 2: CLASS & STUDENT ID
                  // ============================================================
                  const Text(
                    'Username', // [CHANGE HERE]: Can be 'Phone Number' or 'Table Number'
                    style: TextStyle(fontWeight: FontWeight.w600, color: Colors.black),
                  ),
                  const SizedBox(height: 6),
                  TextFormField(
                    controller: _userController,
                    decoration: const InputDecoration(
                      hintText: 'Enter nickname', // [CHANGE HERE]
                      prefixIcon: Icon(Icons.account_circle_outlined, color: Colors.black),
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(12))),
                    ),
                    // VALIDATOR: Cannot be empty
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return 'Username is required';
                      }
                      return null; // Valid
                    },
                  ),
                  const SizedBox(height: 18),

                  // ============================================================
                  // INPUT 3: Email
                  // ============================================================
                  const Text(
                    'Email',
                    style: TextStyle(fontWeight: FontWeight.w600, color: Colors.black),
                  ),
                  const SizedBox(height: 6),
                  TextFormField(
                    controller: _emailController,
                    decoration: const InputDecoration(
                      hintText: 'Enter your Email', // [CHANGE HERE]
                      prefixIcon: Icon(Icons.email_outlined, color: Colors.black),
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(12))),
                    ),

                    // VALIDATOR: Minimum 6 characters
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return 'Email is required';
                      }
                      return null; // Valid
                    },
                  ),
                  const SizedBox(height: 18),

                  // ============================================================
                  // INPUT 4: PASSWORD
                  // ============================================================
                  const Text(
                    'Password',
                    style: TextStyle(fontWeight: FontWeight.w600, color: Colors.black),
                  ),
              const SizedBox(height: 6),
              TextFormField(
                controller: _passwordController,
                obscureText: _obscurePassword, // Hides typed characters
                decoration: InputDecoration(
                  hintText: 'Minimum 6 characters', // [CHANGE HERE]
                  prefixIcon: const Icon(Icons.lock_outline, color: Colors.black),
                  suffixIcon: IconButton(
                    icon: Icon(
                      _obscurePassword ? Icons.visibility_off : Icons.visibility,
                      color: Colors.black,
                    ),
                    onPressed: () {
                      // Toggle visibility on eye icon tap
                      setState(() {
                        _obscurePassword = !_obscurePassword;
                      });
                    },
                  ),
                    filled: true,
                    fillColor: Colors.white,
                    border: const OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(12))),
                ),
                    // VALIDATOR: Must match initial password
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please confirm your password';
                      }
                      if (value != _passwordController.text) {
                        return 'Passwords must be at least 6 characters';
                      }
                      return null; // Valid
                    },
                  ),
                  const SizedBox(height: 32),

                  // ============================================================
                  // 3. SUBMIT BUTTON (SIGN UP NOW)
                  // ============================================================
                  SizedBox(
                    width: double.infinity,
                    height: 52,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.grey, // [CHANGE HERE]: Button color
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        elevation: 2,
                      ),
                      onPressed: () {
                        // Validate all fields simultaneously
                        if (_formKey.currentState!.validate()) {
                          final userName = _nameController.text.trim();

                          // 1. Show green success SnackBar
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text('Welcome, $userName! Account created successfully.'),
                              backgroundColor: const Color(0xFF0E7C86),
                              duration: const Duration(seconds: 2),
                            ),
                          );

                          // 2. Navigate to MenuScreen carrying registered name
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => HomeScreen(userName: userName),
                            ),
                          );
                        }
                      },
                      child: const Text(
                        'Sign Up Now', // [CHANGE HERE]: Submit button text
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),

                  // Back to Login Button
                  Center(
                    child: TextButton(
                      onPressed: () {
                        // Pop back to LoginScreen
                        Navigator.pop(context);
                      },
                      child: const Text(
                        'Already have an account? Log in here',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  // --------------------------------------------------------------------------
  // DISPOSE CONTROLLERS (Prevents device memory leaks)
  // --------------------------------------------------------------------------
  @override
  void dispose() {
    _nameController.dispose();
    _userController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}
