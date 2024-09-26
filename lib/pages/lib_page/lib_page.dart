import 'package:flutter/material.dart';
import 'favorite_events_list.dart';

class LibPage extends StatefulWidget {
  const LibPage({super.key});

  @override
  _LibPageState createState() => _LibPageState();
}

class _LibPageState extends State<LibPage> {
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

  List<Map<String, String>> filteredEvents = [];
  String? selectedLocation;
  String? selectedTime;

  @override
  void initState() {
    super.initState();
    filteredEvents = List.from(favoriteEvents);
  }

  void _clearFavorites() {
    setState(() {
      favoriteEvents.clear();
      filteredEvents.clear();
    });
  }

  Future<void> _showClearConfirmationDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Confirmar Exclusão'),
          content: const Text('Você tem certeza que deseja excluir todos os favoritos?'),
          actions: <Widget>[
            TextButton(
              child: const Text('Cancelar'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text('Excluir', style: TextStyle(color: Colors.red)),
              onPressed: () {
                Navigator.of(context).pop();
                _clearFavorites();
              },
            ),
          ],
        );
      },
    );
  }

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
                  DropdownButton<String>(
                    hint: const Text('Localização'),
                    value: selectedLocation,
                    items: favoriteEvents
                        .map((event) => event['location']!)
                        .toSet()
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
                  DropdownButton<String>(
                    hint: const Text('Horário'),
                    value: selectedTime,
                    items: favoriteEvents
                        .map((event) => event['time']!)
                        .toSet()
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
                _applyFilters();
                Navigator.pop(context);
              },
            ),
          ],
        );
      },
    );
  }

//Chatgtp da massa nesse caraio aqui
  void _applyFilters() {
    setState(() {
      filteredEvents = favoriteEvents.where((event) {
        final matchLocation =
            selectedLocation == null || event['location'] == selectedLocation;
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
        backgroundColor: const Color.fromARGB(255, 3, 0, 42),
        actions: [
          if (favoriteEvents.isNotEmpty)
            IconButton(
              icon: const Icon(Icons.filter_list, color: Colors.white),
              onPressed: _showFilterDialog,
              tooltip: 'Filtrar favoritos',
            ),
          if (favoriteEvents.isNotEmpty)
            IconButton(
              icon: const Icon(Icons.delete_forever, color: Colors.white),
              onPressed: _showClearConfirmationDialog,
              tooltip: 'Remover todos os favoritos',
            ),
        ],
      ),
      body: Container(
        width: size.width,
        height: size.height,
        color: const Color.fromARGB(255, 12, 0, 59),
        padding: const EdgeInsets.all(16.0),
        child: FavoriteEventsList(
          events: filteredEvents,
          onRemove: (index) {
            setState(() {
              favoriteEvents.removeAt(index);
              filteredEvents.removeAt(index);
            });
          },
        ),
      ),
    );
  }
}
