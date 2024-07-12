import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rick_morty/app/domain/models/character.dart';
import 'package:rick_morty/app/presentation/pages/home/viewModel/home_view_model.dart';

class CharacterSearchDelegate extends SearchDelegate {
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(onPressed: () => query = '', icon: const Icon(Icons.close))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          close(context, null);
        },
        icon: const Icon(Icons.arrow_back));
  }

  @override
  Widget buildResults(BuildContext context) {
    return Text('buildResults');
  }

  Widget _emptyContainer() {
    return Container(
      color: Colors.transparent,
      child: const Center(
          child: Icon(
        Icons.movie_creation_outlined,
        size: 50,
        color: Colors.grey,
      )),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    if (query.isEmpty) {
      _emptyContainer();
    }

    final viewModel = Provider.of<HomeViewModel>(context, listen: false);

    viewModel.getSuggestionByQuery(query);

    return StreamBuilder(
      stream: viewModel.suggestionStream,
      builder: (_, AsyncSnapshot<List<Character>> snapshot) {
        if (!snapshot.hasData) return _emptyContainer();

        List<Character> listMovie = snapshot.data!;

        return ListView.builder(
          itemCount: listMovie.length,
          itemBuilder: (context, index) =>
              _CharacterItem(currentCharacter: listMovie[index]),
        );
      },
    );
  }
}

class _CharacterItem extends StatelessWidget {
  final Character currentCharacter;

  const _CharacterItem({super.key, required this.currentCharacter});

  @override
  Widget build(BuildContext context) {
    // currentCharacter.id = 'search-${currentMovie.id}';
    return ListTile(
      leading: Hero(
        tag: currentCharacter.id,
        child: FadeInImage(
          placeholder: const AssetImage('assets/image_placeholder.png'),
          image: NetworkImage(currentCharacter.image),
          width: 50,
          fit: BoxFit.contain,
        ),
      ),
      title: Text(currentCharacter.name),
      subtitle: Text(currentCharacter.status),
      onTap: () {
        // Navigator.pushNamed(context, 'detailScreen', arguments: currentMovie);
      },
    );
  }
}
