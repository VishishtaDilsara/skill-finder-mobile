import 'package:flutter/material.dart';
import '../routes.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          'Welcome Back',
          style: TextStyle(
            color: Color(0xFF111818),
            fontWeight: FontWeight.bold,
            fontFamily: 'Manrope',
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        iconTheme: const IconThemeData(color: Color(0xFF111818)),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(height: 40),

                // --- Header Text ---
                const Text(
                  "Log in to your account",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xFF111818),
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Manrope',
                  ),
                ),
                const SizedBox(height: 8),
                const Text(
                  "Access your services and manage your profile easily.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xFF111818),
                    fontSize: 15,
                    fontWeight: FontWeight.normal,
                    fontFamily: 'Noto Sans',
                    height: 1.4,
                  ),
                ),
                const SizedBox(height: 40),

                // --- Email Field ---
                _buildLightTextField(
                  hintText: 'Email',
                  icon: Icons.email_outlined,
                ),
                const SizedBox(height: 16),

                // --- Password Field ---
                _buildLightTextField(
                  hintText: 'Password',
                  icon: Icons.lock_outline,
                  isPassword: true,
                ),
                const SizedBox(height: 28),

                // --- Log In Button ---
                SizedBox(
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () =>
                        Navigator.pushNamed(context, AppRoutes.categories),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF13ECEC),
                      foregroundColor: const Color(0xFF111818),
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: const Text(
                      'Log In',
                      style: TextStyle(
                        fontFamily: 'Manrope',
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),

                // --- Or continue with ---
                const Center(
                  child: Text(
                    'Or continue with',
                    style: TextStyle(
                      color: Color(0xFF618989),
                      fontSize: 14,
                      fontFamily: 'Noto Sans',
                    ),
                  ),
                ),
                const SizedBox(height: 20),

                // --- Social Buttons ---
                Row(
                  children: [
                    Expanded(
                      child: _buildSocialButton(
                        text: 'Facebook',
                        color: const Color(0xFFF0F4F4),
                        icon: Icons.facebook,
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: _buildSocialButton(
                        text: 'Google',
                        color: const Color(0xFFF0F4F4),
                        icon: Icons.g_mobiledata,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 36),

                // --- Sign Up Text ---
                TextButton(
                  onPressed: () =>
                      Navigator.pushNamed(context, AppRoutes.signup),
                  child: const Text.rich(
                    TextSpan(
                      text: "Don't have an account? ",
                      style: TextStyle(
                        color: Color(0xFF111818),
                        fontSize: 15,
                        fontFamily: 'Noto Sans',
                      ),
                      children: [
                        TextSpan(
                          text: 'Sign up',
                          style: TextStyle(
                            color: Color(0xFF13ECEC),
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Manrope',
                          ),
                        ),
                      ],
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(height: 20),

                // --- Terms Text ---
                const Padding(
                  padding: EdgeInsets.only(bottom: 20),
                  child: Text(
                    "By continuing, you agree to our Terms of Service and Privacy Policy.",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xFF618989),
                      fontSize: 13,
                      fontWeight: FontWeight.normal,
                      fontFamily: 'Noto Sans',
                      height: 1.4,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // --- Light theme text field ---
  Widget _buildLightTextField({
    required String hintText,
    required IconData icon,
    bool isPassword = false,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFFF0F4F4),
        borderRadius: BorderRadius.circular(8),
      ),
      child: TextFormField(
        obscureText: isPassword,
        style: const TextStyle(
          color: Color(0xFF111818),
          fontFamily: 'Noto Sans',
        ),
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: const TextStyle(
            color: Color(0xFF618989),
            fontFamily: 'Noto Sans',
          ),
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 16,
          ),
          prefixIcon: Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Icon(icon, color: Color(0xFF618989)),
          ),
        ),
      ),
    );
  }

  // --- Light theme social button ---
  Widget _buildSocialButton({
    required String text,
    required IconData icon,
    required Color color,
  }) {
    return SizedBox(
      height: 50,
      child: ElevatedButton.icon(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          foregroundColor: const Color(0xFF111818),
          elevation: 0,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
        icon: Icon(icon),
        label: Text(
          text,
          style: const TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.bold,
            fontFamily: 'Manrope',
          ),
        ),
      ),
    );
  }
}
