import 'package:flutter/material.dart';
import '../routes.dart'; // Assuming this file exists for navigation

class ProviderListScreen extends StatelessWidget {
  const ProviderListScreen({super.key});

  static const Color kBackground = Color(0xFF111618);
  static const Color kHeaderBackground = Color(0xFF111618);
  static const Color kButtonBackground = Color(0xFF283339);
  static const Color kBottomNavBarBackground = Color(0xFF1C2327);
  static const Color kInactiveIconColor = Color(0xFF9DB0B9);
  static const Color kDescriptionColor = Color(0xFF9DB0B9);
  static const Color kWhite = Colors.white;

  // Mock data for the provider list
  final List<Map<String, dynamic>> providers = const [
    {
      'name': 'Ethan Carter',
      'service': 'Plumbing',
      'rating': 4.8,
      'imageUrl':
          'https://lh3.googleusercontent.com/aida-public/AB6AXuCcGU-FOglWCP9Ny_zYZYLzlJev_gZWbocc-bP-ZR-_RD4Fr52yVZkM9JB_iiABW4dsi_FvBK5KVZVz9QmME_y1zcR5Z3gP3mkdY-mrM90Cw2z5VqQz2SVC60a2a0s7AM34vEH2-1PF8GYRJ1WowLNDQbo3FTGPWZXhvhOX_pJhCLvaPmMsrGkzkFgfsTTsVPCHR4aVGwraYJw3mu7395M2F85f23H8rE30UypYUaGrcYZiK1bO0PV3itPiom9osY-mNRd0NM7tVuc',
    },
    {
      'name': 'Liam Harper',
      'service': 'Plumbing',
      'rating': 4.9,
      'imageUrl':
          'https://lh3.googleusercontent.com/aida-public/AB6AXuAbosEsQUT6sHi1ilVEAVYQF0vnUO8vegwAhfiDiTc7J55D2gZn-jmQReY5mg-5w6fqxz_KIj-7sw-3kitacquLUzm_JDhaCQVopGLGKj75gQn2YF7W_jv00NUiIyzVTM0C7muva4zQrsYIUJAnbUjN-cns7iy1PF2WGcy1YYKyL4jrTd2BiBFoQBaXuA9foqh1E5lWedHA2LDqDpMZW5bm9Z7AGjsGF4LHGbI22eh-SuEVzMernKrhjoosGcxJAbUqwCzlubA_Zvg',
    },
    {
      'name': 'Noah Bennett',
      'service': 'Plumbing',
      'rating': 4.7,
      'imageUrl':
          'https://lh3.googleusercontent.com/aida-public/AB6AXuAdrRqVmIyXadqMSn5kIay2-ZD13Xeav1Etj9ywy_gcgR7hUlecVC7IEJBdnRqrcOHK6Z41RDPTD6O0yTBFJ19AZ5lxH-GtwVUGOIVYxlSl42KTP2FmdWOYWRQ-B0XjA0MhRB635u0w7_Ka64VIYR0MkKrepBPp8WkoPQXcKq1-StTmnOTuTapeQqCoxELT3dvCicilBa5vaPV1d18l4tNAdJUF34Dc83-17RKVtBR2q0-dIEA3MFQu3bN81m1kFJhQl7Wk8zpMWJ4',
    },
    {
      'name': 'Oliver Reed',
      'service': 'Plumbing',
      'rating': 4.6,
      'imageUrl':
          'https://lh3.googleusercontent.com/aida-public/AB6AXuAA2iQDZZvXpH98_Nx-BlNv68dlgTQ5tSBRlQpv93ABYyebTNNsxLas0tuprrCrzQUlRAwR6eiX6OMLf7-t3iQ4P3jsaJB_Mu0vFmVExrdKz1Oi00zD1JKbOgZkdJGVMhCrZ0njCVE-oMcOpj4RTnjSVOR0f8GGlnfOOV1HPJWJhaMdVM01F_eTq7UkUvstWIP9O7TqiYlUKMhJ-tJyKll13Z7An4Jg7LdtD7GvEDZudZydeOK4kJoE9olBemo5VkfXewia1RmfIt4',
    },
    // Add more providers here if needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackground,
      // The overall structure is a Column in the body to hold the content and the BottomNavigationBar
      body: Column(
        children: [
          // Header and Filter Buttons
          _buildHeader(),
          _buildFilterBar(),

          // Provider List using ListView.builder
          Expanded(
            child: ListView.builder(
              itemCount: providers.length,
              itemBuilder: (context, index) {
                final provider = providers[index];
                return ProviderListItem(
                  name: provider['name']!,
                  service: provider['service']!,
                  rating: provider['rating']!,
                  imageUrl: provider['imageUrl']!,
                  onTap: () =>
                      Navigator.pushNamed(context, AppRoutes.providerProfile),
                );
              },
            ),
          ),

          // Bottom Navigation Bar
          _buildBottomNavBar(context),
        ],
      ),
    );
  }

  // --- Widgets for UI Components ---

  Widget _buildHeader() {
    return Container(
      color: kHeaderBackground,
      padding: const EdgeInsets.fromLTRB(
        16,
        40,
        16,
        8,
      ), // Adjusted top padding for status bar area
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Back Arrow Icon
          _buildIcon(
            Icons.arrow_back,
            onTap: () {
              /* Handle back action */
            },
          ),
          // Title
          const Expanded(
            child: Text(
              'Plumbers',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: kWhite,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          // Placeholder to balance title
          const SizedBox(width: 48), // Size of the back icon + padding
        ],
      ),
    );
  }

  Widget _buildFilterBar() {
    return Container(
      color: kHeaderBackground,
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      height: 52, // Approximate height for the bar
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          _buildFilterButton('Sort', Icons.keyboard_arrow_down_rounded),
          const SizedBox(width: 12),
          _buildFilterButton('Price', Icons.keyboard_arrow_down_rounded),
          const SizedBox(width: 12),
          _buildFilterButton('Rating', Icons.keyboard_arrow_down_rounded),
        ],
      ),
    );
  }

  Widget _buildFilterButton(String text, IconData icon) {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        backgroundColor: kButtonBackground,
        foregroundColor: kWhite,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        padding: const EdgeInsets.only(left: 16, right: 8),
        minimumSize: const Size(0, 32), // Constrain height
        elevation: 0,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            text,
            style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
          ),
          const SizedBox(width: 4),
          Icon(icon, size: 20, color: kWhite),
        ],
      ),
    );
  }

  Widget _buildBottomNavBar(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          height: 1,
          color: kButtonBackground, // Mimics the border
        ),
        Container(
          color: kBottomNavBarBackground,
          padding: const EdgeInsets.only(top: 8, bottom: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildNavBarItem(Icons.home_outlined, 'Home', isSelected: false),
              _buildNavBarItem(Icons.list_alt, 'Categories', isSelected: true),
              _buildNavBarItem(
                Icons.calendar_month_outlined,
                'Bookings',
                isSelected: false,
              ),
              _buildNavBarItem(
                Icons.person_outline,
                'Profile',
                isSelected: false,
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildNavBarItem(
    IconData icon,
    String label, {
    required bool isSelected,
  }) {
    final color = isSelected ? kWhite : kInactiveIconColor;

    return InkWell(
      onTap: () {
        /* Handle navigation */
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 24, color: color),
          const SizedBox(height: 4),
          Text(
            label,
            style: TextStyle(
              color: color,
              fontSize: 10,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildIcon(IconData icon, {VoidCallback? onTap}) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(4),
        child: Icon(icon, color: kWhite, size: 24),
      ),
    );
  }
}

// --- Custom Widget for List Item ---

class ProviderListItem extends StatelessWidget {
  final String name;
  final String service;
  final double rating;
  final String imageUrl;
  final VoidCallback onTap;

  const ProviderListItem({
    super.key,
    required this.name,
    required this.service,
    required this.rating,
    required this.imageUrl,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        color: ProviderListScreen.kBackground,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        constraints: const BoxConstraints(minHeight: 72),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                // Profile Image
                Container(
                  width: 56, // h-14
                  height: 56, // h-14
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: NetworkImage(imageUrl),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                // Name and Service
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      name,
                      style: const TextStyle(
                        color: ProviderListScreen.kWhite,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      service,
                      style: const TextStyle(
                        color: ProviderListScreen.kDescriptionColor,
                        fontSize: 14,
                        fontWeight: FontWeight.normal,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ],
            ),
            // Rating
            Text(
              rating.toStringAsFixed(1),
              style: const TextStyle(
                color: ProviderListScreen.kWhite,
                fontSize: 16,
                fontWeight: FontWeight.normal,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
