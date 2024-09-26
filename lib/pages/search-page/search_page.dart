import 'package:flutter/material.dart';
import 'search_field.dart';
import 'search_result_list.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Buscar Eventos', style: TextStyle(color: Colors.white)),
        backgroundColor: const Color.fromARGB(255, 3, 0, 42),
      ),
      body: Container(
        color: const Color.fromARGB(255, 12, 0, 59),
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SearchField(
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
              child: SearchResultList(events: events, searchQuery: searchQuery),
            ),
          ],
        ),
      ),
    );
  }
}
