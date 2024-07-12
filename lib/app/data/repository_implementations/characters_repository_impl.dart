import 'package:rick_morty/app/domain/models/character.dart';
import 'package:rick_morty/app/domain/repositories/characters_repository.dart';

class CharactersRepositoryImpl implements CharactersRepository {
  @override
  // TODO: implement characterById
  Future<List<Character>> get characterById => throw UnimplementedError();

  @override
  // TODO: implement characters
  Future<List<Character>> get characters => throw UnimplementedError();

  @override
  // TODO: implement searcCharacterByName
  Future<List<Character>> get searcCharacterByName =>
      throw UnimplementedError();
}
