import 'package:flutter/material.dart';

class LibPage extends StatelessWidget {
  const LibPage({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: Container(
        width: size.width,
        height: size.height,
        color: Colors.blue,
        child: const Center(
          child: Text('Map page'),
        ),
      ),
    );
  }
}
