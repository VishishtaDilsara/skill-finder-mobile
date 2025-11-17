import 'package:flutter/material.dart';
import '../widgets/bottom_navbar.dart'; // Reusable navbar widget

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  // --- Color Palette (Updated for White Theme) ---
  static const Color kBackground = Colors.white; // White background
  static const Color kTextPrimary = Color(0xFF111818); // Dark text
  static const Color kTextSecondary = Color(0xFF618989); // Secondary/Hint text
  static const Color kIconBackground =
      Color(0xFFF0F4F4); // Light background for containers

  // --- Mock Data ---
  static const String userAvatarUrl = "https://i.pravatar.cc/300?img=11";
  static const String userName = "Ethan Carter";
  static const String memberSince = "Member since 2021";

  static const List<Map<String, dynamic>> accountItems = [
    {'title': 'Payment methods', 'icon': Icons.credit_card_outlined},
    {'title': 'Notifications', 'icon': Icons.notifications_outlined},
    {'title': 'Settings', 'icon': Icons.settings_outlined},
  ];

  static const List<Map<String, dynamic>> activityItems = [
    // Note: If you want 'Bookings' to navigate, use a route. For now, it's just a placeholder item.
    {'title': 'Bookings', 'icon': Icons.calendar_today_outlined},
    {'title': 'Reviews', 'icon': Icons.star_border_outlined},
    {'title': 'Saved', 'icon': Icons.bookmark_border_outlined},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackground, // Set Scaffold background to white
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildHeader(),
                  _buildProfileInfo(),
                  _buildSectionHeader('Account'),
                  // Add a separator before the first list item for visual grouping
                  const Divider(color: Color(0xFFF0F4F4), height: 1),
                  ...accountItems.map(
                    (item) => _buildListItem(
                      title: item['title']!,
                      icon: item['icon']!,
                      context: context, // Pass context for potential navigation
                    ),
                  ),
                  _buildSectionHeader('Activity'),
                  const Divider(color: Color(0xFFF0F4F4), height: 1),
                  ...activityItems.map(
                    (item) => _buildListItem(
                      title: item['title']!,
                      icon: item['icon']!,
                      context: context, // Pass context for potential navigation
                    ),
                  ),
                  const SizedBox(height: 16),
                ],
              ),
            ),
          ),
        ],
      ),
      // --- Bottom Navigation Bar ---
      // Assuming 0: Categories, 1: Bookings, 2: Profile (index 2)
      bottomNavigationBar: BottomNavBar(currentIndex: 2, context: context),
    );
  }

  // --- Widget Builders ---
  Widget _buildHeader() {
    return Container(
      color: kBackground,
      padding: const EdgeInsets.fromLTRB(16, 40, 16, 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Icon color updated to kTextPrimary (dark)
          const Icon(Icons.menu, color: kTextPrimary, size: 24),
          const Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                'Profile',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: kTextPrimary, // Updated text color
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  letterSpacing: -0.33,
                ),
              ),
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.settings_outlined,
              color: kTextPrimary, // Updated icon color
              size: 24,
            ),
            padding: EdgeInsets.zero,
            constraints: const BoxConstraints(minWidth: 48, minHeight: 48),
          ),
        ],
      ),
    );
  }

  Widget _buildProfileInfo() {
    // Colors are inherited via constants, no need to change here, but ensure constants are used
    return const Padding(
      padding: EdgeInsets.all(16.0),
      child: Center(
        child: Column(
          children: [
            CircleAvatar(
              radius: 64,
              // Use a placeholder background color behind the image for white themes
              backgroundColor: kIconBackground,
              backgroundImage: NetworkImage(userAvatarUrl),
            ),
            SizedBox(height: 16),
            Text(
              userName,
              style: TextStyle(
                color: kTextPrimary, // Updated text color
                fontSize: 22,
                fontWeight: FontWeight.bold,
                letterSpacing: -0.33,
              ),
              textAlign: TextAlign.center,
            ),
            Text(
              memberSince,
              style: TextStyle(
                color: kTextSecondary, // Updated text color
                fontSize: 16,
                fontWeight: FontWeight.normal,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionHeader(String title) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16, top: 16, bottom: 8),
      child: Text(
        title,
        style: const TextStyle(
          color: kTextPrimary, // Updated text color
          fontSize: 18,
          fontWeight: FontWeight.bold,
          letterSpacing: -0.33,
        ),
      ),
    );
  }

  Widget _buildListItem(
      {required String title,
      required IconData icon,
      required BuildContext context}) {
    return InkWell(
      onTap: () {
        // Example: If 'Bookings' is tapped, navigate to the bookings screen (optional logic)
        // if (title == 'Bookings') {
        //   Navigator.pushNamed(context, '/bookings');
        // }
        debugPrint('$title tapped');
      },
      child: Container(
        color: kBackground, // Updated background color
        padding: const EdgeInsets.symmetric(horizontal: 16),
        constraints: const BoxConstraints(minHeight: 56),
        child: Column(
          // Use Column to hold the list item content and the separator
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Row(
                    children: [
                      Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          color:
                              kIconBackground, // Updated icon background color
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Icon(icon,
                            color: kTextPrimary,
                            size: 24), // Updated icon color
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Text(
                          title,
                          style: const TextStyle(
                              color: kTextPrimary,
                              fontSize: 16), // Updated text color
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                ),
                const Icon(Icons.chevron_right,
                    color: kTextSecondary, size: 28), // Chevron color
              ],
            ),
            // Add a divider after each list item (except possibly the last one in a group)
            const Divider(color: Color(0xFFF0F4F4), height: 1, indent: 56),
          ],
        ),
      ),
    );
  }
}
