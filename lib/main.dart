import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:project/constants.dart';
import 'package:project/controllers/settings_controller.dart';
import 'package:project/firebase_options.dart';
import 'package:project/views/account/login_page.dart';
import 'package:project/views/chat_page.dart';
import 'package:project/views/home_page.dart';
import 'package:project/views/member/member_details.dart';
import 'package:project/views/search_page.dart';
import 'package:project/views/settings_view.dart';
import 'package:project/views/weather_view.dart';

/// The Widget that configures your application.
class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
    required this.settingsController,
  });

  final SettingsController settingsController;

  @override
  Widget build(BuildContext context) {
    // Glue the SettingsController to the MaterialApp.
    //
    // The AnimatedBuilder Widget listens to the SettingsController for changes.
    // Whenever the user updates their settings, the MaterialApp is rebuilt.
    return AnimatedBuilder(
      animation: settingsController,
      builder: (BuildContext context, Widget? child) {
        return MaterialApp(
          // don't show the debug banner
          debugShowCheckedModeBanner: false,

          // Define a light and dark color theme. Then, read the user's
          // preferred ThemeMode (light, dark, or system default) from the
          // SettingsController to display the correct theme.
          theme: appLightTheme,
          darkTheme: appDarkTheme,
          themeMode: settingsController.themeMode,
          initialRoute: '/home',
          routes: <String, WidgetBuilder>{
            '/login': (_) => const LoginPage(),
            '/settings': (_) => SettingsView(controller: settingsController),
            '/home': (_) => const HomePage(),
            '/member_details': (_) => const MemberItemDetailsView(),
            '/weather': (_) => const WeatherView(),
            '/chat': (_) => const ChatPage(),
            '/search': (_) => SearchPage(),
          },
        );
      },
    );
  }
}

void main() async {
  // Set up the SettingsController, which will glue user settings to multiple
  // Flutter Widgets.
  final settingsController = SettingsController(SettingsService());

  // Load the user's preferred theme while the splash screen is displayed.
  // This prevents a sudden theme change when the app is first displayed.
  await settingsController.loadSettings();

  WidgetsFlutterBinding.ensureInitialized();

  // initialize firebase
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // Run the app and pass in the SettingsController. The app listens to the
  // SettingsController for changes, then passes it further down to the
  // SettingsView.
  runApp(MyApp(settingsController: settingsController));
}
