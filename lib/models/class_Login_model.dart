import 'package:flutter/material.dart';

//------------------------------------------------------------
class LoginModel {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController senhaController = TextEditingController();

  bool fazerLogin() {
    String email = emailController.text;
    String senha = senhaController.text;

    if (email == "1" && senha == "2") {
      return true;
    } else {
      return false;
    }
  }
}
