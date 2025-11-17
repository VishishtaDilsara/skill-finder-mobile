import 'package:flutter/material.dart';
// Import your AppRoutes class from the routes.dart file
import '../routes.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  // Colors
  static const Color backgroundColor = Colors.white;
  static const Color inputBackground = Color(0xFFF0F4F4);
  static const Color primaryCyan = Color(0xFF13ECEC);
  static const Color textColor = Color(0xFF111818);
  static const Color mutedText = Color(0xFF618989);

  // Controllers
  final _fullNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  @override
  void dispose() {
    _fullNameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  // --- Navigation and Logic ---

  void _navigateToCategories() {
    // Navigate to Categories and prevent going back to Signup
    Navigator.of(context).pushReplacementNamed(AppRoutes.categories);
  }

  // FIX: Updated to push TO the Login screen using named routes, as requested.
  void _navigateToLogin() {
    // Navigates explicitly TO the Login screen by pushing it onto the stack.
    Navigator.of(context).pushNamed(AppRoutes.login);
  }

  void _handleSignUp() {
    // Check if fields are empty
    if (_fullNameController.text.isEmpty ||
        _emailController.text.isEmpty ||
        _passwordController.text.isEmpty ||
        _confirmPasswordController.text.isEmpty) {
      _showSnackBar('Please fill in all fields.');
      return;
    }

    // Check if passwords match
    if (_passwordController.text != _confirmPasswordController.text) {
      _showSnackBar('Passwords do not match.');
      return;
    }

    // SUCCESS: Perform sign up logic (omitted) and navigate
    debugPrint('Sign Up successful for ${_emailController.text}');
    _navigateToCategories();
  }

  void _showSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: const Duration(seconds: 2),
      ),
    );
  }

  // --- Widget Builders ---

  Widget _buildInput({
    required String hintText,
    bool obscureText = false,
    required TextEditingController controller,
    TextInputType keyboardType = TextInputType.text,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
      child: TextField(
        controller: controller,
        obscureText: obscureText,
        keyboardType: keyboardType,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: const TextStyle(color: mutedText),
          filled: true,
          fillColor: inputBackground,
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 18,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide.none,
          ),
        ),
        style: const TextStyle(color: textColor, fontSize: 16),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 6),
          child: AppBar(
            backgroundColor: backgroundColor,
            elevation: 0,
            centerTitle: true,
            automaticallyImplyLeading: false,
            leading: IconButton(
              // Back button leads back to the previous screen (likely LoginScreen)
              icon: const Icon(
                Icons.arrow_back_ios_new,
                color: textColor,
                size: 24,
              ),
              onPressed: () => Navigator.pop(context),
            ),
            title: const Text(
              "Sign Up",
              style: TextStyle(
                color: textColor,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _buildInput(hintText: "Full Name", controller: _fullNameController),
            _buildInput(
                hintText: "Email",
                controller: _emailController,
                keyboardType: TextInputType.emailAddress),
            _buildInput(
              hintText: "Password",
              controller: _passwordController,
              obscureText: true,
            ),
            _buildInput(
              hintText: "Confirm Password",
              controller: _confirmPasswordController,
              obscureText: true,
            ),

            // --- Sign Up Button ---
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: SizedBox(
                width: double.infinity,
                height: 56,
                child: ElevatedButton(
                  onPressed:
                      _handleSignUp, // Handles validation and navigation to categories
                  style: ElevatedButton.styleFrom(
                    backgroundColor: primaryCyan,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Text(
                    "Sign Up",
                    style: TextStyle(
                      color: textColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      letterSpacing: 0.2,
                    ),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 12),

            // --- Already have an account ---
            const Text(
              "Already have an account?",
              style: TextStyle(color: mutedText, fontSize: 14),
            ),
            const SizedBox(height: 6),
            GestureDetector(
              onTap: _navigateToLogin, // Now pushes TO the Login screen
              child: const Text(
                "Log In",
                style: TextStyle(
                  color: mutedText,
                  fontSize: 14,
                  decoration: TextDecoration.underline,
                ),
              ),
            ),

            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}
