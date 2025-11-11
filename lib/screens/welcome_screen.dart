import 'package:flutter/material.dart';
import '../routes.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Determine the safe area padding from the bottom (e.g., iPhone home indicator)
    final double systemBottomPadding = MediaQuery.of(context).padding.bottom;

    return Scaffold(
      // Set the background to black/very dark
      backgroundColor: const Color(0xFF0D0D0D),

      // body: Column allows the image to extend up to the top edge (behind the status bar).
      body: Column(
        children: [
          // --- Image Section ---
          // Set to 50% of screen height to leave room for the text and button.
          Container(
            height: MediaQuery.of(context).size.height * 0.50,
            width: double.infinity,
            decoration: const BoxDecoration(
              image: DecorationImage(
                // Using the local image asset: 'assets/images/welcome.jpg'
                image: AssetImage('assets/images/welcome.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),

          // --- Text Content Section ---
          Expanded(
            // Use SafeArea here, but set top: false since the image already covers the top.
            child: SafeArea(
              top: false,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 24.0,
                  vertical: 32.0,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    // Title: Large, bold, white
                    Text(
                      'Find skilled professionals\nfor your home projects',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        height: 1.2, // Tighter line spacing
                      ),
                    ),
                    SizedBox(height: 16),
                    // Description: Smaller, slightly muted white
                    Text(
                      'Connect with trusted contractors, plumbers, electricians, and more. Get quotes, schedule appointments, and manage your projects all in one place.',
                      style: TextStyle(color: Colors.white70, fontSize: 16),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),

      // --- Sticky Button Section (bottomNavigationBar) ---
      bottomNavigationBar: Padding(
        // Dynamically add the systemBottomPadding to ensure the button is never obscured.
        padding: EdgeInsets.fromLTRB(
          24.0,
          16.0,
          24.0,
          40.0 +
              systemBottomPadding, // Base 40px margin + system safe area padding
        ),
        child: SizedBox(
          height: 60,
          child: ElevatedButton(
            // Use the original navigation logic
            onPressed: () => Navigator.pushNamed(context, AppRoutes.login),
            style: ElevatedButton.styleFrom(
              // Use a vibrant blue color for the button
              backgroundColor: const Color(0xFF00BFFF),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              elevation: 0,
            ),
            child: const Text(
              'Get Started',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
