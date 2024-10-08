import 'package:flutter/material.dart';
import 'package:xotecariri/widgets/logo.dart';
import 'package:xotecariri/widgets/notification_icon.dart';  // Importa o novo componente
import './perfil_page.dart'; // Importe a página do perfil

class Header extends StatelessWidget implements PreferredSizeWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: 80,
      backgroundColor: const Color(0xFF000D1F),
      title: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Row(
          children: [
            const Logo(),  
            const Spacer(),
            const NotificationIcon(),  
            const SizedBox(width: 16),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const PerfilPage()), 
                );
              },
              child: CircleAvatar(
                radius: 24, 
                backgroundImage: AssetImage(''), 
                child: Icon(Icons.person, size: 24), 
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(80);
}
