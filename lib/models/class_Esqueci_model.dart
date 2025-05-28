import 'package:flutter/material.dart';

class EsqueciModel {
  final TextEditingController nomeController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController senhaController = TextEditingController();

  String esqueciCadastro() {
    String nome = nomeController.text;
    String email = emailController.text;

    // Lógica de cadastro
    if (nome.isNotEmpty && email.isNotEmpty) {
      return "Codigo enviado ao email!";
    } else {
      return "Preencha todos os campos!";
    }
  }
}
