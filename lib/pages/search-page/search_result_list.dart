import 'package:flutter/material.dart';
import 'event_card.dart';

class SearchResultList extends StatefulWidget {
  final List<Map<String, dynamic>> events; // Mudamos para dynamic para incluir isFree
  final String searchQuery;

  const SearchResultList({
    super.key,
    required this.events,
    required this.searchQuery,
  });

  @override
  _SearchResultListState createState() => _SearchResultListState();
}

class _SearchResultListState extends State<SearchResultList> {
  late List<bool> favoriteStates;

  @override
  void initState() {
    super.initState();
    // Inicializa o estado de favoritos para cada evento
    favoriteStates = List.generate(widget.events.length, (_) => false);
  }

  @override
  Widget build(BuildContext context) {
    final filteredEvents = _filterEvents();

    return filteredEvents.isEmpty
        ? const Center(
            child: Text(
              'Nenhum resultado encontrado.',
              style: TextStyle(color: Colors.white70, fontSize: 18),
            ),
          )
        : ListView.builder(
            itemCount: filteredEvents.length,
            itemBuilder: (context, index) {
              final event = filteredEvents[index];
              final originalIndex = widget.events.indexOf(event);
              return EventCard(
                image: event['image']!,
                location: event['location']!,
                time: event['time']!,
                isFavorite: favoriteStates[originalIndex],
                onFavoriteToggle: () {
                  setState(() {
                    favoriteStates[originalIndex] = !favoriteStates[originalIndex];
                  });
                },
                isFree: event['isFree'] ?? false, // Usar false como valor padrão
              );
            },
          );
  }

  List<Map<String, dynamic>> _filterEvents() {
    if (widget.searchQuery.isEmpty) {
      return widget.events;
    }
    return widget.events
        .where((event) => event['location']!
            .toLowerCase()
            .contains(widget.searchQuery.toLowerCase()))
        .toList();
  }
}
