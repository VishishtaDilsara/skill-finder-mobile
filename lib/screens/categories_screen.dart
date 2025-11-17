import 'package:flutter/material.dart';
import '../widgets/bottom_navbar.dart';
import '../routes.dart';

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({super.key});

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  final List<Map<String, dynamic>> _categories = [
    {'name': 'Carpenters', 'icon': Icons.handyman},
    {'name': 'Electricians', 'icon': Icons.build},
    {'name': 'Plumbers', 'icon': Icons.plumbing},
    {'name': 'Masons', 'icon': Icons.apartment},
    {'name': 'Painters', 'icon': Icons.format_paint},
    {'name': 'Gardeners', 'icon': Icons.grass},
  ];

  final TextEditingController _searchController = TextEditingController();

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Define main colors for improved aesthetics
    // FIX: Changed primaryColor from cyan to a neutral dark gray for the icons.
    const Color primaryColor = Color(0xFF111818); // Dark accent color for icons
    const Color darkColor = Color(0xFF111818); // Dark text/icon color
    const Color grayBorderColor = Color(0xFFDBE6E6); // Light border color
    const Color lightGrayColor = Color(0xFFF0F4F4); // Search bar background

    return Scaffold(
      backgroundColor: Colors.white,

      // ---- AppBar ----
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: AppBar(
            backgroundColor: Colors.white,
            elevation: 0,
            centerTitle: true,
            automaticallyImplyLeading: false,
            // Removed leading back button since this is a root navigation screen
            title: const Text(
              'Service Categories',
              style: TextStyle(
                color: darkColor,
                fontWeight: FontWeight.bold,
                fontSize: 20,
                letterSpacing: -0.015,
              ),
            ),
          ),
        ),
      ),

      // ---- Main Body ----
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // --- Search Bar ---
          Padding(
            padding:
                const EdgeInsets.only(left: 16.0, right: 16.0, bottom: 16.0),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: 'Search for a skill or service...',
                hintStyle: const TextStyle(color: Color(0xFF618989)),
                prefixIcon: const Icon(Icons.search, color: Color(0xFF618989)),
                filled: true,
                fillColor: lightGrayColor,
                contentPadding: const EdgeInsets.symmetric(vertical: 15),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
              ),
              onChanged: (value) {
                // Logic for filtering categories would go here
              },
            ),
          ),

          // --- Section Header ---
          const Padding(
            padding: EdgeInsets.only(left: 16.0, right: 16.0, bottom: 8.0),
            child: Text(
              'Browse all professional trades:',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: darkColor,
              ),
            ),
          ),

          // --- Categories Grid ---
          Expanded(
            child: SingleChildScrollView(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: LayoutBuilder(
                builder: (context, constraints) {
                  // Calculate crossAxisCount based on screen width for responsiveness
                  int crossAxisCount =
                      (constraints.maxWidth / 150).floor().clamp(2, 4);

                  return GridView.builder(
                    itemCount: _categories.length,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: crossAxisCount,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                      childAspectRatio:
                          2.8, // Adjusted aspect ratio for better card height
                    ),
                    itemBuilder: (context, index) {
                      final category = _categories[index];

                      return InkWell(
                        borderRadius: BorderRadius.circular(12),
                        onTap: () {
                          // Navigate to provider list
                          Navigator.pushNamed(
                            context,
                            AppRoutes.providerList,
                            arguments: {'categoryName': category['name']},
                          );
                        },
                        child: Container(
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12),
                            border:
                                Border.all(color: grayBorderColor, width: 1.5),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.05),
                                spreadRadius: 1,
                                blurRadius: 4,
                                offset: const Offset(0, 2),
                              ),
                            ],
                          ),
                          child: Row(
                            children: [
                              // Category Icon with primary color background
                              Container(
                                padding: const EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                  // FIX: Changed icon background color from cyan to a subtle gray
                                  color: lightGrayColor,
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Icon(
                                  category['icon'],
                                  color: primaryColor, // Icon color now dark
                                  size: 20,
                                ),
                              ),
                              const SizedBox(width: 12),
                              // Category Name
                              Expanded(
                                child: Text(
                                  category['name'],
                                  style: const TextStyle(
                                    color: darkColor,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ),
                              // Forward Arrow
                              const Icon(
                                Icons.arrow_forward_ios,
                                color: Color(0xFF618989),
                                size: 16,
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ),

          // --- Bottom NavBar ---
          BottomNavBar(currentIndex: 0, context: context),
        ],
      ),
    );
  }
}
