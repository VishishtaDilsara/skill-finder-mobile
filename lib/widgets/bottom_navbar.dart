import 'package:flutter/material.dart';
import '../routes.dart';

class BottomNavBar extends StatelessWidget {
  final int currentIndex;
  final BuildContext context;

  // FIX: Removed 'const' keyword because BuildContext is non-constant.
  // This resolves the 'key' related warning.
  BottomNavBar({
    super.key,
    required this.currentIndex,
    required this.context,
  });

  void _onTabSelected(int index) {
    if (index == currentIndex) return;

    switch (index) {
      case 0:
        Navigator.pushReplacementNamed(context, AppRoutes.categories);
        break;
      case 1:
        Navigator.pushReplacementNamed(context, AppRoutes.bookings);
        break;
      case 2:
        Navigator.pushReplacementNamed(context, AppRoutes.profile);
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    const Color activeColor = Color(0xFF111818); // dark text/icons
    const Color inactiveColor = Color(0xFF618989); // muted gray

    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        border: Border(top: BorderSide(color: Color(0xFFDBE6E6), width: 1.0)),
      ),
      padding: EdgeInsets.only(
        top: 8.0,
        bottom: 8.0 + MediaQuery.of(context).padding.bottom,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildNavItem(
            Icons.list_outlined,
            Icons.list,
            'Categories',
            0,
            activeColor,
            inactiveColor,
          ),
          _buildNavItem(
            Icons.calendar_today_outlined,
            Icons.calendar_today,
            'Bookings',
            1,
            activeColor,
            inactiveColor,
          ),
          _buildNavItem(
            Icons.person_outline,
            Icons.person,
            'Profile',
            2,
            activeColor,
            inactiveColor,
          ),
        ],
      ),
    );
  }

  Widget _buildNavItem(
    IconData icon,
    IconData activeIcon,
    String label,
    int index,
    Color activeColor,
    Color inactiveColor,
  ) {
    final bool isActive = currentIndex == index;
    final Color color = isActive ? activeColor : inactiveColor;

    return Expanded(
      child: InkWell(
        // Note: _onTabSelected uses the context passed to the class constructor.
        onTap: () => _onTabSelected(index),
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
                fontWeight: isActive ? FontWeight.w700 : FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
