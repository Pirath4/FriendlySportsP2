import 'package:flutter/material.dart';

class PerfilView extends StatefulWidget {
  @override
  _PerfilViewState createState() => _PerfilViewState();
}

class _PerfilViewState extends State<PerfilView> {
  // Dados do usuário (simulados)
  final String nome = "Walter White";
  final String telefone = "(55) 12345-6789";
  final String nascimento = "07/09/1958";
  final String senha = "********";

  // Estados para a checklist
  bool futebolSelecionado = false;
  bool voleibolSelecionado = false;
  bool basqueteSelecionado = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Perfil",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pushReplacementNamed(
                context, 'esportes'); // Volta para EsportesView
          },
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Foto do usuário
            Center(
              child: CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage(
                    'assets/Walter_White__.png'), // Substitua pelo caminho da imagem do usuário
              ),
            ),
            SizedBox(height: 20),

            // Nome
            Text(
              "Nome: $nome",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),

            // Telefone
            Text(
              "Telefone: $telefone",
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 10),

            // Data de nascimento
            Text(
              "Data de Nascimento: $nascimento",
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 10),

            // Senha (ocultada)
            Text(
              "Senha: $senha",
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 20),

            // Checklist de esportes
            Text(
              "Esportes:",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            CheckboxListTile(
              title: Text("Futebol"),
              value: futebolSelecionado,
              onChanged: (bool? value) {
                setState(() {
                  futebolSelecionado = value ?? false;
                });
              },
            ),
            CheckboxListTile(
              title: Text("Voleibol"),
              value: voleibolSelecionado,
              onChanged: (bool? value) {
                setState(() {
                  voleibolSelecionado = value ?? false;
                });
              },
            ),
            CheckboxListTile(
              title: Text("Basquete"),
              value: basqueteSelecionado,
              onChanged: (bool? value) {
                setState(() {
                  basqueteSelecionado = value ?? false;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
