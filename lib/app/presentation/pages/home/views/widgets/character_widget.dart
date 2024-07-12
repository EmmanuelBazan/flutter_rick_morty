import 'package:flutter/material.dart';

class CharacterWidget extends StatelessWidget {
  final String url;
  final String name;
  final int id;

  const CharacterWidget({
    super.key,
    required this.url,
    required this.name,
    required this.id,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(children: [
        GestureDetector(
          onTap: () {
            // Navigator.pushNamed(context, 'detailScreen', arguments: movie);
          },
          child: Hero(
            tag: id,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: FadeInImage(
                placeholder: const AssetImage('assets/image_placeholder.png'),
                image: NetworkImage(url),
                width: 130,
                height: 190,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        Text(
          name,
          overflow: TextOverflow.ellipsis,
          maxLines: 2,
          textAlign: TextAlign.center,
        )
      ]),
    );
  }
}
