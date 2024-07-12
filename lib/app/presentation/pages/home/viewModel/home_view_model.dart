import 'package:flutter/material.dart';
import 'package:rick_morty/app/domain/repositories/characters_repository.dart';

class HomeViewModel extends ChangeNotifier {
  final CharactersRepository charactersRepository;

  HomeViewModel({required this.charactersRepository});
}
