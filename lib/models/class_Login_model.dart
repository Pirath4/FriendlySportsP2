// import 'package:flutter/material.dart';

// //------------------------------------------------------------
// class LoginModel {
//   final TextEditingController emailController = TextEditingController();
//   final TextEditingController senhaController = TextEditingController();

//   bool fazerLogin() {
//     String email = emailController.text;
//     String senha = senhaController.text;

//     if (email == "1" && senha == "2") {
//       return true;
//     } else {
//       return false;
//     }
//   }
// }

// class EsqueciModel {
//   final TextEditingController nomeController = TextEditingController();
//   final TextEditingController emailController = TextEditingController();
//   final TextEditingController senhaController = TextEditingController();

//   String esqueciCadastro() {
//     String nome = nomeController.text;
//     String email = emailController.text;

//     // Lógica de cadastro
//     if (nome.isNotEmpty && email.isNotEmpty) {
//       return "Codigo enviado ao email!";
//     } else {
//       return "Preencha todos os campos!";
//     }
//   }
// }

// class CadastroModel {
//   final TextEditingController nomeController = TextEditingController();
//   final TextEditingController emailController = TextEditingController();
//   final TextEditingController senhaController = TextEditingController();
//   final TextEditingController nascimentoController = TextEditingController();
//   final TextEditingController telefoneController = TextEditingController();

//   String fazerCadastro() {
//     String nome = nomeController.text;
//     String telefone = telefoneController.text;
//     String nascimento = nascimentoController.text;
//     String email = emailController.text;
//     String senha = senhaController.text;

//     // Lógica de cadastro
//     if (nome.isNotEmpty &&
//         telefone.isNotEmpty &&
//         nascimento.isNotEmpty &&
//         email.isNotEmpty &&
//         senha.isNotEmpty) {
//       return "Cadastro realizado com sucesso!";
//     } else {
//       return "Preencha todos os campos!";
//     }
//   }
// }
