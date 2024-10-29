import 'package:flutter/material.dart';

class RecentSearches extends StatelessWidget {
  final List<Map<String, String>> recentSearches;

  const RecentSearches({
    super.key,
    required this.recentSearches,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 130, // Altura do card
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        itemCount: recentSearches.length,
        itemBuilder: (context, index) {
          return _buildRecentSearchCard(recentSearches[index]);
        },
      ),
    );
  }

  Widget _buildRecentSearchCard(Map<String, String> search) {
    return Container(
      width: 120.0, // Largura consistente
      margin: const EdgeInsets.symmetric(horizontal: 6.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center, // Centraliza o conteúdo verticalmente
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(6.0), // Bordas arredondadas
            child: Image.asset(
              search['image'] ?? 'assets/images/default.jpg',
              height: 70.0, // Altura da imagem
              width: 120.0, // Largura da imagem
              fit: BoxFit.cover, // Ajusta a imagem
            ),
          ),
          const SizedBox(height: 4.0),
          Text(
            search['title'] ?? 'Título',
            style: const TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.bold,
              color: Color.fromARGB(255, 255, 255, 255),
            ),
            textAlign: TextAlign.center, // Centraliza o texto
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 2.0),
          Text(
            search['date'] ?? 'Data/Hora',
            style: const TextStyle(
              fontSize: 14.0,
              color: Colors.white70,
            ),
            textAlign: TextAlign.center, // Centraliza o texto
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
