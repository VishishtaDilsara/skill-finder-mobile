import 'package:flutter/material.dart';
import '../routes.dart';
import '../widgets/bottom_navbar.dart'; // Import the reusable BottomNavBar widget

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  // --- Color Palette ---
  static const Color kBackground = Color(0xFF111618);
  static const Color kSearchBg = Color(0xFF283339);
  static const Color kTextPrimary = Colors.white;
  static const Color kTextSecondary = Color(0xFF9DB0B9);

  // --- Mock Data ---
  final List<Map<String, dynamic>> popularServices = const [
    {
      'name': 'Construction',
      'imageUrl':
          'https://lh3.googleusercontent.com/aida-public/AB6AXuARazfNl32d4YUdVtdvbU1xXx5AAyjXx36dSFOxqvuISsPMfV7z6uZPmp9H-7_p_iK2uZ61NgiUK4cvQ2BeCvdjVJeYjCQlJV3MSwunXRGY20EYbbD-AcAuVyTSIOS4jU08sC_XdlRsOeDoX72qOYg1M-8S_sKpVFvNSWVAgse7wrbR9ghmKmz2SIcJr0UiJkLKOOzQ2EMoY_CR82u-3ZETTP6tg-dzYroMvTlTnNaOHKTuxOFChsyzFXqohlEMrQQ5GN5TD4-udno',
    },
    {
      'name': 'Plumbing',
      'imageUrl':
          'https://lh3.googleusercontent.com/aida-public/AB6AXuADuT6QfzWJZw5lWagRX9C4CRDYOnPb8j5zWuJwHg0BFOGRGMS5sLaC6hz-TtDgeavlz7jG3lT8WVXprp6t3gqsl8Ffs_V6FDumR0zQZMq782IOgROa8Jy7-_untK9Z_ozSu72uzMNbMLJDvGQxPUENwaQbwo0DWJumMnaCl07XmigCQOndFKlN788ouV9jQF4gAhr7Pw3IFqlN7R7tr7oxhDOufpCwtszmMcYt98ARkBJDomoTX6iGNMtigDGdIfLCyl6Q3up20Ak',
    },
    {
      'name': 'Electrical',
      'imageUrl':
          'https://lh3.googleusercontent.com/aida-public/AB6AXuDYwG8hb1L4MiccpQtEP9KEirJZqYPCt454iSsZUsjEseX5AJYzMTQpe47yGUamuR6ro9XXvGGHBcJxHMJQNU7ftCXiHzavr7YjA5blvEf0f-ZyX26_9pOOCS0_GCJTat1e5TQo8zRRyFtX6hYjSPGgEeZypmTXfYT58dvGllCNML-flHmIFHRguXzWzlzeIN0Dcg0vBlsoGSo_WFRDZ7hOD4aYoi7QGwxiNt9LblQPSyEAtXRt6ZERLECCmfUFBphsWBB-Z3ZNCkQ',
    },
    {
      'name': 'Landscaping',
      'imageUrl':
          'https://lh3.googleusercontent.com/aida-public/AB6AXuD87kpJI_w-PTBon16dbq7Xk4B8E9hbOQd5iF6sf3RY5dsuZw2HIW02QL480TEbocwM4rYtiqAzyXWY9KSBBiYKHcl6fMsH0w9w4lvtgvHTFy0hmmMg67isUTbC6CPur_h0r7F5DxKAFVi--jrxi4nPSq7zUWPyy3WTfGZBVrKMweQUNWPWOb4jP4arYCoLhr5PrzkQ77BsqfXT9ZLVhWzPMsuuxXe35dAqSLGFa6uDNniKxrLwo5IXlg7Xw2MIL9GVWjS4z1aSdr4',
    },
  ];

  final List<Map<String, dynamic>> featuredProviders = const [
    {
      'name': 'Alex Mason',
      'service': 'Construction',
      'imageUrl':
          'https://lh3.googleusercontent.com/aida-public/AB6AXuC7IvADTFmkxWQvQerqW2LJSTt6xQNaKjcZ6rk2vDDIJtynRqbXAO01dOZJHRNOv96u3musUM5mfY3iPpiyPwIIqwnrJ9UjRnmm_U1rZsC_m0QjeYwmuHW9t90N39mGhu4uCkdB03s8wHCgQXQlX04azbyAoqpm9UID_2mBbXip2TMF3TpsWwjtonMO6KfUATpYSY_cbf1PqM4sTKLx_ItbnhNt4dygBmD3VlDQ4f6A1nAwx7cU-pd8qmrttH3aq9ecv4ofO6BSX-g',
    },
    {
      'name': 'Sophia Clark',
      'service': 'Plumbing',
      'imageUrl':
          'https://lh3.googleusercontent.com/aida-public/AB6AXuCpCyRhUVaGCPjRr3hu1y_3GK1l4drkm2fcBOGnzVIqFGN9tSEuVHMInMkjprEwNmLA81_Xa-r6vlWIq6IXNtS9EpMrHaEis4pMQcYklk_JWmDhTtMLtR4LJGoAsxiqBPxmxOYG90tV94stZd-CaBuY2gHoa0-BaKEK8HQEoRWG_WY4-Q8uBHzz-LQSgzwfkc728mK4DMq3DMAD0qQldCK599_ABVCUDcTgbsoHOBDreLI0NOQsN4J8ItNBlILyT0BrnMBDsAKlKtw',
    },
    {
      'name': 'Ethan Carter',
      'service': 'Electrical',
      'imageUrl':
          'https://lh3.googleusercontent.com/aida-public/AB6AXuA_JUe37s2Dqq9y_5IVH0hOxFlpwifBbfrmRnK3Y6Ig_Z2T29HFL6LlrfD6sR0EIgcwbT5WarmAIlXBItNVxJ21qF6tjuW7sXbwD2NWahDu_yWsJznbJh9BZmQg7AJo_QksV3ejw4fJh7xtLqWsLYsSkO5I-bjGTuh7hoHYqmSXRsOAraWX2cUCmHnR3VKOd4hFHDXcRk-WgTgCuLlN4XzzTf5lDdfyNMgDlKn-fVf36p1SMaOEeuH7UeyfDphjqIWI7fxdSs7VGsI',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackground,
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildHeader(context),
                  _buildSearchBar(),
                  _buildSectionTitle('Popular Services'),
                  _buildPopularServicesList(),
                  _buildSectionTitle('Featured Providers'),
                  _buildFeaturedProvidersGrid(context),
                  const SizedBox(height: 16),
                ],
              ),
            ),
          ),
          // --- Bottom Navigation Bar using reusable widget ---
          BottomNavBar(currentIndex: 0, context: context),
        ],
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Container(
      color: kBackground,
      padding: const EdgeInsets.fromLTRB(16, 40, 16, 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildIcon(Icons.menu, onTap: () {}),
          const Expanded(
            child: Text(
              'Home',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: kTextPrimary,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          _buildIcon(Icons.notifications_none, onTap: () {}),
        ],
      ),
    );
  }

  Widget _buildIcon(IconData icon, {VoidCallback? onTap}) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 4.0),
        child: Icon(icon, color: kTextPrimary, size: 24),
      ),
    );
  }

  Widget _buildSearchBar() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Container(
        height: 48,
        decoration: BoxDecoration(
          color: kSearchBg,
          borderRadius: BorderRadius.circular(12),
        ),
        child: const TextField(
          decoration: InputDecoration(
            hintText: 'Search for services or providers',
            hintStyle: TextStyle(color: kTextSecondary, fontSize: 16),
            border: InputBorder.none,
            prefixIcon: Icon(Icons.search, color: kTextSecondary, size: 24),
            contentPadding: EdgeInsets.symmetric(vertical: 12),
          ),
          style: TextStyle(color: kTextPrimary, fontSize: 16),
          cursorColor: kTextPrimary,
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 20, 16, 12),
      child: Text(
        title,
        style: const TextStyle(
          color: kTextPrimary,
          fontSize: 22,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _buildPopularServicesList() {
    return SizedBox(
      height: 190,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        itemCount: popularServices.length,
        itemBuilder: (context, index) {
          final service = popularServices[index];
          return Padding(
            padding: EdgeInsets.only(
              right: index == popularServices.length - 1 ? 0 : 12,
            ),
            child: ServiceCard(
              name: service['name']!,
              imageUrl: service['imageUrl']!,
              onTap: () => Navigator.pushNamed(context, AppRoutes.providerList),
            ),
          );
        },
      ),
    );
  }

  Widget _buildFeaturedProvidersGrid(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: featuredProviders.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
          childAspectRatio: 0.8,
        ),
        itemBuilder: (context, index) {
          final provider = featuredProviders[index];
          return ProviderCard(
            name: provider['name']!,
            service: provider['service']!,
            imageUrl: provider['imageUrl']!,
            onTap: () => Navigator.pushNamed(context, AppRoutes.profile),
          );
        },
      ),
    );
  }
}

// --- Custom Widgets ---
class ServiceCard extends StatelessWidget {
  final String name;
  final String imageUrl;
  final VoidCallback onTap;

  const ServiceCard({
    super.key,
    required this.name,
    required this.imageUrl,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        width: 160,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 160,
              height: 160,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                image: DecorationImage(
                  image: NetworkImage(imageUrl),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 16),
            Text(
              name,
              style: const TextStyle(
                color: HomeScreen.kTextPrimary,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}

class ProviderCard extends StatelessWidget {
  final String name;
  final String service;
  final String imageUrl;
  final VoidCallback onTap;

  const ProviderCard({
    super.key,
    required this.name,
    required this.service,
    required this.imageUrl,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.only(bottom: 12),
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(8)),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: AspectRatio(
                aspectRatio: 1,
                child: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: NetworkImage(imageUrl),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 12),
            Text(
              name,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: HomeScreen.kTextPrimary,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
            Text(
              service,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: HomeScreen.kTextSecondary,
                fontSize: 14,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
