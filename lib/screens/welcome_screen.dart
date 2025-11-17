import 'package:flutter/material.dart';
import '../routes.dart'; // adjust if needed

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // --- Main Section ---
            Column(
              children: [
                // Background image
                Container(
                  margin: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 12,
                  ),
                  height: 260,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    image: const DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(
                        "https://lh3.googleusercontent.com/aida-public/AB6AXuDPBgbfVt7coMQTKCxtSQadI6pYY9GcGQUxJSOiuOXGaEYfKNVoMsvvrrWPmD5SOAMVbzkyZuoPw-oFnP1rbIclnvbMPq7eTygF1yz6jY6qkaas_p_mR7xyrMHfrvM0MaY6EuyZN2yVhJ38r3Hg0_g8YQLDoZIouhHoGbNjdA2GvWQByIEC5zzqlgCqYeZYWUgGtqmViQaoQFfUgMv7ElVfuhCh-qAaVpemrAqDPgbCZlkCulKNgY_EGQ-LtxClNwYWQabHqN21CXtG",
                      ),
                    ),
                  ),
                ),

                // Title
                const Padding(
                  padding: EdgeInsets.only(
                    left: 16,
                    right: 16,
                    top: 20,
                    bottom: 8,
                  ),
                  child: Text(
                    "Find and hire local service providers",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xFF111818),
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Manrope',
                      height: 1.2,
                    ),
                  ),
                ),

                // Subtitle
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: Text(
                    "Connect with skilled professionals for all your home service needs.",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xFF111818),
                      fontSize: 16,
                      fontWeight: FontWeight.normal,
                      fontFamily: 'Noto Sans',
                      height: 1.5,
                    ),
                  ),
                ),

                // Buttons
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 20,
                  ),
                  child: Column(
                    children: [
                      SizedBox(
                        width: double.infinity,
                        height: 48,
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.pushNamed(context, AppRoutes.signup);
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF13ECEC),
                            foregroundColor: const Color(0xFF111818),
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          child: const Text(
                            "Sign up",
                            style: TextStyle(
                              fontFamily: 'Manrope',
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 12),
                      SizedBox(
                        width: double.infinity,
                        height: 48,
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.pushNamed(context, AppRoutes.login);
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFFF0F4F4),
                            foregroundColor: const Color(0xFF111818),
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          child: const Text(
                            "Log in",
                            style: TextStyle(
                              fontFamily: 'Manrope',
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),

            // Footer Text
            const Padding(
              padding: EdgeInsets.only(bottom: 20, left: 16, right: 16),
              child: Text(
                "By continuing, you agree to our Terms of Service and Privacy Policy.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0xFF618989),
                  fontSize: 14,
                  fontWeight: FontWeight.normal,
                  fontFamily: 'Noto Sans',
                  height: 1.4,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
