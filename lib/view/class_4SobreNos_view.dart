import 'package:flutter/material.dart';

class SobreNosView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sobre Nós"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Bem-vindo à página Sobre Nós!",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10), // espaço entre os textos
            Text(
              "Olá, nós chamamos Bernardo Marques e Felipe Marques, graduandos em Análise e Desenvolvimento pela FATEC - RP, esse é nosso projeto para a aula de Programação para dispositivos móveis, e será nosso TCC e espero que também o app principal da nossa futura empresa Marques Developers.",
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
