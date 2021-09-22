import 'package:alice/alice.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:infinum_academy_android_flutter/source_remote/api_client.dart';
import 'package:infinum_academy_android_flutter/domain/authentication_client.dart';
import 'package:infinum_academy_android_flutter/domain/shows_repository.dart';
import 'package:infinum_academy_android_flutter/ui/splash/splash_screen.dart';
import 'constants/theme_data.dart';
import 'constants/route_generator.dart';

void main() {
  runApp(ProviderScope(child: ShowsApp()));
}

class ShowsApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final alice = Alice();
    final apiClient = context.read(apiClientProvider);

    apiClient.init(alice);
    context.read(authProvider).init(apiClient);
    context.read(showsRepositoryProvider).init(apiClient);

    return MaterialApp(
      navigatorKey: alice.getNavigatorKey(),
      debugShowCheckedModeBanner: false,
      title: 'Shows',
      theme: themeData,
      initialRoute: SplashScreen.routeName,
      onGenerateRoute: generateRoute,
    );
  }
}
