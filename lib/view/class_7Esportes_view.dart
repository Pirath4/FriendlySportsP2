import 'package:flutter/material.dart';

import 'package:friendly_sports/controller/class_Esportes_Controller.dart';
import 'package:friendly_sports/view/class_1Login_view.dart';

class EsportesView extends StatelessWidget {
  final EsportesController controller = EsportesController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Esportes",
          style: TextStyle(
              color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
        ),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(232, 248, 245, 67),
                Color.fromARGB(206, 195, 233, 28),
              ],
            ),
          ),
        ),
      ),

      drawer: Drawer(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color.fromARGB(232, 248, 245, 67),
                    Color.fromARGB(206, 195, 233, 28),
                  ],
                ),
              ),
              // Ajuste a altura do DrawerHeader
              margin: EdgeInsets.zero, // Remove margens externas
              padding: EdgeInsets.all(10.0), // Ajusta o padding interno
              child: Center(
                child: Text(
                  "Menu",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20, // Ajuste o tamanho da fonte, se necessário
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.person),
              title: Text("Perfil"),
              onTap: () {
                Navigator.pop(context); // Fecha o Drawer
                Navigator.pushReplacementNamed(context,
                    'perfil'); // Substitui a tela atual pela tela de perfil
              },
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text("Configurações"),
              onTap: () {
                Navigator.pop(context); // Fecha o Drawer
                Navigator.pushNamed(context,
                    'configuracoes'); // Navega para a tela de configurações
              },
            ),
            ListTile(
              leading: Icon(Icons.logout),
              title: Text("Sair da Conta"),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => LoginView()),
                  (Route<dynamic> route) => false,
                );
              },
            ),
          ],
        ),
      ),

      // Cor do fundo
      backgroundColor: Colors.blue[50],

      //
      body: ListView.builder(
        itemCount: controller.esportes.length,
        itemBuilder: (context, index) {
          final item = controller.esportes[index];

          return Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.all(50.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => item.pagina),
                );
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    item.nome,
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
