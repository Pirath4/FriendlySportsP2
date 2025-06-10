import 'package:flutter/material.dart';
import 'package:friendly_sports/controller/class_Login_controller.dart';
import 'class_7Esportes_view.dart'; // Importa a tela de esportes

class CadastroView extends StatefulWidget {
  const CadastroView({super.key});

  @override
  _CadastroViewState createState() => _CadastroViewState();
}

class _CadastroViewState extends State<CadastroView> {
  final CadastroController viewModel = CadastroController();

  @override
  void dispose() {
    viewModel.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Friendly Sports',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            letterSpacing: 10,
          ),
        ),
        centerTitle: true,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(232, 248, 245, 67),
                Color.fromARGB(206, 195, 233, 28),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
      ),
      backgroundColor: Colors.blue[50],
      body: Center(
        child: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(232, 62, 255, 229),
                Color.fromARGB(255, 66, 211, 255),
              ],
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Cadastro",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 20),
                TextField(
                  controller: viewModel.nomeController,
                  decoration: const InputDecoration(
                    labelText: "Nome",
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.person),
                    filled: true,
                    fillColor: Color.fromARGB(255, 255, 255, 255),
                  ),
                ),
                const SizedBox(height: 15),
                TextField(
                  controller: viewModel.telefoneController,
                  decoration: const InputDecoration(
                    labelText: "Telefone",
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.add_ic_call),
                    filled: true,
                    fillColor: Color.fromARGB(255, 255, 255, 255),
                  ),
                ),
                const SizedBox(height: 15),
                TextField(
                  controller: viewModel.nascimentoController,
                  decoration: const InputDecoration(
                    labelText: "Data de nascimento",
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.cake),
                    filled: true,
                    fillColor: Color.fromARGB(255, 255, 255, 255),
                  ),
                ),
                const SizedBox(height: 15),
                TextField(
                  controller: viewModel.emailController,
                  decoration: const InputDecoration(
                    labelText: "E-mail",
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.email),
                    filled: true,
                    fillColor: Color.fromARGB(255, 255, 255, 255),
                  ),
                  keyboardType: TextInputType.emailAddress,
                ),
                const SizedBox(height: 15),
                TextField(
                  controller: viewModel.senhaController,
                  decoration: const InputDecoration(
                    labelText: "Senha",
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.lock),
                    filled: true,
                    fillColor: Color.fromARGB(255, 255, 255, 255),
                  ),
                  obscureText: true,
                ),
                const SizedBox(height: 15),
                TextField(
                  controller: viewModel.confirmarSenhaController,
                  decoration: const InputDecoration(
                    labelText: "Confirmar Senha",
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.lock),
                    filled: true,
                    fillColor: Color.fromARGB(255, 255, 255, 255),
                  ),
                  obscureText: true,
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () async {
                    String message = await viewModel.fazerCadastro();
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text(message)),
                    );
                    if (message == "Cadastro realizado com sucesso!") {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => EsportesView(),
                        ),
                      );
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 40,
                      vertical: 15,
                    ),
                  ),
                  child: const Text(
                    "Cadastrar",
                    style: TextStyle(fontSize: 18, color: Colors.black),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
