import 'package:flutter/material.dart';

class TextEntry extends StatelessWidget {
  const TextEntry({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 250, 
      height: 36, 
      child: TextField(
        style: const TextStyle(
          color: Colors.white,
        ),
        textAlign: TextAlign.start, 
        decoration: InputDecoration(
          filled: true,
          fillColor: const Color(0xff444444), 
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
            borderSide: BorderSide.none, 
          ),
          hintText: 'Escreva algo',
          hintStyle: const TextStyle(
            color: Colors.white54, 
            fontSize: 14, 
          ),
          contentPadding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0), // Padding ajustado
        ),
      ),
    );
  }
}
