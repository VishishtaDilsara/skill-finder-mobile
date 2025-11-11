import 'package:flutter/material.dart';
// import '../routes.dart'; // Assuming AppRoutes is defined here

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  // Color Constants (based on HTML/Tailwind)
  static const Color darkBackground = Color(0xFF111618);
  static const Color inputBackground = Color(0xFF283339);
  static const Color primaryBlue = Color(0xFF13A4EC);
  static const Color inactiveText = Color(0xFF9DB0B9);
  static const Color white = Colors.white;

  // Text Controllers
  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _fullNameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  // Generic Sign Up function
  void _signUp() {
    if (_formKey.currentState!.validate()) {
      // Logic for signing up (e.g., using Firebase Auth)
      print('Attempting sign up with:');
      print('Name: ${_fullNameController.text}');
      print('Email: ${_emailController.text}');

      // Show confirmation message instead of alert()
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            'Welcome, ${_fullNameController.text}! Sign Up Successful.',
          ),
          backgroundColor: primaryBlue,
        ),
      );

      // In a real app, you'd navigate here
      // Navigator.pushNamed(context, AppRoutes.home);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please correct the errors in the form.'),
          backgroundColor: Colors.redAccent,
        ),
      );
    }
  }

  // Custom Input Field Widget
  Widget _buildInput({
    required String hintText,
    bool isPassword = false,
    required TextEditingController controller,
    String? Function(String?)? validator,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
      child: TextFormField(
        controller: controller,
        obscureText: isPassword,
        keyboardType: isPassword
            ? TextInputType.text
            : TextInputType.emailAddress,
        validator: validator,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: const TextStyle(color: inactiveText),
          filled: true,
          fillColor: inputBackground,
          contentPadding: const EdgeInsets.all(16.0),
          // Matches the h-14 height of the HTML input
          constraints: const BoxConstraints(minHeight: 56),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
            borderSide: BorderSide.none,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
            borderSide: BorderSide.none,
          ),
        ),
        style: const TextStyle(color: white, fontSize: 16),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: darkBackground,
      appBar: AppBar(
        backgroundColor: darkBackground,
        elevation: 0,
        automaticallyImplyLeading: false, // Prevents automatic back button
        title: const Text(
          'Sign Up',
          style: TextStyle(
            color: white,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // --- Form Fields ---
              _buildInput(
                hintText: 'Full Name',
                controller: _fullNameController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your full name.';
                  }
                  return null;
                },
              ),
              _buildInput(
                hintText: 'Email',
                controller: _emailController,
                validator: (value) {
                  if (value == null || value.isEmpty || !value.contains('@')) {
                    return 'Please enter a valid email.';
                  }
                  return null;
                },
              ),
              _buildInput(
                hintText: 'Password',
                isPassword: true,
                controller: _passwordController,
                validator: (value) {
                  if (value == null || value.length < 6) {
                    return 'Password must be at least 6 characters.';
                  }
                  return null;
                },
              ),
              _buildInput(
                hintText: 'Confirm Password',
                isPassword: true,
                controller: _confirmPasswordController,
                validator: (value) {
                  if (value != _passwordController.text) {
                    return 'Passwords do not match.';
                  }
                  return null;
                },
              ),

              // --- Sign Up Button ---
              Padding(
                padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 8.0),
                child: ElevatedButton(
                  onPressed: _signUp,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: primaryBlue,
                    minimumSize: const Size(
                      double.infinity,
                      56,
                    ), // h-14 equivalent
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    elevation: 0,
                  ),
                  child: const Text(
                    'Sign Up',
                    style: TextStyle(
                      color: white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 0.2,
                    ),
                  ),
                ),
              ),

              // --- Separator Text ---
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                child: Text(
                  'Or sign up with',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: inactiveText,
                    fontSize: 14,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ),

              // --- Social Buttons ---
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16.0,
                  vertical: 12.0,
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          print('Facebook sign up tapped');
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: inputBackground,
                          minimumSize: const Size(0, 40), // h-10
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          elevation: 0,
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                        ),
                        child: const Text(
                          'Facebook',
                          style: TextStyle(
                            color: white,
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          print('Google sign up tapped');
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: inputBackground,
                          minimumSize: const Size(0, 40), // h-10
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          elevation: 0,
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                        ),
                        child: const Text(
                          'Google',
                          style: TextStyle(
                            color: white,
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              // --- Footer Link ---
              GestureDetector(
                onTap: () {
                  print('Log in tapped');
                  // Navigator.pushNamed(context, AppRoutes.login);
                },
                child: const Padding(
                  padding: EdgeInsets.only(bottom: 20, top: 20),
                  child: Text(
                    'Already have an account? Log in',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: inactiveText,
                      fontSize: 14,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
