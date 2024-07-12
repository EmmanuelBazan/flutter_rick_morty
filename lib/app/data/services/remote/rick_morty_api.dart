import 'package:rick_morty/app/data/http/http.dart';
import 'package:rick_morty/app/domain/models/character.dart';

class RickMortyApi {
  final Http _http;

  RickMortyApi(this._http);

  Future<List<Character>?> getCharacters() async {
    final res = await _http.request(
      '/character',
      (responseBody) {
        final results = responseBody['results'] as List<dynamic>;
        return results.map((json) => Character.fromMap(json)).toList();
      },
    );

    return res.when(
      (failure) {
        print('Error: ${failure.statuscode ?? failure.exception}');
        return null;
      },
      (characters) => characters,
    );
  }
}
