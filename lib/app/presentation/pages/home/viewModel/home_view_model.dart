import 'package:flutter/material.dart';
import 'package:rick_morty/app/domain/models/character.dart';
import 'package:rick_morty/app/domain/repositories/characters_repository.dart';

class HomeViewModel extends ChangeNotifier {
  final CharactersRepository charactersRepository;

  HomeViewModel(this.charactersRepository) {
    getCharacters();
  }

  List<Character> charactersList = [];

  getCharacters() async {
    final res = await charactersRepository.getCharacters();
    if (res != null) {
      charactersList = [...charactersList, ...res];
      notifyListeners();
    }
  }
}
