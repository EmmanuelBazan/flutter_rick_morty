import 'package:rick_morty/app/data/services/remote/rick_morty_api.dart';
import 'package:rick_morty/app/domain/models/character.dart';
import 'package:rick_morty/app/domain/repositories/characters_repository.dart';

class CharactersRepositoryImpl implements CharactersRepository {
  final RickMortyApi _rickMortyApi;

  CharactersRepositoryImpl(this._rickMortyApi);

  @override
  Future<Character?> getCharacterById(int id) async {
    final res = await _rickMortyApi.getCharacterById(id);
    return res;
  }

  @override
  Future<List<Character>?> getCharacters(int page) async {
    final res = await _rickMortyApi.getCharacters(page);
    return res;
  }

  @override
  Future<List<Character>?> searchCharacterByName(String name) async {
    final res = await _rickMortyApi.searchCharacterByName(name);
    return res;
  }
}
