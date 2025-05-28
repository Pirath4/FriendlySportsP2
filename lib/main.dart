import 'package:flutter/material.dart';
import 'package:device_preview/device_preview.dart';

import 'package:friendly_sports/view/class_1Login_view.dart';
import 'package:friendly_sports/view/class_5Perfil_view.dart';
import 'package:friendly_sports/view/class_6Config_view.dart';
import 'package:friendly_sports/view/class_7Esportes_view.dart';

void main() {
  runApp(
    //Carregar o plugin device preview
    DevicePreview(
      enabled: true,
      builder: (context) => MainApp(),
    ),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'navegacao',
      initialRoute: 'home',
      routes: {
        'home': (context) => LoginView(),
        'perfil': (context) => PerfilView(),
        'configuracoes': (context) => ConfigView(),
        'esportes': (context) => EsportesView(),
      },
    );
  }
}
