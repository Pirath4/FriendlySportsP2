import 'package:flutter/material.dart';

import 'package:friendly_sports/controller/class_Quadras_controller.dart';
import 'package:friendly_sports/view/class_QuadrasDetalhes_view.dart';

class VoleibolView extends StatelessWidget {
  final QuadrasController controller = QuadrasController();

  @override
  Widget build(BuildContext context) {
    // Filtra as quadras para exibir só as que possuem "futebol" no esporte
    final quadrasFutebol = controller.quadras
        .where((q) => q.esporte.toLowerCase().contains('voleibol'))
        .toList();

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
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
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 14),
            Text(
              'Quadras',
              style: TextStyle(
                color: Colors.black,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
      backgroundColor: Colors.blue[50],
      body: ListView.builder(
        itemCount: quadrasFutebol.length,
        itemBuilder: (context, index) {
          final item = quadrasFutebol[index];

          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => QuadraDetalhesView(
                    nome: item.nome,
                    endereco: item.end,
                    qtdQuadras: item.qtdquadras,
                    imagemUrl: item.imagemUrl,
                  ),
                ),
              );
            },
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: Card(
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius:
                          BorderRadius.vertical(top: Radius.circular(12.0)),
                      child: Image.network(
                        item.imagemUrl[0],
                        width: double.infinity,
                        height: 200,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) {
                          return Container(
                            height: 200,
                            color: Colors.grey[300],
                            child: Icon(Icons.error, size: 50),
                          );
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            item.nome,
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 8),
                          Text(
                            item.end,
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.grey[600],
                            ),
                          ),
                          SizedBox(height: 4),
                          Text(
                            item.qtdquadras,
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.grey[600],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
