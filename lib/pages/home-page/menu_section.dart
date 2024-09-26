import 'package:flutter/material.dart';
import 'package:flutter_music/pages/page1/page1.dart';
import 'package:flutter_music/pages/page2/page2.dart';
import 'package:flutter_music/pages/page3/page3.dart';
import 'package:flutter_music/pages/page4/page4.dart';
import 'package:flutter_music/widgets/scroll_menu.dart';

class MenuSection extends StatelessWidget {
  const MenuSection({super.key});

  @override
  Widget build(BuildContext context) {
    final menuItems = ['Pag1', 'Pag2', 'Pag3', 'Pag4'];
    final pages = [
      const Page1(),
      const Page2(),
      const Page3(),
      const Page4(),
    ];

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Menu',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 22.0,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 16.0),
          Center(
            child: ScrollMenu(
              menuItems: menuItems,
              pages: pages,
            ),
          ),
        ],
      ),
    );
  }
}
