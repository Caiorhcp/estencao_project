import 'package:flutter/material.dart';

class EventCard extends StatelessWidget {
  final String image;
  final String location;
  final String time;
  final bool isFavorite; 
  final VoidCallback onFavoriteToggle; 
  final bool isFree; // Adicionado para verificar se o evento é gratuito
  
  const EventCard({
    super.key,
    required this.image,
    required this.location,
    required this.time,
    required this.isFavorite,
    required this.onFavoriteToggle,
    required this.isFree, // Adicionado ao construtor
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: const Color(0xFF000D1F),
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
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
                    location,
                    style: const TextStyle(
                      color: Color(0xFFFFB854),
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 4.0),
                  Text(
                    time,
                    style: const TextStyle(
                      color: Colors.white70,
                      fontSize: 14,
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
                  const SizedBox(height: 8.0), // Espaçamento entre os textos
                ],
              ),
            ),
            const SizedBox(width: 16.0),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                IconButton(
                  icon: Icon(
                    isFavorite ? Icons.favorite : Icons.favorite_border,
                    color: isFavorite ? Colors.red : Colors.white,
                  ),
                  onPressed: onFavoriteToggle,
                ),
                const SizedBox(height: 26.0), // Espaçamento entre o ícone e o texto
                Text(
                  isFree ? 'Grátis' : 'Pago', // Exibe Grátis ou Pago
                  style: TextStyle(
                    color: isFree ? Colors.green : Colors.red, // Cores para indicar grátis ou pago
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
