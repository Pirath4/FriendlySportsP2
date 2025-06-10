import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

//------------------------------------------------------------
class LoginController {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController senhaController = TextEditingController();

  Future<String> fazerLogin() async {
    String email = emailController.text.trim();
    String senha = senhaController.text.trim();

    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: senha,
      );
      return "sucesso";
    } on FirebaseAuthException catch (e) {
      return "Erro ao fazer login: ${e.message}";
    }
  }
}

class EsqueciController {
  final TextEditingController emailController = TextEditingController();

  Future<String> esqueciCadastro() async {
    String email = emailController.text.trim();

    // Verifica se o campo de e-mail está preenchido
    if (email.isEmpty) {
      return "Preencha o campo de e-mail!";
    }

    try {
      // Envia o e-mail de redefinição de senha usando o Firebase
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
      return "Código enviado ao e-mail!";
    } on FirebaseAuthException catch (e) {
      // Tratamento de erros do Firebase
      if (e.code == 'user-not-found') {
        return "Nenhum usuário encontrado com este e-mail.";
      } else if (e.code == 'invalid-email') {
        return "E-mail inválido. Verifique o formato do e-mail.";
      } else {
        return "Erro ao enviar o e-mail de recuperação: ${e.message}";
      }
    } catch (e) {
      return "Ocorreu um erro inesperado: $e";
    }
  }

  // Limpa o campo após o uso
  void dispose() {
    emailController.dispose();
  }
}

class CadastroController {
  final TextEditingController nomeController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController senhaController = TextEditingController();
  final TextEditingController nascimentoController = TextEditingController();
  final TextEditingController telefoneController = TextEditingController();

  get confirmarSenhaController => null;

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

  void dispose() {}
}
