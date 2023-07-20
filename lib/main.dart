//import 'package:firebase_core/firebase_core.dart';
//import 'package:firebase_messaging/firebase_messaging.dart';
//import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:project/constants.dart';
import 'package:project/controllers/settings_controller.dart';
import 'package:project/views/account/account_page.dart';
import 'package:project/views/account/login_page.dart';
import 'package:project/views/chat_page.dart';
import 'package:project/views/home_page.dart';
import 'package:project/views/member/member_details.dart';
import 'package:project/views/settings_view.dart';
import 'package:project/views/splash_page.dart';
import 'package:project/views/weather/search_weather.dart';
import 'package:project/views/weather_view.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

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
          initialRoute: '/',
          routes: <String, WidgetBuilder>{
            '/': (_) => const SplashPage(),
            '/login': (_) => const LoginPage(),
            '/account': (_) => const AccountPage(),
            '/settings': (_) => SettingsView(controller: settingsController),
            '/home': (_) => const HomePage(),
            '/member_details': (_) => const MemberItemDetailsView(),
            '/weather': (_) => const WeatherView(),
            '/chat': (_) => const ChatPage(),
            '/search': (_) => const SearchWeather(),
          },
        );
      },
    );
  }
}

Future main() async {
  // Set up the SettingsController, which will glue user settings to multiple
  // Flutter Widgets.
  final settingsController = SettingsController(SettingsService());

  // Load the user's preferred theme while the splash screen is displayed.
  // This prevents a sudden theme change when the app is first displayed.
  await settingsController.loadSettings();

  // initialize supabase

  WidgetsFlutterBinding.ensureInitialized();

  await Supabase.initialize(
    url: urlSupabase,
    anonKey: anonKey,
    authFlowType: AuthFlowType.pkce,
  );

  // initialize firebase
/*  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  NotificationSettings settings = await messaging.requestPermission(
    alert: true,
    badge: false,
    provisional: false,
    sound: true,
  );

  if (settings.authorizationStatus == AuthorizationStatus.authorized) {
    if (kDebugMode) {
      print('User granted permission');
    }
    String? token = await messaging.getToken();
    //if (token != null) {
    //  await supabase.rpc('update_fcm_key', params: {'key': token});
    //}
  } else if (settings.authorizationStatus == AuthorizationStatus.provisional) {
    if (kDebugMode) {
      print('User granted provisional permission');
    }
  } else {
    if (kDebugMode) {
      print('User declined or has not accepted permission');
    }
  }*/

  // Run the app and pass in the SettingsController. The app listens to the
  // SettingsController for changes, then passes it further down to the
  // SettingsView.
  runApp(MyApp(settingsController: settingsController));
}
