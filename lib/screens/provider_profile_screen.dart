import 'package:flutter/material.dart';
import '../routes.dart';

class ProviderProfileScreen extends StatelessWidget {
  const ProviderProfileScreen({super.key});

  static const Color kBackground = Color(0xFF111618);
  static const Color kCard = Color(0xFF1C252A);
  static const Color kAccentBlue = Color(0xFF00B4D8);
  static const Color kAccentGreen = Color(0xFF52B788);
  static const Color kMutedText = Color(0xFF9BA4A9);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackground,
      appBar: AppBar(
        backgroundColor: kBackground,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.white, size: 20),
          onPressed: () => Navigator.pushNamed(context, AppRoutes.providerList),
        ),
        title: const Text(
          'Provider Profile',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
        child: Column(
          children: [
            _buildProfileHeader(),
            const SizedBox(height: 20),
            _buildRatingAndJobs(),
            const SizedBox(height: 24),

            _buildSectionTitle('About Me'),
            const SizedBox(height: 8),
            const Text(
              'Passionate professional with 8+ years of experience delivering top-quality services. '
              'Dedicated to ensuring customer satisfaction with every project.',
              style: TextStyle(color: kMutedText, fontSize: 14, height: 1.5),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 24),

            _buildSectionTitle('Skills'),
            const SizedBox(height: 8),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              alignment: WrapAlignment.center,
              children: [
                _buildSkillChip('Electrical'),
                _buildSkillChip('Plumbing'),
                _buildSkillChip('Carpentry'),
                _buildSkillChip('Painting'),
              ],
            ),
            const SizedBox(height: 24),

            _buildSectionTitle('Contact Info'),
            const SizedBox(height: 8),
            _buildContactRow(Icons.phone, '+94 77 123 4567'),
            _buildContactRow(Icons.email, 'provider@mail.com'),
            _buildContactRow(Icons.location_on, 'Colombo, Sri Lanka'),
            const SizedBox(height: 32),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, AppRoutes.requestService);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: kAccentBlue,
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: const Text(
                  'Book Service',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),

      // --- Bottom Navigation ---
      bottomNavigationBar: Container(
        padding: const EdgeInsets.symmetric(vertical: 12),
        decoration: const BoxDecoration(
          color: kCard,
          border: Border(top: BorderSide(color: Color(0xFF222C32))),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _buildNavItem(
              context,
              Icons.home_outlined,
              'Home',
              false,
              AppRoutes.home,
            ),
            _buildNavItem(
              context,
              Icons.category_outlined,
              'Categories',
              false,
              AppRoutes.categories,
            ),
            _buildNavItem(
              context,
              Icons.calendar_month_outlined,
              'Bookings',
              false,
              AppRoutes.bookings,
            ),
            _buildNavItem(
              context,
              Icons.person_outlined,
              'Profile',
              true,
              AppRoutes.providerProfile,
            ),
          ],
        ),
      ),
    );
  }

  // --- Widgets ---

  Widget _buildProfileHeader() {
    return Column(
      children: [
        const CircleAvatar(
          radius: 50,
          backgroundImage: AssetImage('assets/images/provider.jpg'),
        ),
        const SizedBox(height: 12),
        const Text(
          'Samantha Perera',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 4),
        const Text(
          'Electrician • 8 yrs experience',
          style: TextStyle(color: kMutedText, fontSize: 14),
        ),
      ],
    );
  }

  Widget _buildRatingAndJobs() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildStatItem(Icons.star, '4.8', 'Rating'),
        const SizedBox(width: 24),
        _buildStatItem(Icons.work_outline, '120+', 'Jobs'),
      ],
    );
  }

  Widget _buildStatItem(IconData icon, String value, String label) {
    return Row(
      children: [
        Icon(icon, color: kAccentGreen, size: 20),
        const SizedBox(width: 6),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              value,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w600,
              ),
            ),
            Text(
              label,
              style: const TextStyle(color: kMutedText, fontSize: 12),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildSectionTitle(String title) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Text(
        title,
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w600,
          fontSize: 16,
        ),
      ),
    );
  }

  Widget _buildSkillChip(String skill) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: kCard,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: kAccentBlue.withOpacity(0.5)),
      ),
      child: Text(
        skill,
        style: const TextStyle(color: Colors.white, fontSize: 13),
      ),
    );
  }

  Widget _buildContactRow(IconData icon, String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          Icon(icon, color: kAccentBlue, size: 18),
          const SizedBox(width: 8),
          Text(text, style: const TextStyle(color: Colors.white, fontSize: 14)),
        ],
      ),
    );
  }

  Widget _buildNavItem(
    BuildContext context,
    IconData icon,
    String label,
    bool isActive,
    String route,
  ) {
    final color = isActive ? kAccentBlue : kMutedText;
    return Expanded(
      child: InkWell(
        onTap: () => Navigator.pushNamed(context, route),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, color: color, size: 24),
            const SizedBox(height: 4),
            Text(
              label,
              style: TextStyle(
                color: color,
                fontSize: 12,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
