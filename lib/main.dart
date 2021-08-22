import 'package:alice/alice.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:infinum_academy_android_flutter/services/api_client.dart';
import 'package:infinum_academy_android_flutter/services/authentication_client.dart';
import 'package:infinum_academy_android_flutter/services/shows_repository.dart';
import 'package:infinum_academy_android_flutter/ui/splash_screen/splash_screen.dart';
import 'constants/theme_data.dart';
import 'constants/route_generator.dart';

void main() {
  runApp(ProviderScope(child: ShowsApp()));
}

class ShowsApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final alice = Alice();

    context.read(apiClientProvider).init(alice);
    context.read(authProvider).apiClient = context.read(apiClientProvider);
    context.read(showsRepositoryProvider).apiClient = context.read(apiClientProvider);

    return MaterialApp(
      navigatorKey: alice.getNavigatorKey(),
      debugShowCheckedModeBanner: false,
      title: 'Shows',
      theme: themeData,
      initialRoute: SplashScreen.routeName,
      onGenerateRoute: RouteGenerator.generateRoute,
    );
  }
}
