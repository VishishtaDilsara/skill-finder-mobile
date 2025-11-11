import 'package:flutter/material.dart';
import '../routes.dart'; // Assuming AppRoutes is defined here

// Dummy data for the UI elements
final List<String> _filters = [
  'All',
  'Popular',
  'New',
  'Nearby',
  'Recommended',
];

// UPDATED: Using local asset paths instead of network image URLs
final List<Map<String, dynamic>> _categories = [
  {'name': 'Electricians', 'image': 'assets/images/electrician.jpg'},
  {'name': 'Plumbers', 'image': 'assets/images/plumber.jpg'},
  {'name': 'Carpenters', 'image': 'assets/images/carpenter.jpg'},
  {'name': 'Painters', 'image': 'assets/images/painter.jpg'},
  {'name': 'Landscapers', 'image': 'assets/images/landscaper.jpg'},
  {'name': 'Cleaners', 'image': 'assets/images/cleaner.jpg'},
];

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({super.key});

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  // Index 1 corresponds to Categories (Home=0, Categories=1, Bookings=2, Profile=3)
  int _currentIndex = 1;

  // --- Helper Methods to Build UI Sections ---

  // Builds the custom App Bar with centered title and search icon
  PreferredSizeWidget _buildAppBar() {
    return AppBar(
      backgroundColor: const Color(0xFF111618),
      elevation: 0,
      automaticallyImplyLeading: false, // Hide back button if not needed
      title: const Text(
        'Services',
        style: TextStyle(
          color: Colors.white,
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
      centerTitle: true,
      actions: [
        IconButton(
          icon: const Icon(Icons.search, color: Colors.white, size: 24),
          onPressed: () {
            // Handle search
          },
        ),
        const SizedBox(width: 4.0),
      ],
    );
  }

  // Builds the horizontal scrollable filter chips
  Widget _buildFilterBar() {
    return Padding(
      padding: const EdgeInsets.only(left: 12.0, bottom: 8.0),
      child: SizedBox(
        height: 40,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: _filters.length,
          itemBuilder: (context, index) {
            final isActive = index == 0; // 'All' is active initially
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4.0),
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                decoration: BoxDecoration(
                  color: isActive
                      ? Colors.blue.shade600
                      : const Color(0xFF283339),
                  borderRadius: BorderRadius.circular(10),
                ),
                alignment: Alignment.center,
                child: Text(
                  _filters[index],
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  // Builds the "Browse by category" header and grid
  Widget _buildCategoryGrid(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 20.0, bottom: 12.0),
            child: Text(
              'Browse by category',
              style: TextStyle(
                color: Colors.white,
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          GridView.builder(
            shrinkWrap: true,
            physics:
                const NeverScrollableScrollPhysics(), // Important for SingleChildScrollView
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 12.0,
              mainAxisSpacing: 12.0,
              childAspectRatio: 0.9, // Adjust to fit image and text
            ),
            itemCount: _categories.length,
            itemBuilder: (context, index) {
              return _CategoryCard(
                category: _categories[index],
                onTap: () =>
                    Navigator.pushNamed(context, AppRoutes.providerList),
              );
            },
          ),
        ],
      ),
    );
  }

  // Builds the custom Bottom Navigation Bar
  Widget _buildBottomNavBar(BuildContext context) {
    // Define the custom colors based on the HTML
    const Color navBarColor = Color(0xFF1C2327);

    return Container(
      decoration: const BoxDecoration(
        border: Border(top: BorderSide(color: Color(0xFF283339), width: 1.0)),
        color: navBarColor,
      ),
      padding: EdgeInsets.only(
        top: 8.0,
        bottom:
            8.0 + MediaQuery.of(context).padding.bottom, // Add system padding
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildNavItem(context, Icons.home_outlined, Icons.home, 'Home', 0),
          _buildNavItem(
            context,
            Icons.list_outlined,
            Icons.list,
            'Categories',
            1,
          ),
          _buildNavItem(
            context,
            Icons.calendar_today_outlined,
            Icons.calendar_today,
            'Bookings',
            2,
          ),
          _buildNavItem(
            context,
            Icons.person_outline,
            Icons.person,
            'Profile',
            3,
          ),
        ],
      ),
    );
  }

  // Helper method for each navigation item
  Widget _buildNavItem(
    BuildContext context,
    IconData icon,
    IconData activeIcon,
    String label,
    int index,
  ) {
    final bool isActive = _currentIndex == index;
    // The colors are now defined directly here, eliminating the need for the
    // unused local variables in _buildBottomNavBar.
    final Color color = isActive ? Colors.white : const Color(0xFF9DB0B9);

    return Expanded(
      child: InkWell(
        onTap: () {
          setState(() {
            _currentIndex = index;
          });
          // Add navigation logic based on index (e.g., switch case for AppRoutes)
        },
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(isActive ? activeIcon : icon, color: color, size: 24),
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
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF111618),
      appBar: _buildAppBar(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _buildFilterBar(),
            _buildCategoryGrid(context),
            // Add space to ensure content doesn't sit under the bottom navigation bar
            SizedBox(height: 16 + MediaQuery.of(context).padding.bottom),
          ],
        ),
      ),
      bottomNavigationBar: _buildBottomNavBar(context),
    );
  }
}

// Custom widget for the category card
class _CategoryCard extends StatelessWidget {
  final Map<String, dynamic> category;
  final VoidCallback onTap;

  const _CategoryCard({required this.category, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                // UPDATED: Using AssetImage for local files
                image: DecorationImage(
                  image: AssetImage(category['image']),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8.0, bottom: 4.0),
            child: Text(
              category['name'],
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
