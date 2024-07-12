import 'package:flutter/material.dart';
import 'package:rick_morty/app/domain/repositories/characters_repository.dart';

class HomeViewModel extends ChangeNotifier {
  final CharactersRepository charactersRepository;

  HomeViewModel(this.charactersRepository);

  List<int> charactersList = [1, 2, 3, 4, 5, 6, 7, 8, 9, 0];
}
