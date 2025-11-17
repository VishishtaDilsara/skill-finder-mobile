import 'package:flutter/material.dart';
// Assuming BottomNavBar is located at '../widgets/bottom_navbar.dart'
import '../widgets/bottom_navbar.dart';
// Import the new screen
import 'request_service_screen.dart';

class ProviderProfileScreen extends StatelessWidget {
  const ProviderProfileScreen({super.key});

  // Define colors as static constants
  static const Color kTextDark = Color(0xFF111818);
  static const Color kMutedText = Color(0xFF618989);
  static const Color kPrimaryCyan = Color(0xFF13ECEC); // Blue color for action
  static const Color kLightBackground =
      Color(0xFFF0F4F4); // Added for consistency
  static const Color kLightGrey = Color(0xFFDBe6E6); // Added for consistency

  @override
  Widget build(BuildContext context) {
    // Note: AppRoutes and BottomNavBar are assumed to exist.
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.transparent,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: kTextDark),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          "Service Provider",
          style: TextStyle(
            color: kTextDark,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        centerTitle: true,
      ),

      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 16),

            /// --- Profile Section ---
            Center(
              child: Column(
                children: const [
                  // Using const for efficiency
                  CircleAvatar(
                    radius: 64,
                    backgroundImage: NetworkImage(
                      "https://lh3.googleusercontent.com/aida-public/AB6AXuAUdhAO9a7jUKDjU-6_5YLMlqKvdDwqmKerbnMxnn6ojbGNZm7pxQ0zLBQEcyHVFkH4aOiCTwbpaTM7putYOpysjeivVhWo9i3gGTng8HTb3iLweEPnqc1Dj9xuJYwSNe7kA_-9d_1-bQYA-YhJONl5jpPPAi2Svliy-ht4BVkP_8L9FKr4yBB0Nn7g_VKjl2abnVSheZ3Wza1iDvzX3u8gKUdA7XEtxj3X5EYNNf1vqOnp5OJ6AmFBK8mbeV4zA4Q8jLkg6pXyR85B",
                    ),
                  ),
                  SizedBox(height: 12),
                  Text(
                    "Ethan Carter",
                    style: TextStyle(
                      color: kTextDark,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "Electrician",
                    style: TextStyle(color: kMutedText),
                  ),
                  Text(
                    "5 years of experience",
                    style: TextStyle(color: kMutedText),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 24),

            /// --- Contact Section ---
            const _SectionHeader("Contact"),
            const _ContactTile(
              // Added const
              icon: Icons.email_outlined,
              title: "Email",
              subtitle: "ethan.carter@email.com",
            ),
            const _ContactTile(
              // Added const
              icon: Icons.phone_outlined,
              title: "Phone",
              subtitle: "(555) 123-4567",
            ),

            /// --- Services Section ---
            const _SectionHeader("Services"),
            const _ServiceTile(
              // Added const
              icon: Icons.flash_on,
              title: "Electrical Wiring",
            ),
            const _ServiceTile(
              // Added const
              icon: Icons.power_outlined,
              title: "Appliance Installation",
            ),
            const _ServiceTile(
              // Added const
              icon: Icons.lightbulb_outline,
              title: "Lighting Repair",
            ),

            /// --- Portfolio Section ---
            const _SectionHeader("Portfolio"),
            SizedBox(
              height: 220,
              child: ListView(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                children: const [
                  _PortfolioCard(
                    image:
                        "https://lh3.googleusercontent.com/aida-public/AB6AXuA01E-B2i106zS10YnXLDz45wBD2hm83fpl2TjdBvFyfn8sv2iYP4ACcClp0TSLuffIBPtmOwS5w_kpbvl1CQSg4z8izUcgNKmUBYWOwQs9CkIcr5LLdf94pCY3IoTsSz7cM7ZWMSv_eNtrriwmWB1M-tR5e__JzqvWY6gupcAFqA0Q5X399FFuTPF_xkuizE3_LBlMX7PDrD5oUQWuYV8nbQxVZGsTHkF5Zxb5PtmGlcFEJhZmI8dSRJGpgfw_iRuiEKiCFvJYXVdX",
                    title: "Modern Kitchen",
                  ),
                  _PortfolioCard(
                    image:
                        "https://lh3.googleusercontent.com/aida-public/AB6AXuAyfOtroYK3kJT0Gkru5Di0rQBcwUG1C6Ur00t6WxaLTvO0cn6WqEHKSlwqN0zerjRl3kZdV4XPbiS4sioq5JnRR21vd8ar8YHCfbpCepgukyVW54al02bJCwzhwhn-_S0ba7dLXJtfIwLu8o-v9J4FYoxQ6NG5oloDIYUOU-82wa_ieR7g1OyMWl5wFW7F-C5uB89HbQQUKHYzRDAMLBl_RAQALw7bPnctAHT_rg0FQTKp71ebZpJvLIUO5b5_Sa1WSbk7Q5cMlxd4",
                    title: "Living Room Renovation",
                  ),
                  _PortfolioCard(
                    image:
                        "https://lh3.googleusercontent.com/aida-public/AB6AXuDf3wJVK3OzmOScJ-j1GCwiB74MwhkZ2VHTPx5Azp24Xaefp6o6n_YmkkoYgcvexrEgjFVZtBde5AqdyIkYnHB6FW9YDSA87aIVcY6UXDWQTrIqwj_rgH3Pomss1SZOPvkkubAhUjuX8F2LlItDLyY7gX1IKCeZC4rOx3FKJGQfObZ0MG_WpCHtoFX9PEVeAz_N5U-D6M9QGLzQ5wqOLAUPjtGJ5GSzGC2h9YX0lbUKYnOfJ1XavAA1ZjjELoOFhHgYAZ5v9NRcGgXV",
                    title: "Bathroom Upgrade",
                  ),
                ],
              ),
            ),

            /// --- Reviews Section ---
            const _SectionHeader("Reviews"),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  _RatingOverview(),
                  SizedBox(width: 16),
                  Expanded(child: _RatingDistribution()),
                ],
              ),
            ),

            const SizedBox(height: 16),
            const Divider(thickness: 0.3),

            /// --- Individual Reviews ---
            const _ReviewTile(
              // Added const
              name: "Sophia Bennett",
              date: "1 month ago",
              image:
                  "https://lh3.googleusercontent.com/aida-public/AB6AXuDW3L9ATfHV1xXQJ8j5Xq-SNtn_1l_7hnbUjNGI5-vYIr58bSvFSjhrujZkQMWh4IMqPbZpa8PzbFKkZHZAO3lCr1mMgwi0DI5HK98aZOqBXxTMMHB2nEb-61pQ1YNgFXdHxnh6AvwxdivyaylLyPjWbYjJ6VMYWlCMjU-LJgMkBI13k7iMecmXge4syechiqSbcPE122GYA7PPFcRN4YmFliM-aMgXkn-2rO1RF_X5AtElZE4MpUXUM6OtWKEhxM2xlPlpY8blLWGZ",
              rating: 4,
              comment: "Great service! Fixed all the wiring issues quickly.",
            ),

            // Extra padding to ensure content is above the FAB and BottomNavBar
            const SizedBox(height: 120),
          ],
        ),
      ),

      /// --- Floating Action Button for Book Now (Blue Color) ---
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          // Navigate to the RequestServiceScreen
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const RequestServiceScreen(),
            ),
          );
        },
        backgroundColor: kPrimaryCyan,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        label: const Text(
          "Book Now",
          style: TextStyle(fontSize: 16, color: kTextDark),
        ),
        icon: const Icon(Icons.calendar_month, color: kTextDark),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,

      /// --- Bottom Navigation Bar ---
      bottomNavigationBar: BottomNavBar(
        currentIndex: 0,
        context: context,
      ),
    );
  }
}

