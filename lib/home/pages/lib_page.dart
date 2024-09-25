import 'package:flutter/material.dart';

class LibPage extends StatefulWidget {
  const LibPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _LibPageState createState() => _LibPageState();
}

class _LibPageState extends State<LibPage> {
  // Lista de favoritos (simulando os eventos favoritos)
  final List<Map<String, String>> favoriteEvents = [
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
  ];

  // Lista filtrada
  List<Map<String, String>> filteredEvents = [];

  // Filtros selecionados
  String? selectedLocation;
  String? selectedTime;

  @override
  void initState() {
    super.initState();
    // Inicialmente, exibe todos os eventos
    filteredEvents = List.from(favoriteEvents);
  }

  // Função para limpar todos os favoritos
  void _clearFavorites() {
    setState(() {
      favoriteEvents.clear();
      filteredEvents.clear(); // Limpa também os filtrados
    });
  }

  // Mostrar diálogo de confirmação de exclusão
  Future<void> _showClearConfirmationDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // Não permite fechar clicando fora
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Confirmar Exclusão'),
          content: const Text('Você tem certeza que deseja excluir todos os favoritos?'),
          actions: <Widget>[
            TextButton(
              child: const Text('Cancelar'),
              onPressed: () {
                Navigator.of(context).pop(); // Fechar o diálogo sem excluir
              },
            ),
            TextButton(
              child: const Text('Excluir', style: TextStyle(color: Colors.red)),
              onPressed: () {
                Navigator.of(context).pop(); // Fechar o diálogo
                _clearFavorites(); // Excluir todos os favoritos
              },
            ),
          ],
        );
      },
    );
  }

  // Exibir opções de filtro no centro da tela
  Future<void> _showFilterDialog() async {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Filtrar por'),
          content: StatefulBuilder(
            builder: (BuildContext context, StateSetter setState) {
              return Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Filtro por Localização
                  DropdownButton<String>(
                    hint: const Text('Localização'),
                    value: selectedLocation,
                    items: favoriteEvents
                        .map((event) => event['location']!)
                        .toSet() // Remove duplicatas
                        .map((location) {
                      return DropdownMenuItem<String>(
                        value: location,
                        child: Text(location),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      setState(() {
                        selectedLocation = newValue;
                      });
                    },
                  ),
                  // Filtro por Tempo
                  DropdownButton<String>(
                    hint: const Text('Horário'),
                    value: selectedTime,
                    items: favoriteEvents
                        .map((event) => event['time']!)
                        .toSet() // Remove duplicatas
                        .map((time) {
                      return DropdownMenuItem<String>(
                        value: time,
                        child: Text(time),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      setState(() {
                        selectedTime = newValue;
                      });
                    },
                  ),
                ],
              );
            },
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Cancelar'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            ElevatedButton(
              child: const Text('Aplicar Filtros'),
              onPressed: () {
                _applyFilters(); // Aplica os filtros
                Navigator.pop(context); // Fecha o diálogo
              },
            ),
          ],
        );
      },
    );
  }

  // Função para aplicar filtros
  void _applyFilters() {
    setState(() {
      filteredEvents = favoriteEvents.where((event) {
        final matchLocation = selectedLocation == null || event['location'] == selectedLocation;
        final matchTime = selectedTime == null || event['time'] == selectedTime;
        return matchLocation && matchTime;
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Favoritos', style: TextStyle(color: Colors.white)),
        backgroundColor: const Color(0xff282828),
        actions: [
          if (favoriteEvents.isNotEmpty)
            IconButton(
              icon: const Icon(Icons.filter_list, color: Colors.white),
              onPressed: _showFilterDialog, // Mostrar diálogo de filtro
              tooltip: 'Filtrar favoritos',
            ),
          if (favoriteEvents.isNotEmpty)
            IconButton(
              icon: const Icon(Icons.delete_forever, color: Colors.white),
              onPressed: _showClearConfirmationDialog, // Mostrar diálogo de confirmação
              tooltip: 'Remover todos os favoritos',
            ),
        ],
      ),
      body: Container(
        width: size.width,
        height: size.height,
        color: const Color(0xff333333),
        padding: const EdgeInsets.all(16.0),
        child: filteredEvents.isEmpty
            ? _buildEmptyFavoritesView()
            : ListView.builder(
                itemCount: filteredEvents.length,
                itemBuilder: (context, index) {
                  final event = filteredEvents[index];
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
                            icon: const Icon(
                              Icons.favorite,
                              color: Colors.red,
                            ),
                            onPressed: () {
                              setState(() {
                                favoriteEvents.removeAt(index); // Remove dos favoritos
                                filteredEvents.removeAt(index); // Remove também dos filtrados
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
    );
  }

  // Exibir a tela de favoritos vazios com uma mensagem de "Buscar Eventos"
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
