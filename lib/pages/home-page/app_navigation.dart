import 'package:flutter/material.dart';
import 'package:flutter_music/pages/home-page/home_page.dart';
import 'package:flutter_music/pages/lib_page/lib_page.dart';
import 'package:flutter_music/pages/search-page/search_page.dart';

class AppNavigation extends StatefulWidget {
  const AppNavigation({super.key});

  @override
  State<AppNavigation> createState() => _AppNavigationState();
}

class _AppNavigationState extends State<AppNavigation> {
  List<Widget> pages = [
    const HomePage(),
    const SearchPage(),
    const LibPage(),
  ];
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color.fromARGB(255, 3, 0, 42),
        selectedItemColor: const Color.fromARGB(255, 255, 153, 0),
        unselectedItemColor: const Color.fromARGB(170, 203, 203, 203),
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        currentIndex: currentIndex,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Início',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Buscar',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favoritos',
          ),
        ],
      ),
    );
  }
}