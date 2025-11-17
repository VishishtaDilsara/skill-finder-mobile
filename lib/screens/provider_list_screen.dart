import 'package:flutter/material.dart';
import '../widgets/bottom_navbar.dart';
import '../routes.dart'; // ✅ Import AppRoutes

class ProviderListScreen extends StatelessWidget {
  final String categoryName;
  const ProviderListScreen({super.key, required this.categoryName});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> providers = [
      {
        'name': 'Ethan Harper',
        'desc': 'Expert in custom furniture and installations',
        'rating': '4.8',
        'image':
            'https://lh3.googleusercontent.com/aida-public/AB6AXuAGRLF1K8Hi4xg_LmdM5O9CVY6gbs0fU_AYU0qmmOvgnUsa1g7SdcW7FykDNX2lqy51oGjyrLJy3DWBhjD0jAHU0dzMZbHJAbN49Ez4RbscbE1S-WZg_KO7aaOXSHzJt4IGgn-utmTr98mPKqzZWikQpdAv_iK28fD-CX3IxoUEHCYmyCGbi--qqN6AM7R3-Zj5YW8iqpLwGwuB2sHRDEUsoho7ZWyRBPQT3Gfx57sPxMh6c--RxyO9COUkJEoARlhv-n8hS62OCywU',
      },
      {
        'name': 'Olivia Bennett',
        'desc': 'Specializes in home repairs and renovations',
        'rating': '4.7',
        'image':
            'https://lh3.googleusercontent.com/aida-public/AB6AXuBQIfuD0vFnV4kNUBiv9NAS6vVyAI9JFlBDfxDYhK29euwOH4cZPHuWi6qwnRZk91MFuNzmmsOPBmi9Ob9wKTk6yjHQVXz01Kh4Ti3P9Q_ggZOuY5RBtGCiExgHXLyAP46J_X9NQomKNKGOy7-mZ_YmcSFdTfGHil6NueEageUYS4IuU_aOe9GlBxArp_0nNl-8GBDvyruyfZeORp2Xbdxa0-zm6JeZ2fu3_KINIlYDLscY9pBxRzqWwAlDZMHpgw2Sm1IXeniHZ3WY',
      },
      {
        'name': 'Noah Carter',
        'desc': 'Skilled in detailed woodworking and finishing',
        'rating': '4.6',
        'image':
            'https://lh3.googleusercontent.com/aida-public/AB6AXuBQMDigPtHScjGHYC3ebjfUrqlK07xmh6vsp8AX1iXTCeqTsW2jHSwcE7NAcyI7nahWv-oKYou6DElRk4Z5R4V-ZeY2g6vRWjs7v2WIVNScJ6KkbWwtmukBkch1m6pTR2UnLtgXbifC9GqQ3X5tRYhwnnXaoj97p9_vgxQ9PdQGnRPF3g3Q9966PRMP799KRZ-nAlPSXYH1eGHAaaaLfeMsLw9C3ZUViy-2LWgq9RMMllZRy9_AL_wfey1w4T2PVF-igSslnnaNri8e',
      },
      {
        'name': 'Sophia Evans',
        'desc': 'Offers comprehensive carpentry services',
        'rating': '4.5',
        'image':
            'https://lh3.googleusercontent.com/aida-public/AB6AXuDc1tjv06uJUbsgpZ2DtKwpRgEPxEaZTmzAB2YKGYo2scQzaHls9-nUWhaIpR4O5SvNgOGLVKvhTIUVsemIVo8qTirefOISXP4-DJ6tZNGbnVEuIMPSBjQLft7_i9vB-63a8fihv1uHSHRSiiMOrMnKe_z7PO1_H_d3KP2RenmoCRcrQimhOnzOAURYIyfKGR2-nMKoUqV2Ul0RXmwI5bBLy6-u93C0tS1EjJ3pt6XfO9lU97fwHCGRamz6Hqk7IqlaWO95Qwp2nsaL',
      },
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          // --- AppBar ---
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4),
              child: Row(
                children: [
                  IconButton(
                    icon: const Icon(
                      Icons.arrow_back_ios_new,
                      color: Color(0xFF111818),
                    ),
                    onPressed: () => Navigator.pop(context),
                  ),
                  Expanded(
                    child: Text(
                      categoryName,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        color: Color(0xFF111818),
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        letterSpacing: -0.015,
                      ),
                    ),
                  ),
                  const SizedBox(width: 40),
                ],
              ),
            ),
          ),

          // --- Search Bar ---
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search for services',
                hintStyle: const TextStyle(color: Color(0xFF618989)),
                prefixIcon: const Icon(
                  Icons.search,
                  color: Color(0xFF618989),
                  size: 24,
                ),
                filled: true,
                fillColor: const Color(0xFFF0F4F4),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide.none,
                ),
                contentPadding: const EdgeInsets.symmetric(
                  vertical: 14,
                  horizontal: 8,
                ),
              ),
            ),
          ),

          // --- Dynamic Title ---
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Top $categoryName",
                style: const TextStyle(
                  color: Color(0xFF111818),
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  letterSpacing: -0.015,
                ),
              ),
            ),
          ),

          // --- Providers List ---
          Expanded(
            child: ListView.builder(
              itemCount: providers.length,
              itemBuilder: (context, index) {
                final provider = providers[index];
                return InkWell(
                  onTap: () {
                    // ✅ Use route navigation
                    Navigator.pushNamed(
                      context,
                      AppRoutes.providerProfile,
                      arguments: {
                        'name': provider['name'],
                        'desc': provider['desc'],
                        'rating': provider['rating'],
                        'image': provider['image'],
                      },
                    );
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 8,
                    ),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      border: Border(
                        bottom: BorderSide(color: Color(0xFFF0F4F4)),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            CircleAvatar(
                              radius: 28,
                              backgroundImage: NetworkImage(provider['image']),
                            ),
                            const SizedBox(width: 12),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  provider['name'],
                                  style: const TextStyle(
                                    color: Color(0xFF111818),
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                const SizedBox(height: 4),
                                SizedBox(
                                  width: 220,
                                  child: Text(
                                    provider['desc'],
                                    style: const TextStyle(
                                      color: Color(0xFF618989),
                                      fontSize: 13,
                                    ),
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 2,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        Text(
                          provider['rating'],
                          style: const TextStyle(
                            color: Color(0xFF111818),
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),

          // --- Bottom NavBar ---
          BottomNavBar(currentIndex: 0, context: context),
        ],
      ),
    );
  }
}
