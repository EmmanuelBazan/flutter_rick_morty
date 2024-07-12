import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rick_morty/app/presentation/pages/home/viewModel/home_view_model.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  ScrollController scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    scrollController.addListener(() {
      if (scrollController.position.pixels >=
          scrollController.position.maxScrollExtent - 500) {}
    });
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<HomeViewModel>(context);

    return Scaffold(
      body: Container(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: ListView.builder(
                  controller: scrollController,
                  scrollDirection: Axis.vertical,
                  itemCount: viewModel.charactersList.length,
                  itemBuilder: (_, int index) {
                    return Text(viewModel.charactersList[index].name);
                  }),
            )
          ],
        ),
      ),
    );
  }
}
