import 'package:rick_morty/app/data/http/http.dart';
import 'package:rick_morty/app/domain/models/character.dart';
import 'package:rick_morty/app/domain/models/full_location.dart';

class RickMortyApi {
  final Http _http;

  RickMortyApi(this._http);

  Future<List<Character>?> getCharacters(int page) async {
    final res = await _http.request('/api/character', (responseBody) {
      final results = responseBody['results'] as List<dynamic>;
      return results.map((json) => Character.fromMap(json)).toList();
    }, queryParameters: {'page': page.toString()});

    return res.when(
      (failure) {
        print('Error: ${failure.statuscode ?? failure.exception}');
        return null;
      },
      (characters) => characters,
    );
  }

  Future<List<Character>?> searchCharacterByName(String name) async {
    final res = await _http.request(
      '/api/character',
      (responseBody) {
        final results = responseBody['results'] as List<dynamic>;
        return results.map((json) => Character.fromMap(json)).toList();
      },
      queryParameters: {'name': name},
    );

    return res.when(
      (failure) {
        print('Error: ${failure.statuscode ?? failure.exception}');
        return null;
      },
      (characters) => characters,
    );
  }

  Future<FullLocation?> getLocation(int id) async {
    final res = await _http.request(
      '/api/location/$id',
      (responseBody) => FullLocation.fromMap(responseBody),
    );

    return res.when(
      (failure) {
        print('Error: ${failure.statuscode ?? failure.exception}');
        return null;
      },
      (location) => location,
    );
  }
}
