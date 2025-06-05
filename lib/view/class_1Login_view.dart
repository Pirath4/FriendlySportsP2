import 'package:flutter/material.dart';

import 'package:friendly_sports/controller/class_Login_controller.dart';

import 'package:friendly_sports/view/class_2Cadastro_View.dart';
import 'package:friendly_sports/view/class_3Esqueci_view.dart';
import 'package:friendly_sports/view/class_4SobreNos_view.dart';
import 'package:friendly_sports/view/class_7Esportes_view.dart';

class LoginView extends StatefulWidget {
  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final LoginController viewModel = LoginController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Friendly Sports',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            letterSpacing: 10,
            color: const Color.fromARGB(255, 0, 0, 0),
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
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),

      //------------
      body: Center(
        child: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: const BoxDecoration(
            gradient: LinearGradient(colors: [
              Color.fromARGB(232, 62, 255, 229),
              Color.fromARGB(255, 66, 211, 255),
            ]),
          ),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Bem vindo",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                Text(
                  "ao",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                Text(
                  "Friendly Sports",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 7),
                Align(
                  alignment: Alignment.center,
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SobreNosView()),
                      );
                    },

                    //------------------------------------------
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          "Sobre nós",
                          style: TextStyle(
                              fontSize: 16,
                              color: const Color.fromARGB(255, 13, 13, 14),
                              decoration: TextDecoration.underline),
                        ),
                        SizedBox(width: 5),
                        Icon(
                          Icons.arrow_upward,
                          size: 16,
                          color: const Color.fromARGB(255, 13, 13, 14),
                        ),
                      ],
                    ),
                  ),
                ),

                SizedBox(height: 20),
                // Ícones de esportes
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.sports_soccer, size: 80, color: Colors.blue),
                    SizedBox(width: 20),
                    Icon(Icons.sports_volleyball, size: 80, color: Colors.blue),
                    SizedBox(width: 20),
                    Icon(Icons.sports_basketball, size: 80, color: Colors.blue),
                  ],
                ),

                SizedBox(height: 20),
                TextField(
                  controller: viewModel.emailController,
                  decoration: InputDecoration(
                      labelText: "E-mail",
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.email),
                      filled: true,
                      fillColor: Color.fromARGB(255, 255, 255, 255)),
                  keyboardType: TextInputType.emailAddress,
                ),

                SizedBox(height: 15),
                TextField(
                  controller: viewModel.senhaController,
                  decoration: InputDecoration(
                      labelText: "Senha",
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.lock),
                      filled: true,
                      fillColor: Color.fromARGB(255, 255, 255, 255)),
                  obscureText: true,
                ),

                SizedBox(height: 7),
                Align(
                  alignment: Alignment.centerRight,
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => EsqueciView()),
                      );
                    },
                    child: Text(
                      "Esqueceu a senha?",
                      style: TextStyle(
                        fontSize: 16,
                        color: const Color.fromARGB(255, 13, 13, 14),
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                ),

                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment
                      .spaceBetween, // Alinha os botões com espaço entre eles
                  children: [
                    // Botão de Login
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.only(
                            right: 5), // Espaçamento entre os botões
                        child: ElevatedButton(
                          onPressed: () async {
                            String resultado = await viewModel.fazerLogin();
                            String message;
                            if (resultado == "sucesso") {
                              message = "Login realizado com sucesso!";
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => EsportesView()),
                              );
                            } else {
                              message = "E-mail ou senha incorretos!";
                            }
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text(message)),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.symmetric(
                                horizontal: 20, vertical: 15),
                          ),
                          child: Text("Login",
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.black,
                              )),
                        ),
                      ),
                    ),

                    // Botão de Cadastro
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.symmetric(
                            horizontal: 5), // Espaçamento entre os botões
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => CadastroView()),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.symmetric(
                                horizontal: 20, vertical: 15),
                          ),
                          child: Text("Cadastro",
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.black,
                              )),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
