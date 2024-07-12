import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rick_morty/app/presentation/pages/home/viewModel/home_view_model.dart';
import 'package:rick_morty/app/presentation/pages/home/views/widgets/character_scroll.dart';
import 'package:rick_morty/app/presentation/pages/home/views/widgets/character_widget.dart';
import 'package:rick_morty/app/presentation/pages/home/views/widgets/search_delegate.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<HomeViewModel>(context);

    return Scaffold(
        appBar: AppBar(
          title: const Text('Home'),
          centerTitle: true,
          elevation: 0,
          actions: [
            IconButton(
                onPressed: () => showSearch(
                    context: context, delegate: CharacterSearchDelegate()),
                icon: const Icon(Icons.search))
          ],
        ),
        body: CharacterScroll(
          characters: viewModel.charactersList,
          onNextPage: viewModel.getCharacters,
        ));
  }
}
