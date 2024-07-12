import 'package:flutter/material.dart';
import 'package:rick_morty/app/domain/models/character.dart';

class CharacterView extends StatelessWidget {
  const CharacterView({super.key});

  @override
  Widget build(BuildContext context) {
    final character = ModalRoute.of(context)!.settings.arguments as Character;

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          _CustomAppbar(backdropPath: character.image, title: character.name),
          SliverList(
              delegate: SliverChildListDelegate([
            _PersonalInfo(
              location: character.location,
              origin: character.origin,
            )
          ]))
        ],
      ),
    );
  }
}

class _CustomAppbar extends StatelessWidget {
  final String backdropPath;
  final String title;

  const _CustomAppbar(
      {super.key, required this.backdropPath, required this.title});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: Colors.indigo,
      expandedHeight: 200,
      floating: false,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        titlePadding: const EdgeInsets.all(0),
        title: Container(
          padding: const EdgeInsets.only(bottom: 10, left: 20),
          alignment: Alignment.bottomCenter,
          color: Colors.black45,
          width: double.infinity,
          child: Text(title, style: const TextStyle(color: Colors.white)),
        ),
        background: FadeInImage(
          placeholder: const AssetImage('assets/loading_placeholder.gif'),
          image: NetworkImage(backdropPath),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

class _PersonalInfo extends StatelessWidget {
  final Location location;
  final Location origin;

  const _PersonalInfo(
      {super.key, required this.location, required this.origin});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Origin: ${origin.name}",
            style: textTheme.headlineSmall,
          ),
          Text(
            "Location: ${location.name}",
            style: textTheme.headlineSmall,
          )
        ],
      ),
    );
  }
}
