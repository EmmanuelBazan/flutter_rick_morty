import 'package:flutter/material.dart';
import 'package:rick_morty/app/presentation/routes/app_routes.dart';
import 'package:rick_morty/app/presentation/routes/routes.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: Routes.homeView,
      routes: appRoutes,
    );
  }
}
