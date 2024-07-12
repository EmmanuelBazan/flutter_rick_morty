import 'package:flutter/material.dart';
import 'package:rick_morty/app/domain/models/character.dart';
import 'package:rick_morty/app/presentation/pages/home/views/widgets/character_widget.dart';

class CharacterScroll extends StatefulWidget {
  final List<Character> characters;
  final Function onNextPage;

  const CharacterScroll(
      {super.key, required this.characters, required this.onNextPage});

  @override
  State<CharacterScroll> createState() => _CharacterScrollState();
}

class _CharacterScrollState extends State<CharacterScroll> {
  ScrollController scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    scrollController.addListener(() {
      if (scrollController.position.pixels >=
          scrollController.position.maxScrollExtent - 500) {
        widget.onNextPage();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: ListView.builder(
                controller: scrollController,
                scrollDirection: Axis.vertical,
                itemCount: widget.characters.length,
                itemBuilder: (_, int index) {
                  final character = widget.characters[index];
                  return CharacterWidget(
                      url: character.image,
                      name: character.name,
                      id: character.id);
                }),
          )
        ],
      ),
    );
  }
}
