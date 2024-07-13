import 'package:flutter/material.dart';
import 'package:rick_morty/app/domain/models/character.dart';
import 'package:rick_morty/app/domain/models/full_location.dart';
import 'package:rick_morty/app/domain/repositories/characters_repository.dart';

class CharacterViewModel extends ChangeNotifier {
  final CharactersRepository charactersRepository;

  CharacterViewModel(this.charactersRepository);

  Character? character;
  FullLocation? location;
  FullLocation? origin;

  getLocation(int id) async {
    final res = await charactersRepository.getLocation(id);
    location = res;
    print("Location: ${res?.name}");
    notifyListeners();
  }

  getOrigin(int id) async {
    final res = await charactersRepository.getLocation(id);
    origin = res;
    notifyListeners();
  }
}
