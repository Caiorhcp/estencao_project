import 'package:flutter/material.dart';
import 'favorite_event_card.dart';

class FavoriteEventsList extends StatelessWidget {
  final List<Map<String, String>> events;
  final Function(int) onRemove;

  const FavoriteEventsList({
    super.key,
    required this.events,
    required this.onRemove,
  });

  @override
  Widget build(BuildContext context) {
    return events.isEmpty
        ? _buildEmptyFavoritesView()
        : ListView.builder(
            itemCount: events.length,
            itemBuilder: (context, index) {
              final event = events[index];
              return FavoriteEventCard(
                image: event['image']!,
                location: event['location']!,
                time: event['time']!,
                onRemove: () => onRemove(index), // Passa a função de remoção
              );
            },
          );
  }

  Widget _buildEmptyFavoritesView() {
    return const Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          Icons.favorite_border,
          color: Colors.white70,
          size: 100,
        ),
        SizedBox(height: 16.0),
        Text(
          'Nenhum favorito adicionado.',
          style: TextStyle(color: Colors.white70, fontSize: 18),
        ),
        SizedBox(height: 16.0),
      ],
    );
  }
}
