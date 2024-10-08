import 'package:flutter/material.dart';

class NotificationIcon extends StatelessWidget {
  const NotificationIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        IconButton(
          icon: const Icon(
            Icons.notifications,
            color: Colors.white,  // Cor do ícone
            size: 30,             // Tamanho do ícone
          ),
          onPressed: () {
            // Exibe a caixa de notificações ao clicar
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  backgroundColor: const Color.fromARGB(255, 86, 102, 126).withOpacity(0.8), // Caixa um pouco transparente
                  title: const Text('Notificações', style: TextStyle(color: Colors.white)),
                  content: SizedBox(
                    width: double.maxFinite,
                    child: ListView(
                      shrinkWrap: true,
                      children: [
                        const ListTile(
                          leading: Icon(Icons.event, color: Colors.white),
                          title: Text('Evento 1 está começando em breve!', style: TextStyle(color: Colors.white)),
                        ),
                        const Divider(color: Colors.white), // Barra separadora
                        const ListTile(
                          leading: Icon(Icons.event, color: Colors.white),
                          title: Text('Evento 2 foi adicionado aos seus favoritos.', style: TextStyle(color: Colors.white)),
                        ),
                        const Divider(color: Colors.white), // Barra separadora
                        const ListTile(
                          leading: Icon(Icons.event, color: Colors.white),
                          title: Text('Você tem novos eventos na sua área.', style: TextStyle(color: Colors.white)),
                        ),
                      ],
                    ),
                  ),
                  actions: [
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pop(); // Fecha o diálogo
                      },
                      child: const Text('Fechar', style: TextStyle(color: Colors.white)),
                    ),
                  ],
                );
              },
            );
          },
        ),
        // Bolinha vermelha indicando novas notificações
        Positioned(
          right: 0,
          top: 0,
          child: Container(
            width: 10,
            height: 10,
            decoration: BoxDecoration(
              color: Colors.red,   // Cor da bolinha
              shape: BoxShape.circle,
            ),
          ),
        ),
      ],
    );
  }
}
