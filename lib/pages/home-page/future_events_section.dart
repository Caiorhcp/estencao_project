import 'package:flutter/material.dart';

class FutureEventsSection extends StatefulWidget {
  const FutureEventsSection({super.key});

  @override
  _FutureEventsSectionState createState() => _FutureEventsSectionState();
}

class _FutureEventsSectionState extends State<FutureEventsSection> {
  final List<Map<String, dynamic>> events = [
    {
      'name': 'Festival de Música',
      'time': 'Sábado, 19:00',
      'image': 'assets/images/lib1.jpg',
      'isFree': true,
      'isFavorite': false,
    },
    {
      'name': 'Concerto de Jazz',
      'time': 'Domingo, 20:00',
      'image': 'assets/images/lib2.jpeg',
      'isFree': false, // Card do meio é pago
      'isFavorite': false,
    },
    {
      'name': 'Noite de Rap',
      'time': 'Sexta, 22:00',
      'image': 'assets/images/lib1.jpg',
      'isFree': true,
      'isFavorite': false,
    },
  ];

  void _toggleFavorite(int index) {
    setState(() {
      events[index]['isFavorite'] = !events[index]['isFavorite'];
    });
  }

  @override
  Widget build(BuildContext context) {
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
          ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: events.length,
            itemBuilder: (context, index) {
              final event = events[index];
              return Card(
                margin: const EdgeInsets.only(bottom: 16.0),
                elevation: 4.0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
                color: const Color(0xFF000D1F), // Cor de fundo do card
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8.0),
                        child: Image.asset(
                          event['image'],
                          width: 100,
                          height: 100,
                          fit: BoxFit.cover,
                        ),
                      ),
                      const SizedBox(width: 16.0),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              event['name'],
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18.0,
                                color: Colors.white, // Cor do texto
                              ),
                            ),
                            const SizedBox(height: 4.0),
                            Text(
                              event['time'],
                              style: const TextStyle(
                                fontSize: 14.0,
                                color: Colors.grey,
                              ),
                            ),
                            const SizedBox(height: 8.0),
                            const Text(
                              'Clique para detalhes',
                              style: TextStyle(
                                color: Colors.blue,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 16.0),
                      // Coluna para o botão de favoritar e status
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          IconButton(
                            icon: Icon(
                              event['isFavorite']
                                  ? Icons.favorite
                                  : Icons.favorite_border,
                              color: event['isFavorite']
                                  ? Colors.red
                                  : Colors.white, // Coração branco
                            ),
                            onPressed: () {
                              _toggleFavorite(index);
                            },
                          ),
                          const SizedBox(height: 26.0), // Espaçamento adicional
                          Text(
                            event['isFree'] ? 'Grátis' : 'Pago',
                            style: TextStyle(
                              color: event['isFree'] ? Colors.green : Colors.red,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
