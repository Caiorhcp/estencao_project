import 'package:flutter/material.dart';

class Logo extends StatelessWidget {
  const Logo({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Text(
          'Xote',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        Text(
          'Eventos',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.blue,
          ),         
        ),
      ],
    );
  }
}
