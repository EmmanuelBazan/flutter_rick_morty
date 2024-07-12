import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:provider/provider.dart';
import 'package:rick_morty/app/data/http/http.dart';
import 'package:rick_morty/app/data/repository_implementations/characters_repository_impl.dart';
import 'package:rick_morty/app/data/services/remote/rick_morty_api.dart';
import 'package:rick_morty/app/domain/repositories/characters_repository.dart';
import 'package:rick_morty/app/my_app.dart';
import 'package:rick_morty/app/presentation/pages/character/viewModel/character_view_model.dart';
import 'package:rick_morty/app/presentation/pages/home/viewModel/home_view_model.dart';

void main() {
  final http = Http(
    baseUrl: 'https://rickandmortyapi.com',
    client: Client(),
  );

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<HomeViewModel>(
          create: (_) => HomeViewModel(
            CharactersRepositoryImpl(
              RickMortyApi(http),
            ),
          ),
        ),
        ChangeNotifierProvider<CharacterViewModel>(
          create: (_) => CharacterViewModel(
            CharactersRepositoryImpl(
              RickMortyApi(http),
            ),
          ),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class Injector extends InheritedWidget {
  const Injector({
    super.key,
    required super.child,
    required this.charactersRepository,
  });

  final CharactersRepository charactersRepository;

  @override
  bool updateShouldNotify(_) => false;

  static Injector of(BuildContext context) {
    final injector = context.dependOnInheritedWidgetOfExactType<Injector>();
    assert(injector != null, 'Injector could not be found');
    return injector!;
  }
}
