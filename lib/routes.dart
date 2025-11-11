import 'package:flutter/material.dart';

// Import all screens
import 'screens/welcome_screen.dart';
import 'screens/login_screen.dart';
import 'screens/signup_screen.dart';
import 'screens/home_screen.dart';
import 'screens/categories_screen.dart';
import 'screens/provider_list_screen.dart';
import 'screens/provider_profile_screen.dart';
import 'screens/request_service_screen.dart';
import 'screens/bookings_screen.dart';
import 'screens/profile_screen.dart';

/// A centralized class defining all named routes and screen mappings.
class AppRoutes {
  // Route names
  static const String welcome = '/';
  static const String login = '/login';
  static const String signup = '/signup';
  static const String home = '/home';
  static const String categories = '/categories';
  static const String providerList = '/providers';
  static const String providerProfile = '/provider-profile';
  static const String requestService = '/request-service';
  static const String bookings = '/bookings';
  static const String profile = '/profile';

  /// Routes map for MaterialApp
  static Map<String, WidgetBuilder> get routes => {
    welcome: (context) => const WelcomeScreen(),
    login: (context) => const LoginScreen(),
    signup: (context) => const SignupScreen(),
    home: (context) => const HomeScreen(),
    categories: (context) => const CategoriesScreen(),
    providerList: (context) => const ProviderListScreen(),
    providerProfile: (context) => const ProviderProfileScreen(),
    requestService: (context) => const RequestServiceScreen(),
    bookings: (context) => const BookingsScreen(),
    profile: (context) => const ProfileScreen(),
  };
}
