import 'package:flutter/material.dart';
import 'package:flutter_music/widgets/h1.dart';
import 'package:flutter_music/widgets/logo.dart';
import 'package:flutter_music/widgets/scroll_menu.dart';
import 'package:flutter_music/widgets/event_card.dart';
import 'package:flutter_music/home/pages/page1.dart';
import 'package:flutter_music/home/pages/page2.dart';
import 'package:flutter_music/home/pages/page3.dart';
import 'package:flutter_music/home/pages/page4.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final libs = [
      {
        'image': 'assets/images/lib1.jpg',
        'libName': 'Festival de Música',
        'authorName': 'Sábado, 18:00'
      },
      {
        'image': 'assets/images/lib2.jpeg',
        'libName': 'Concerto de Jazz',
        'authorName': 'Domingo, 20:00'
      },
      {
        'image': 'assets/images/lib1.jpg',
        'libName': 'Noite de Rap',
        'authorName': 'Sexta, 22:00'
      },
      {
        'image': 'assets/images/lib2.jpg',
        'libName': 'Festa Eletrônica',
        'authorName': 'Sábado, 23:00'
      },
      {
        'image': 'assets/images/lib1.jpg',
        'libName': 'Show de Rock',
        'authorName': 'Sábado, 19:00'
      },
      {
        'image': 'assets/images/lib2.jpeg',
        'libName': 'Noite de Jazz',
        'authorName': 'Domingo, 21:00'
      },
      {
        'image': 'assets/images/lib1.jpg',
        'libName': 'Festa de Verão',
        'authorName': 'Sexta, 22:00'
      },
      {
        'image': 'assets/images/lib2.jpg',
        'libName': 'Festival de Hip Hop',
        'authorName': 'Quarta, 20:00'
      },
    ];

    final menuItems = ['Pag1', 'Pag2', 'Pag3', 'Pag4'];
    final pages = [
      const Page1(),
      const Page2(),
      const Page3(),
      const Page4(),
    ];

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        backgroundColor: const Color.fromARGB(255, 6, 3, 54),
        title: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Logo(),
            ],
          ),
        ),
      ),
      body: Container(
        width: double.infinity,
        height: MediaQuery.of(context).size.height,
        color: const Color.fromARGB(255, 12, 0, 59),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 16.0),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: H1('Menu'),
              ),
              const SizedBox(height: 16.0),
              Center(child: ScrollMenu(menuItems: menuItems, pages: pages)),
              const SizedBox(height: 24.0),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: H1('Mais Recentes'),
              ),
              const SizedBox(height: 14.0),
              //"Mais Recentes"
              SizedBox(
                height: 130,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: libs.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            width: 100,
                            height: 80,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage(libs[index]['image']!),
                                fit: BoxFit.cover,
                              ),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            'Evento: ${libs[index]['libName']}',
                            style: const TextStyle(
                                color: Colors.white, fontSize: 12),
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(height: 2),
                          Text(
                            'Detalhes: ${libs[index]['authorName']}',
                            style: const TextStyle(
                                color: Colors.white70, fontSize: 10),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: 24.0),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: H1('Eventos Futuros'),
              ),
              const SizedBox(height: 8.0),
              //Eventos Futuros
              EventCard(
                image: libs[0]['image']!,
                eventName: libs[0]['libName']!,
                location: 'Estádio Municipal',
                details: 'Sábado, 19:00',
              ),
              EventCard(
                image: libs[1]['image']!,
                eventName: libs[1]['libName']!,
                location: 'Centro Cultural',
                details: 'Domingo, 20:00',
              ),
              EventCard(
                image: libs[2]['image']!,
                eventName: libs[2]['libName']!,
                location: 'bueiro do Shopping',
                details: 'Sexta, 22:00',
              ),
              const SizedBox(height: 20.0),
            ],
          ),
        ),
      ),
    );
  }
}
