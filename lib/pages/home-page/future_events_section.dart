import 'package:flutter/material.dart';
import 'package:flutter_music/pages/home-page/event_card.dart';

class FutureEventsSection extends StatelessWidget {
  const FutureEventsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final libs = [
      {
        'image': 'assets/images/lib1.jpg',
        'libName': 'Festival de Música',
        'authorName': 'Sábado, 19:00',
      },
      {
        'image': 'assets/images/lib2.jpeg',
        'libName': 'Concerto de Jazz',
        'authorName': 'Domingo, 20:00',
      },
      {
        'image': 'assets/images/lib1.jpg',
        'libName': 'Noite de Rap',
        'authorName': 'Sexta, 22:00',
      },
    ];

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Eventos Futuros',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 22.0,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 8.0),
          Column(
            children: [
              for (var event in libs)
                EventCard(
                  image: event['image']!,
                  eventName: event['libName']!,
                  location: 'Local Exemplo', 
                  details: event['authorName']!,
                ),
            ],
          ),
        ],
      ),
    );
  }
}
