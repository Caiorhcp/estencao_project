import 'package:flutter/material.dart';
import 'package:flutter_music/pages/home-page/event_card.dart';
import 'package:flutter_music/pages/home-page/home_page.dart';
import 'package:flutter_music/pages/pages/lib_page.dart';
import 'package:flutter_music/pages/search-page/search_page.dart';
import 'package:flutter_music/widgets/lib_card_list.dart';
import 'package:flutter_music/widgets/logo.dart';
import 'package:flutter_music/widgets/scroll_menu.dart';


class HomeLogo extends StatelessWidget {
  const HomeLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return const Logo();
  }
}

class HomeScrollMenu extends StatelessWidget {
  const HomeScrollMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return const ScrollMenu(
      menuItems: ['Home', 'Lib', 'Search',],
      pages: [
        HomePage(), 
        LibPage(), 
        SearchPage(), 
      ],
    );
  }
}

class HomeEventCardList extends StatelessWidget {
  const HomeEventCardList({super.key});

  @override
  Widget build(BuildContext context) {
    // A lógica e a lista de eventos devem ser implementadas aqui
    final List<Map<String, String>> events = [
      {
        'image': 'assets/images/lib1.jpg',
        'eventName': 'Evento 1',
        'location': 'Estádio Municipal',
        'details': 'Detalhes do Evento 1',
      },
    ];

    return Column(
      children: events.map((event) {
        return EventCard(
          image: event['image']!,
          eventName: event['eventName']!,
          location: event['location']!,
          details: event['details']!,
        );
      }).toList(),
    );
  }
}

class HomeLibrary extends StatelessWidget {
  const HomeLibrary({super.key});

  @override
  Widget build(BuildContext context) {
    // A lógica e a lista de bibliotecas devem ser implementadas aqui
    final List<Map<String, String>> libs = [
      {
        'image': 'assets/images/lib1.jpg',
        'libName': 'Biblioteca 1',
        'authorName': 'Autor 1',
      },
    ];

    return LibCardList(libs: libs);
  }
}
