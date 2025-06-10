// ignore_for_file: prefer_const_constructors
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:device_preview/device_preview.dart';

import 'firebase_options.dart';
import 'package:friendly_sports/view/class_1Login_view.dart';
import 'package:friendly_sports/view/class_5Perfil_view.dart';
import 'package:friendly_sports/view/class_6Config_view.dart';
import 'package:friendly_sports/view/class_7Esportes_view.dart';

void main() async {
  WidgetsFlutterBinding
      .ensureInitialized(); // necessário para operações async antes do runApp
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(
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
      title: 'Friendly Sports',
      useInheritedMediaQuery:
          true, // necessário para funcionar com DevicePreview
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
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


//felipe290899@gmail.com
//123456