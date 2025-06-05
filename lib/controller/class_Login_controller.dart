import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

//------------------------------------------------------------
class LoginController {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController senhaController = TextEditingController();

  bool fazerLogin() {
    String email = emailController.text;
    String senha = senhaController.text;

    final FirebaseAuth auth = FirebaseAuth.instance;

    if (email == "1" && senha == "2") {
      return true;
    } else {
      return false;
    }
  }
}

class EsqueciController {
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

class CadastroController {
  final TextEditingController nomeController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController senhaController = TextEditingController();
  final TextEditingController nascimentoController = TextEditingController();
  final TextEditingController telefoneController = TextEditingController();

  Future<String> fazerCadastro() async {
    String nome = nomeController.text.trim();
    String telefone = telefoneController.text.trim();
    String nascimento = nascimentoController.text.trim();
    String email = emailController.text.trim();
    String senha = senhaController.text.trim();

    if (nome.isEmpty ||
        telefone.isEmpty ||
        nascimento.isEmpty ||
        email.isEmpty ||
        senha.isEmpty) {
      return "Preencha todos os campos!";
    }

    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: senha);

      // Salvar dados no Firestore
      await FirebaseFirestore.instance
          .collection('users')
          .doc(userCredential.user!.uid)
          .set({
        'nome': nome,
        'telefone': telefone,
        'nascimento': nascimento,
        'email': email,
        'criado_em': FieldValue.serverTimestamp(),
      });

      return "Cadastro realizado com sucesso!";
    } catch (e) {
      print(e);
      return "Erro no cadastro: ${e}";
    }
  }
}
