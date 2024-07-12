import 'dart:async';

import 'package:flutter/material.dart';
import 'package:rick_morty/app/domain/models/character.dart';
import 'package:rick_morty/app/domain/repositories/characters_repository.dart';
import 'package:rick_morty/helpers/debouncer.dart';

class HomeViewModel extends ChangeNotifier {
  final CharactersRepository charactersRepository;

  HomeViewModel(this.charactersRepository) {
    getCharacters();
  }

  final debouncer = Debouncer(duration: const Duration(milliseconds: 500));

  final StreamController<List<Character>> _suggestionStreamController =
      new StreamController.broadcast();

  Stream<List<Character>> get suggestionStream =>
      this._suggestionStreamController.stream;

  List<Character> charactersList = [];

  getCharacters() async {
    final res = await charactersRepository.getCharacters();
    if (res != null) {
      charactersList = [...charactersList, ...res];
      notifyListeners();
    }
  }

  Future<List<Character>> searchMovies(String name) async {
    final res = await charactersRepository.searchCharacterByName(name);
    if (res != null) {
      return res;
    } else {
      return [];
    }
  }

  void getSuggestionByQuery(String searchQuery) {
    debouncer.value = '';
    debouncer.onValue = (value) async {
      print('we have a value to search $searchQuery');
      final results = await searchMovies(searchQuery);
      _suggestionStreamController.add(results);
    };

    final timer = Timer.periodic(const Duration(milliseconds: 300), (_) {
      debouncer.value = searchQuery;
    });

    Future.delayed(const Duration(milliseconds: 301))
        .then((value) => timer.cancel());
  }
}
