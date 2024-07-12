import 'package:flutter/material.dart';
import 'package:rick_morty/app/domain/models/character.dart';
import 'package:rick_morty/app/presentation/routes/routes.dart';

class CharacterWidget extends StatelessWidget {
  final Character character;

  const CharacterWidget({super.key, required this.character});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final size = MediaQuery.of(context).size;

    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, Routes.characterView,
            arguments: character);
      },
      child: Container(
        margin: const EdgeInsets.only(top: 12),
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Row(children: [
          Hero(
            tag: character.id,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: FadeInImage(
                placeholder: const AssetImage('assets/image_placeholder.png'),
                image: NetworkImage(character.image),
                height: 150,
                // width: 100,
              ),
            ),
          ),
          const SizedBox(
            width: 20,
          ),
          ConstrainedBox(
            constraints: BoxConstraints(maxWidth: size.width - 200),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  character.name,
                  style: textTheme.headlineSmall,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 3,
                ),
                Text(
                  character.status,
                  style: textTheme.labelLarge,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 3,
                ),
                Text(
                  '${character.species}/${character.gender}',
                  style: textTheme.bodyMedium,
                )
              ],
            ),
          )
        ]),
      ),
    );
  }
}
