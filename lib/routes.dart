import 'package:flutter/material.dart';
import 'screens/welcome_screen.dart';
import 'screens/login_screen.dart';
import 'screens/signup_screen.dart';
import 'screens/categories_screen.dart';
import 'screens/provider_list_screen.dart';
import 'screens/provider_profile_screen.dart';
import 'screens/booking_screen.dart';

class AppRoutes {
  static const welcome = '/';
  static const login = '/login';
  static const signup = '/signup';
  static const categories = '/categories';
  static const providerList = '/providers';
  static const providerProfile = '/provider-profile';
  static const booking = '/booking';

  static Map<String, WidgetBuilder> routes = {
    welcome: (context) => const WelcomeScreen(),
    login: (context) => const LoginScreen(),
    signup: (context) => const SignupScreen(),
    categories: (context) => const CategoriesScreen(),
    providerList: (context) => const ProviderListScreen(),
    providerProfile: (context) => const ProviderProfileScreen(),
    booking: (context) => const BookingScreen(),
  };
}
