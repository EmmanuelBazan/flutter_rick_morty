import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rick_morty/app/domain/models/character.dart';
import 'package:rick_morty/app/presentation/pages/character/viewModel/character_view_model.dart';

class CharacterLocation extends StatefulWidget {
  final Location location;

  const CharacterLocation({super.key, required this.location});

  @override
  State<CharacterLocation> createState() => _CharacterLocationState();
}

class _CharacterLocationState extends State<CharacterLocation> {
  late int locationId = 0;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final id = getId(widget.location.url);
    if (locationId != id) {
      locationId = id;
      final viewModel = Provider.of<CharacterViewModel>(context, listen: false);
      viewModel.getLocation(locationId);
    }
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final viewModel = Provider.of<CharacterViewModel>(context);

    return viewModel.location == null
        ? Container()
        : Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Location: ${widget.location.name}",
                  style: textTheme.bodyMedium,
                ),
                Text(
                  "Type: ${viewModel.location!.type}",
                  style: textTheme.bodyMedium,
                ),
                Text(
                  "Dimension: ${viewModel.location!.dimension}",
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
