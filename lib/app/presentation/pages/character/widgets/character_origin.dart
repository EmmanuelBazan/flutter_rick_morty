import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rick_morty/app/domain/models/character.dart';
import 'package:rick_morty/app/presentation/pages/character/viewModel/character_view_model.dart';

class CharacterOrigin extends StatefulWidget {
  final Location origin;

  const CharacterOrigin({super.key, required this.origin});

  @override
  State<CharacterOrigin> createState() => _CharacterOriginState();
}

class _CharacterOriginState extends State<CharacterOrigin> {
  late int originId = 0;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final id = getId(widget.origin.url);
    if (originId != id) {
      originId = id;
      final viewModel = Provider.of<CharacterViewModel>(context, listen: false);
      viewModel.getOrigin(originId);
    }
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final viewModel = Provider.of<CharacterViewModel>(context);

    return viewModel.origin == null
        ? Container()
        : Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Origin: ${widget.origin.name}",
                  style: textTheme.bodyMedium,
                ),
                Text(
                  "Type: ${viewModel.origin!.type}",
                  style: textTheme.bodyMedium,
                ),
                Text(
                  "Dimension: ${viewModel.origin!.dimension}",
                  style: textTheme.bodyMedium,
                ),
              ],
            ),
          );
  }

  int getId(String url) {
    final uri = Uri.parse(url);
    final segments = uri.pathSegments;
    return int.parse(segments.last);
  }
}
