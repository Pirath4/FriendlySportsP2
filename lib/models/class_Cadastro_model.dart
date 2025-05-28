import 'package:flutter/material.dart';

class CadastroModel {
  final TextEditingController nomeController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController senhaController = TextEditingController();
  final TextEditingController nascimentoController = TextEditingController();
  final TextEditingController telefoneController = TextEditingController();

  String fazerCadastro() {
    String nome = nomeController.text;
    String telefone = telefoneController.text;
    String nascimento = nascimentoController.text;
    String email = emailController.text;
    String senha = senhaController.text;

    // Lógica de cadastro
    if (nome.isNotEmpty &&
        telefone.isNotEmpty &&
        nascimento.isNotEmpty &&
        email.isNotEmpty &&
        senha.isNotEmpty) {
      return "Cadastro realizado com sucesso!";
    } else {
      return "Preencha todos os campos!";
    }
  }
}
