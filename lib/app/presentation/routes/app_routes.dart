import 'package:flutter/material.dart';
import 'package:rick_morty/app/presentation/pages/character/views/character_view.dart';
import 'package:rick_morty/app/presentation/pages/home/views/home_view.dart';
import 'package:rick_morty/app/presentation/pages/seen/views/seen_view.dart';
import 'package:rick_morty/app/presentation/routes/routes.dart';

Map<String, Widget Function(BuildContext)> get appRoutes {
  return {
    Routes.homeView: (context) => const HomeView(),
    Routes.characterView: (context) => const CharacterView(),
    Routes.seenView: (context) => const SeenView(),
  };
}
