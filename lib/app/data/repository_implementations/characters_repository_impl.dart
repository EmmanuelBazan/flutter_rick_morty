import 'dart:ffi';

import 'package:rick_morty/app/data/services/remote/rick_morty_api.dart';
import 'package:rick_morty/app/domain/models/character.dart';
import 'package:rick_morty/app/domain/repositories/characters_repository.dart';

class CharactersRepositoryImpl implements CharactersRepository {
  final RickMortyApi _rickMortyApi;

  CharactersRepositoryImpl(this._rickMortyApi);

  @override
  Future<List<Character>> getCharacterById(Int id) {
    // TODO: implement getCharacterById
    throw UnimplementedError();
  }

  @override
  Future<List<Character>?> getCharacters() async {
    final res = await _rickMortyApi.getCharacters();
    return res;
  }

  @override
  Future<List<Character>> searchCharacterByName(String name) {
    // TODO: implement searchCharacterByName
    throw UnimplementedError();
  }
}
