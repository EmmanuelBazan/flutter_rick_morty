import 'package:rick_morty/app/domain/models/character.dart';
import 'package:rick_morty/app/domain/models/full_location.dart';

abstract class CharactersRepository {
  Future<List<Character>?> getCharacters(int page);
  Future<FullLocation?> getLocation(int id);
  Future<List<Character>?> searchCharacterByName(String name);
}
