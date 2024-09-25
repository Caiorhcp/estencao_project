import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final List<Map<String, String>> events = [
    {
      'image': 'assets/images/lib1.jpg',
      'location': 'Estádio Municipal',
      'time': 'Sábado, 19:00',
    },
    {
      'image': 'assets/images/lib2.jpeg',
      'location': 'Centro Cultural',
      'time': 'Domingo, 20:00',
    },
    {
      'image': 'assets/images/lib1.jpg',
      'location': 'Teatro Municipal',
      'time': 'Sexta, 22:00',
    },
  ];

  String searchQuery = '';
  List<bool> favoriteStates;

  _SearchPageState() : favoriteStates = List.generate(3, (_) => false);

  List<Map<String, String>> _filterEvents() {
    if (searchQuery.isEmpty) {
      return events;
    }
    return events.where((event) => event['location']!.toLowerCase().contains(searchQuery.toLowerCase())).toList();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Buscar Eventos', style: TextStyle(color: Colors.white)),
        backgroundColor: const Color(0xff282828),
      ),
      body: Container(
        width: size.width,
        height: size.height,
        color: const Color(0xff333333),
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              style: const TextStyle(color: Colors.white),
              decoration: InputDecoration(
                filled: true,
                fillColor: const Color(0xff444444),
                hintText: 'Digite o nome do evento...',
                hintStyle: const TextStyle(color: Colors.white70),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  borderSide: BorderSide.none,
                ),
                prefixIcon: const Icon(Icons.search, color: Colors.white),
              ),
              onChanged: (value) {
                setState(() {
                  searchQuery = value;
                });
              },
            ),
            const SizedBox(height: 16.0),
            const Text(
              'Resultados da Busca',
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
            const SizedBox(height: 24.0),
            Expanded(
              child: _filterEvents().isEmpty
                  ? const Center(
                      child: Text(
                        'Nenhum resultado encontrado.',
                        style: TextStyle(color: Colors.white70, fontSize: 18),
                      ),
                    )
                  : ListView.builder(
                      itemCount: _filterEvents().length,
                      itemBuilder: (context, index) {
                        final event = _filterEvents()[index];
                        return Card(
                          color: const Color(0xff444444),
                          margin: const EdgeInsets.symmetric(vertical: 8.0),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(8.0),
                                  child: Image.asset(
                                    event['image']!,
                                    width: 120,
                                    height: 100,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                const SizedBox(width: 12.0),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        event['location']!,
                                        style: const TextStyle(
                                          color: Colors.blue,
                                          fontSize: 16,
                                        ),
                                      ),
                                      const SizedBox(height: 4.0),
                                      Text(
                                        event['time']!,
                                        style: const TextStyle(
                                          color: Colors.white70,
                                          fontSize: 14,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                IconButton(
                                  icon: Icon(
                                    favoriteStates[index] ? Icons.favorite : Icons.favorite_border,
                                    color: favoriteStates[index] ? Colors.red : Colors.white,
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      favoriteStates[index] = !favoriteStates[index];
                                    });
                                  },
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
