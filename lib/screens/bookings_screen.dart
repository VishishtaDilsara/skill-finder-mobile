import 'package:flutter/material.dart';
import '../widgets/bottom_navbar.dart'; // Reusable navbar widget

class BookingsScreen extends StatelessWidget {
  const BookingsScreen({super.key});

  // --- Color Palette (Updated for White Theme) ---
  static const Color kBackground = Colors.white; // White background
  static const Color kTextPrimary = Color(0xFF111818); // Dark text
  static const Color kTextSecondary = Color(0xFF618989); // Secondary/Hint text
  static const Color kTabIndicator = Color(0xFF111818); // Dark indicator
  static const Color kIconBackground =
      Color(0xFFF0F4F4); // Light background for icons/containers

  // --- Mock Data ---
  final List<Map<String, dynamic>> upcomingBookings = const [
    {
      'service': 'Plumbing Repair',
      'dateTime': 'Tue, Jul 23 · 10:00 AM',
      'price': 150,
      'icon': Icons.construction_outlined,
    },
    {
      'service': 'Electrical Installation',
      'dateTime': 'Wed, Jul 24 · 2:00 PM',
      'price': 200,
      'icon': Icons.construction_outlined,
    },
    {
      'service': 'Painting Service',
      'dateTime': 'Thu, Jul 25 · 9:00 AM',
      'price': 300,
      'icon': Icons.construction_outlined,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: kBackground,
        body: Column(
          children: [
            _buildHeader(context),
            _buildTabBar(),
            Expanded(
              child: TabBarView(
                children: [
                  _buildBookingList(upcomingBookings),
                  _buildBookingList(const []),
                ],
              ),
            ),
          ],
        ),
        // BottomNavBar instantiation is correct, assuming 'Bookings' is index 1.
        // NOTE: The previous code had currentIndex: 2, I'll use 1 which is standard for Bookings
        // when Categories is 0. If 2 is correct for your app, change it back.
        bottomNavigationBar: BottomNavBar(currentIndex: 1, context: context),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Container(
      color: kBackground,
      // Adjusted top padding for SafeArea compatibility (if needed, or keep 40)
      padding: const EdgeInsets.fromLTRB(16, 40, 16, 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildIcon(Icons.arrow_back, onTap: () => Navigator.pop(context)),
          const Expanded(
            child: Padding(
              padding: EdgeInsets.only(right: 48),
              child: Text(
                'Bookings',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: kTextPrimary, // Updated text color
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          // Placeholder for balance/profile icon if needed, currently empty space
          const SizedBox(width: 48),
        ],
      ),
    );
  }

  Widget _buildTabBar() {
    return Container(
      padding: const EdgeInsets.only(bottom: 12),
      decoration: const BoxDecoration(
        // Use a light gray line for the separator
        border: Border(bottom: BorderSide(color: Color(0xFFF0F4F4), width: 1)),
      ),
      child: const TabBar(
        indicatorColor: kTabIndicator, // Updated indicator color (dark)
        indicatorWeight: 3.0,
        labelColor: kTextPrimary, // Updated selected label color (dark)
        unselectedLabelColor:
            kTextSecondary, // Updated unselected label color (gray)
        labelStyle: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.bold,
          letterSpacing: 0.15,
        ),
        unselectedLabelStyle: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.bold,
          letterSpacing: 0.15,
        ),
        padding: EdgeInsets.symmetric(horizontal: 16),
        indicatorPadding: EdgeInsets.zero,
        tabs: [
          Tab(text: 'Upcoming', height: 48),
          Tab(text: 'Past', height: 48),
        ],
      ),
    );
  }

  Widget _buildBookingList(List<Map<String, dynamic>> bookings) {
    if (bookings.isEmpty) {
      return const Center(
        child: Text(
          'No bookings found in this category.',
          style: TextStyle(color: kTextSecondary, fontSize: 16),
        ),
      );
    }
    return ListView.builder(
      itemCount: bookings.length,
      itemBuilder: (context, index) {
        final booking = bookings[index];
        // Note: The BookingListItem needs to be defined below or in a separate file.
        return BookingListItem(
          serviceName: booking['service']!,
          dateTime: booking['dateTime']!,
          price: booking['price']!.toString(),
          icon: booking['icon']!,
          onTap: () {},
        );
      },
    );
  }

  Widget _buildIcon(IconData icon, {VoidCallback? onTap}) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(4),
        child: Icon(icon, color: kTextPrimary, size: 24), // Updated icon color
      ),
    );
  }
}

// --- Booking List Item ---
class BookingListItem extends StatelessWidget {
  final String serviceName;
  final String dateTime;
  final String price;
  final IconData icon;
  final VoidCallback onTap;

  const BookingListItem({
    super.key,
    required this.serviceName,
    required this.dateTime,
    required this.price,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        color: BookingsScreen.kBackground, // Updated to white
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        constraints: const BoxConstraints(minHeight: 72),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(
                  width: 48,
                  height: 48,
                  decoration: BoxDecoration(
                    color: BookingsScreen
                        .kIconBackground, // Updated to light background
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Icon(
                    icon,
                    color: BookingsScreen.kTextPrimary, // Updated icon color
                    size: 24,
                  ),
                ),
                const SizedBox(width: 16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      serviceName,
                      style: const TextStyle(
                        color:
                            BookingsScreen.kTextPrimary, // Updated text color
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      dateTime,
                      style: const TextStyle(
                        color:
                            BookingsScreen.kTextSecondary, // Updated text color
                        fontSize: 14,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ],
            ),
            Text(
              '\$$price',
              style: const TextStyle(
                color: BookingsScreen.kTextPrimary, // Updated text color
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
