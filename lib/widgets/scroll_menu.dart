// lib/widgets/scroll_menu.dart

import 'package:flutter/material.dart';

class ScrollMenu extends StatelessWidget {
  final List<String> menuItems;
  final List<Widget> pages;

  const ScrollMenu({
    super.key,
    required this.menuItems,
    required this.pages,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(menuItems.length, (index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: ActionChip(
              label: Text(menuItems[index]),
              backgroundColor: const Color(0xff444444),
              labelStyle: const TextStyle(color: Colors.white),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => pages[index]),
                );
              },
            ),
          );
        }),
      ),
    );
  }
}
