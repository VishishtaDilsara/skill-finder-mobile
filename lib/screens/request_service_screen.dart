import 'package:flutter/material.dart';
import '../routes.dart';
import '../widgets/bottom_navbar.dart';

class RequestServiceScreen extends StatelessWidget {
  const RequestServiceScreen({super.key});

  // Helper method to create a title for sections
  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(
          left: 16.0, right: 16.0, top: 16.0, bottom: 8.0),
      child: Text(
        title,
        style: const TextStyle(
          color: Color(0xFF111818),
          fontSize: 18,
          fontWeight: FontWeight.bold,
          letterSpacing: -0.015,
        ),
      ),
    );
  }

  // Helper method to create a list tile for summary details
  Widget _buildDetailRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: const TextStyle(
              color: Color(0xFF618989),
              fontSize: 14,
              fontWeight: FontWeight.normal,
            ),
          ),
          Text(
            value,
            style: const TextStyle(
              color: Color(0xFF111818),
              fontSize: 14,
              fontWeight: FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      // The body contains the header, scrollable content, and the fixed button.
      // The fixed button must be inside the body Column, but outside the Expanded/Scrollable area.
      body: Column(
        children: [
          // Custom AppBar matching the design
          PreferredSize(
            preferredSize: const Size.fromHeight(60.0),
            child: Container(
              color: Colors.white,
              padding: const EdgeInsets.fromLTRB(16, 4, 16, 4),
              child: SafeArea(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () =>
                          Navigator.pop(context), // Handle back navigation
                      child: Container(
                        width: 48,
                        height: 48,
                        alignment: Alignment.center,
                        child: const Icon(Icons.arrow_back,
                            color: Color(0xFF111818), size: 24),
                      ),
                    ),
                    const Expanded(
                      child: Padding(
                        padding: EdgeInsets.only(
                            right: 48.0), // Offset for back button
                        child: Text(
                          'Confirm booking',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Color(0xFF111818),
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            letterSpacing: -0.015,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

          // Main Scrollable Content
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // --- Service Section ---
                  _buildSectionTitle('Service'),
                  ListTile(
                    contentPadding:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                    leading: Container(
                      width: 48,
                      height: 48,
                      decoration: BoxDecoration(
                        color: const Color(0xFFF0F4F4),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child:
                          const Icon(Icons.ac_unit, color: Color(0xFF111818)),
                    ),
                    title: const Text(
                      'Ceiling Fan Installation',
                      style: TextStyle(
                          color: Color(0xFF111818),
                          fontSize: 16,
                          fontWeight: FontWeight.w500),
                      overflow: TextOverflow.ellipsis,
                    ),
                    subtitle: const Text(
                      'Install a new ceiling fan',
                      style: TextStyle(color: Color(0xFF618989), fontSize: 14),
                      maxLines: 2,
                    ),
                  ),

                  // --- Provider Section ---
                  _buildSectionTitle('Provider'),
                  ListTile(
                    contentPadding:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                    leading: const CircleAvatar(
                      radius: 28,
                      backgroundImage: NetworkImage(
                          'https://lh3.googleusercontent.com/aida-public/AB6AXuD2hJ42DPAuBDpHWz7LymOIKdMfqyV4g243OgIWWYQB-bo2P3kH5I7rLb0f2unKveuSbMYbGQFBKTej4BeMWQRnPjptMJXnKZwm646N62m6Nwf9_W5FWqSvCz4KRpRAu3g-gr_1N-xZm3rTdJg2qPe3URANVTDHdq4ZJ3HJ3H7cSQDl6ViqWj8JsH-IwcFQVP1konbWmUmyU29JIxmWGLNE2ZH6B7hNF2G-Hxh1STh-kNs5QwmJeFOFB_IbbxOzgZuBBsJEE5tl32za'),
                    ),
                    title: const Text(
                      'Ethan Carter',
                      style: TextStyle(
                          color: Color(0xFF111818),
                          fontSize: 16,
                          fontWeight: FontWeight.w500),
                      overflow: TextOverflow.ellipsis,
                    ),
                    subtitle: const Text(
                      '4.9 (123 reviews)',
                      style: TextStyle(color: Color(0xFF618989), fontSize: 14),
                      maxLines: 2,
                    ),
                  ),

                  // --- Date & Time Section ---
                  _buildSectionTitle('Date & Time'),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    child: Text(
                      'Tue, Jul 23 · 10:00 AM - 11:00 AM',
                      style: TextStyle(
                          color: Color(0xFF111818),
                          fontSize: 16,
                          fontWeight: FontWeight.normal),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),

                  // --- Summary Section ---
                  _buildSectionTitle('Summary'),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      children: [
                        _buildDetailRow('Service', 'Ceiling Fan Installation'),
                        _buildDetailRow('Subtotal', '\$120'),
                        _buildDetailRow('Taxes', '\$12'),
                        _buildDetailRow('Total', '\$132'),
                      ],
                    ),
                  ),
                  // Add extra padding to ensure content doesn't get hidden behind the button bar
                  const SizedBox(height: 10),
                ],
              ),
            ),
          ),

          // Fixed Bottom Button (outside the scroll area)
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 16.0, vertical: 12.0),
                child: SizedBox(
                  width: double.infinity,
                  height: 48,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, AppRoutes.bookings);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF13ECEC),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      elevation: 0,
                    ),
                    child: const Text(
                      'Confirm Booking',
                      style: TextStyle(
                        color: Color(0xFF111818),
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 0.015,
                      ),
                    ),
                  ),
                ),
              ),
              // Separator line for aesthetic purposes (matches the old nav bar style)
              const Divider(height: 1, thickness: 1, color: Color(0xFFF0F4F4)),
            ],
          ),
        ],
      ),

      // Use the imported BottomNavbar widget here, passing the required parameters.
      // Assuming 'Bookings' is index 1 (Categories=0, Bookings=1, Profile=2)
      bottomNavigationBar: BottomNavBar(
        currentIndex: 1, // Set the 'Bookings' tab as active
        context: context, // Pass the required BuildContext
      ),
    );
  }
}
