import 'package:flutter/material.dart';

class RecentEventsSection extends StatelessWidget {
  const RecentEventsSection({super.key});

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
        'image': 'assets/images/lib2.jpeg',
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
        'image': 'assets/images/lib2.jpeg',
        'libName': 'Festival de Hip Hop',
        'authorName': 'Quarta, 20:00'
      },
    ];

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Mais Recentes',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 22.0,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 14.0),
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
                          color: Color(0xFFFFB854),
                          fontSize: 12,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 2),
                      Text(
                        'Detalhes: ${libs[index]['authorName']}',
                        style: const TextStyle(
                          color: Colors.white70,
                          fontSize: 10,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