// -----------------------------------------------------------------------------
// --- Custom Widgets (Unchanged) ---
// -----------------------------------------------------------------------------

class _SectionHeader extends StatelessWidget {
  final String title;
  const _SectionHeader(this.title);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 24, 16, 8),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: ProviderProfileScreen.kTextDark,
        ),
      ),
    );
  }
}

class _ContactTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  const _ContactTile({
    required this.icon,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Container(
        decoration: const BoxDecoration(
          color: ProviderProfileScreen.kLightBackground,
          borderRadius: BorderRadius.all(Radius.circular(12)),
        ),
        padding: const EdgeInsets.all(8),
        child: Icon(icon, color: ProviderProfileScreen.kTextDark),
      ),
      title: Text(
        title,
        style: const TextStyle(
          color: ProviderProfileScreen.kTextDark,
          fontWeight: FontWeight.w500,
        ),
      ),
      subtitle: Text(
        subtitle,
        style: const TextStyle(color: ProviderProfileScreen.kMutedText),
      ),
    );
  }
}

class _ServiceTile extends StatelessWidget {
  final IconData icon;
  final String title;
  const _ServiceTile({required this.icon, required this.title});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Container(
        decoration: const BoxDecoration(
          color: ProviderProfileScreen.kLightBackground,
          borderRadius: BorderRadius.all(Radius.circular(12)),
        ),
        padding: const EdgeInsets.all(8),
        child: Icon(icon, color: ProviderProfileScreen.kTextDark),
      ),
      title: Text(title,
          style: const TextStyle(color: ProviderProfileScreen.kTextDark)),
    );
  }
}

