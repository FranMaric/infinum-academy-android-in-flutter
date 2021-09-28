import 'package:flutter/material.dart';
import 'package:infinum_academy_android_flutter/constants/route_generator.dart';
import 'package:infinum_academy_android_flutter/constants/theme_data.dart';
import 'package:infinum_academy_android_flutter/source_local/shared_preferences/shared_preferences_provider.dart';
import 'package:infinum_academy_android_flutter/source_remote/api_client.dart';
import 'package:infinum_academy_android_flutter/ui/splash/splash_screen.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> runShowsApp() async {
  WidgetsFlutterBinding.ensureInitialized();
  final sharedPreferences = await SharedPreferences.getInstance();

  runApp(ProviderScope(
    overrides: [
      sharedPreferencesProvider.overrideWithValue(sharedPreferences),
    ],
    child: ShowsApp(),
  ));
}

class ShowsApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final apiClient = context.read(apiClientProvider);

    return MaterialApp(
      navigatorKey: apiClient.alice.getNavigatorKey(),
      debugShowCheckedModeBanner: false,
      title: 'Shows',
      theme: themeData,
      initialRoute: SplashScreen.routeName,
      onGenerateRoute: generateRoute,
    );
  }
}
