import 'package:flutter/material.dart';

class SeenView extends StatelessWidget {
  const SeenView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Last seen'),
        centerTitle: true,
        elevation: 0,
      ),
    );
  }
}