class _PortfolioCard extends StatelessWidget {
  final String image;
  final String title;
  const _PortfolioCard({required this.image, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      margin: const EdgeInsets.only(right: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.network(
              image,
              fit: BoxFit.cover,
              height: 140,
              width: 150,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            title,
            style: const TextStyle(
              fontWeight: FontWeight.w500,
              color: ProviderProfileScreen.kTextDark,
            ),
          ),
        ],
      ),
    );
  }
}

class _RatingOverview extends StatelessWidget {
  const _RatingOverview();

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Text(
          "4.8",
          style: TextStyle(
            fontSize: 36,
            fontWeight: FontWeight.bold,
            color: ProviderProfileScreen.kTextDark,
          ),
        ),
        Row(
          children: [
            Icon(Icons.star, color: ProviderProfileScreen.kTextDark, size: 18),
            Icon(Icons.star, color: ProviderProfileScreen.kTextDark, size: 18),
            Icon(Icons.star, color: ProviderProfileScreen.kTextDark, size: 18),
            Icon(Icons.star, color: ProviderProfileScreen.kTextDark, size: 18),
            Icon(Icons.star_border,
                color: ProviderProfileScreen.kTextDark, size: 18),
          ],
        ),
        Text("23 reviews",
            style: TextStyle(color: ProviderProfileScreen.kMutedText)),
      ],
    );
  }
}

class _RatingDistribution extends StatelessWidget {
  const _RatingDistribution();

  Widget _bar(int value, double percent) {
    return Row(
      children: [
        Text(
          value.toString(),
          style: const TextStyle(color: ProviderProfileScreen.kTextDark),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: LinearProgressIndicator(
              value: percent,
              color: ProviderProfileScreen.kTextDark,
              backgroundColor: ProviderProfileScreen.kLightGrey,
              minHeight: 8,
            ),
          ),
        ),
        const SizedBox(width: 8),
        Text(
          "${(percent * 100).toInt()}%",
          style: const TextStyle(color: ProviderProfileScreen.kMutedText),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _bar(5, 0.7),
        _bar(4, 0.2),
        _bar(3, 0.05),
        _bar(2, 0.03),
        _bar(1, 0.02),
      ],
    );
  }
}

class _ReviewTile extends StatelessWidget {
  final String name;
  final String date;
  final String image;
  final int rating;
  final String comment;

  const _ReviewTile({
    required this.name,
    required this.date,
    required this.image,
    required this.rating,
    required this.comment,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(radius: 20, backgroundImage: NetworkImage(image)),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: const TextStyle(
                        fontWeight: FontWeight.w500,
                        color: ProviderProfileScreen.kTextDark,
                      ),
                    ),
                    Text(
                      date,
                      style: const TextStyle(
                          color: ProviderProfileScreen.kMutedText),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 4),
          Row(
            children: List.generate(
              5,
              (i) => Icon(
                i < rating ? Icons.star : Icons.star_border,
                color: ProviderProfileScreen.kTextDark,
                size: 18,
              ),
            ),
          ),
          const SizedBox(height: 4),
          Text(comment,
              style: const TextStyle(color: ProviderProfileScreen.kTextDark)),
        ],
      ),
    );
  }
}
