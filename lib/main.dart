import 'package:flutter/material.dart';
import 'package:rick_morty/app/data/repository_implementations/characters_repository_impl.dart';
import 'package:rick_morty/app/domain/repositories/characters_repository.dart';
import 'package:rick_morty/app/my_app.dart';

void main() {
  runApp(Injector(
    charactersRepository: CharactersRepositoryImpl(),
    child: const MyApp(),
  ));
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
