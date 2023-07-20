import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:weather/weather.dart';

// secret key
const apiKey = "1bea58f08eeaa87ecdffcc3a6042945b";
const urlSupabase = "https://cumqtkrcgoflqmgukrbl.supabase.co";
const anonKey =
    "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImN1bXF0a3JjZ29mbHFtZ3VrcmJsIiwicm9sZSI6ImFub24iLCJpYXQiOjE2ODk2MTI0ODQsImV4cCI6MjAwNTE4ODQ4NH0.SeJtDB9foTUrJAkX3Yl9qmg4KQ2CKpg9MDLDt0ds-oA";

// weather
WeatherFactory wf = WeatherFactory(apiKey);

/// Supabase client
final supabase = Supabase.instance.client;
// User
final User? user = supabase.auth.currentUser;

// Firebase Messaging
final messaging = FirebaseMessaging.instance;

/// Simple preloader inside a Center widget
const preloader = Center(
    child: Column(
  mainAxisAlignment: MainAxisAlignment.center,
  children: [
    Image(image: AssetImage('assets/icons/project.png')),
    CircularProgressIndicator(color: Colors.orange),
  ],
));

/// Simple sized box to space out form elements
const formSpacer = SizedBox(width: 16, height: 16);

/// Some padding for all the forms to use
const formPadding = EdgeInsets.symmetric(vertical: 20, horizontal: 16);

/// Error message to display the user when unexpected error occurs.
const unexpectedErrorMessage = 'Unexpected error occurred.';

/// Basic theme to change the look and feel of the app
final appLightTheme = ThemeData.light().copyWith(
  primaryColorDark: Colors.orange,
  appBarTheme: const AppBarTheme(
    elevation: 1,
    backgroundColor: Colors.white,
    iconTheme: IconThemeData(color: Colors.black),
    titleTextStyle: TextStyle(
      color: Colors.black,
      fontSize: 18,
    ),
  ),
  primaryColor: Colors.orange,
  textButtonTheme: TextButtonThemeData(
    style: TextButton.styleFrom(
      foregroundColor: Colors.orange,
    ),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      foregroundColor: Colors.white,
      backgroundColor: Colors.orange,
    ),
  ),
  inputDecorationTheme: InputDecorationTheme(
    floatingLabelStyle: const TextStyle(
      color: Colors.orange,
    ),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: const BorderSide(
        color: Colors.grey,
        width: 2,
      ),
    ),
    focusColor: Colors.orange,
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: const BorderSide(
        color: Colors.orange,
        width: 2,
      ),
    ),
  ),
);

final appDarkTheme = ThemeData.dark().copyWith(
  primaryColorDark: Colors.orange,
  appBarTheme: const AppBarTheme(
    elevation: 1,
    backgroundColor: Colors.black,
    iconTheme: IconThemeData(color: Colors.white),
    titleTextStyle: TextStyle(
      color: Colors.white,
      fontSize: 18,
    ),
  ),
  primaryColor: Colors.orange,
  textButtonTheme: TextButtonThemeData(
    style: TextButton.styleFrom(
      foregroundColor: Colors.orange,
    ),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      foregroundColor: Colors.white,
      backgroundColor: Colors.orange,
    ),
  ),
  inputDecorationTheme: InputDecorationTheme(
    floatingLabelStyle: const TextStyle(
      color: Colors.orange,
    ),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: const BorderSide(
        color: Colors.grey,
        width: 2,
      ),
    ),
    focusColor: Colors.orange,
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: const BorderSide(
        color: Colors.orange,
        width: 2,
      ),
    ),
  ),
);

/// Set of extension methods to easily display a snackbar
extension ShowSnackBar on BuildContext {
  /// Displays a basic snackbar
  void showSnackBar({
    required String message,
    Color backgroundColor = Colors.white,
  }) {
    ScaffoldMessenger.of(this).showSnackBar(SnackBar(
      content: Text(message),
      backgroundColor: backgroundColor,
    ));
  }

  /// Displays a red snackbar indicating error
  void showErrorSnackBar({required String message}) {
    showSnackBar(message: message, backgroundColor: Colors.red);
  }
}
