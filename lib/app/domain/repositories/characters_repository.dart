import 'dart:ffi';

import 'package:rick_morty/app/domain/models/character.dart';

abstract class CharactersRepository {
  Future<List<Character>?> getCharacters(int page);
  Future<List<Character>?> getCharacterById(Int id);
  Future<List<Character>?> searchCharacterByName(String name);
}
