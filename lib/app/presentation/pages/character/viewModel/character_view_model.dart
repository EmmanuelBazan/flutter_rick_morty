import 'package:flutter/material.dart';
import 'package:rick_morty/app/domain/models/character.dart';
import 'package:rick_morty/app/domain/repositories/characters_repository.dart';

class CharacterViewModel extends ChangeNotifier {
  final CharactersRepository charactersRepository;

  CharacterViewModel(this.charactersRepository);

  Character? character;

  getCharacter(int id) async {
    final res = await charactersRepository.getCharacterById(id);
    character = res;
    notifyListeners();
  }
}
