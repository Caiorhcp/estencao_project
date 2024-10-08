import 'package:flutter/material.dart';
import 'search_field.dart';
import 'search_result_list.dart';
import 'recent_searches.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final List<Map<String, dynamic>> events = [ // Mudança para dynamic
    {
      'image': 'assets/images/lib1.jpg',
      'location': 'Estádio Municipal',
      'time': 'Sábado, 19:00',
      'isFree': true, // Evento gratuito
    },
    {
      'image': 'assets/images/lib2.jpeg',
      'location': 'Centro Cultural',
      'time': 'Domingo, 20:00',
      'isFree': false, // Evento pago
    },
    {
      'image': 'assets/images/lib1.jpg',
      'location': 'Teatro Municipal',
      'time': 'Sexta, 22:00',
      'isFree': true, // Evento gratuito
    },
  ];

  final List<Map<String, String>> recentSearches = [
    {
      'image': 'assets/images/lib1.jpg',
      'title': 'Evento 1',
      'location': 'Local 1',
    },
    {
      'image': 'assets/images/lib2.jpeg',
      'title': 'Evento 2',
      'location': 'Local 2',
    },
    {
      'image': 'assets/images/lib1.jpg',
      'title': 'Evento 1',
      'location': 'Local 1',
    },
    {
      'image': 'assets/images/lib2.jpeg',
      'title': 'Evento 2',
      'location': 'Local 2',
    },
    {
      'image': 'assets/images/lib1.jpg',
      'title': 'Evento 1',
      'location': 'Local 1',
    },
  ];

  String searchQuery = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Buscar Eventos', style: TextStyle(color: Colors.white)),
        backgroundColor: const Color(0xFF000D1F),
      ),
      body: Container(
        color: const Color(0xFF02142F),
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
              'Pesquisas Recentes',
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
            const SizedBox(height: 8.0),
            RecentSearches(recentSearches: recentSearches),
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
