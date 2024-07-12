import 'package:rick_morty/app/domain/models/character.dart';

abstract class CharactersRepository {
  Future<List<Character>> get characters;
  Future<List<Character>> get characterById;
  Future<List<Character>> get searcCharacterByName;
}
