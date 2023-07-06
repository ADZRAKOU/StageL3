import 'package:flutter/material.dart';

class MenuPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Accueil'),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 2, 121, 218),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Menu',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                    ),
                  ),
                  SizedBox(height: 16),
                  Text(
                    'Notifications',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    '2 nouvelles notifications',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
            ListTile(
              title:const Text('Accueil'),
              onTap: () {
                // Action à effectuer lorsque l'accueil est sélectionné
                Navigator.pop(context); // Ferme le tiroir de navigation
              },
            ),
            ListTile(
              title: const  Text('Recherche'),
              onTap: () {
                // Action à effectuer lorsque la recherche est sélectionnée
                Navigator.pop(context); // Ferme le tiroir de navigation
              },
            ),
            ListTile(
              title: Text('Menu 1'),
              onTap: () {
                // Action à effectuer lorsque le menu 1 est sélectionné
                Navigator.pop(context); // Ferme le tiroir de navigation
              },
            ),
            ListTile(
              title: Text('Menu 2'),
              onTap: () {
                // Action à effectuer lorsque le menu 2 est sélectionné
                Navigator.pop(context); // Ferme le tiroir de navigation
              },
            ),
            ListTile(
              title: Text('Menu 3'),
              onTap: () {
                // Action à effectuer lorsque le menu 3 est sélectionné
                Navigator.pop(context); // Ferme le tiroir de navigation
              },
            ),
          ],
        ),
      ),
      body: const Center(
        child: Text('Contenu de la page d\'accueil'),
      ),
    );
  }
}
