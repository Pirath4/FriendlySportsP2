import 'package:flutter/material.dart';
import 'package:friendly_sports/controller/class_Login_controller.dart';

class EsqueciView extends StatefulWidget {
  const EsqueciView({super.key});

  @override
  _EsqueciViewState createState() => _EsqueciViewState();
}

class _EsqueciViewState extends State<EsqueciView> {
  final EsqueciController viewModel = EsqueciController();

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
            letterSpacing: 10,
            fontWeight: FontWeight.bold,
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
            ),
          ),
        ),
      ),
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
                  "Recuperar senha",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 20),
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
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () async {
                    String message = await viewModel.esqueciCadastro();
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text(message)),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 40, vertical: 15),
                  ),
                  child: const Text(
                    "Enviar código ao e-mail",
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
