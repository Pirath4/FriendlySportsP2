import 'package:flutter/material.dart';

import 'package:friendly_sports/controller/class_QuadrasVoleiController.dart';
import 'package:friendly_sports/view/class_QuadrasDetalhes_view.dart';

class VoleibolView extends StatelessWidget {
  final QuadrasVoleibolController controller = QuadrasVoleibolController();

  @override
  Widget build(BuildContext context) {
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

      // Cor do fundo
      backgroundColor: Colors.blue[50],

      body: ListView.builder(
        itemCount: controller.quadras.length,
        itemBuilder: (context, index) {
          final item = controller.quadras[index];

          return GestureDetector(
            onTap: () {
              // Navega para a página associada à quadra
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => QuadraDetalhesView(
                        nome: item.nome,
                        endereco: item.end,
                        qtdQuadras: item.qtdquadras,
                        imagemUrl: item.imagemUrl)),
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
                    // Imagem grande
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

                    // Texto embaixo da imagem
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
