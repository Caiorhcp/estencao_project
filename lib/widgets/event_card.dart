import 'package:flutter/material.dart';

class EventCard extends StatelessWidget {
  final String image;
  final String eventName;
  final String location;
  final String details;

  const EventCard({
    required this.image,
    required this.eventName,
    required this.location,
    required this.details,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: const Color.fromARGB(255, 13, 0, 86),
      margin: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Image.asset(
                image,
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
                    eventName,
                    style: const TextStyle(
                        color: Color.fromARGB(255, 255, 153, 0),
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 4.0),
                  Text(
                    'Local: $location',
                    style: const TextStyle(color: Colors.white70),
                  ),
                  const SizedBox(height: 4.0),
                  Text(
                    'Detalhes: $details',
                    style: const TextStyle(color: Colors.white70),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
