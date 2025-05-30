import 'package:flutter/material.dart';

import 'package:friendly_sports/view/class_Quadras_view.dart';

class QuadrasFutebolModel {
  final String nome;
  final String end;
  final String qtdquadras;
  // final Widget pagina;
  final List<String> imagemUrl;
  //final string esporte;

  QuadrasFutebolModel({
    required this.nome,
    required this.end,
    required this.qtdquadras,
    // required this.pagina,
    required this.imagemUrl,
    //required this.esporte,
  });
}

class QuadrasFutebolController extends ChangeNotifier {
  final List<QuadrasFutebolModel> _quadrasfutebol = [
    QuadrasFutebolModel(
        nome: 'X10 Complexo Esportivo',
        end: 'Av. Patriarca, 5050 - Jardim Monte Carlo, Ribeirão Preto - SP',
        qtdquadras: '10 quadras',
        // pagina: QuadrasView(),
        imagemUrl: [
          'https://assets.goal.com/images/v3/blt55456c6aa445f207/1bb5dc6e3a3c4a9a803b03848f20eb4a7b36df0b.jpg?auto=webp&format=pjpg&width=3840&quality=60',
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRC2zQqTwlxbltqjhh9MhovXXkb6xhUISkdRqVboe6LiSOle0RoHIYJa3NmyEUXccoTZ7I&usqp=CAU',
        ]),
    QuadrasFutebolModel(
        nome: 'Quadra de esportes Xavier',
        end: 'Av. Patriarca, 2686 - Jardim Bela Vista, Ribeirão Preto - SP',
        qtdquadras: '1 quadra',
        // pagina: QuadrasView(),
        imagemUrl: [
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRC2zQqTwlxbltqjhh9MhovXXkb6xhUISkdRqVboe6LiSOle0RoHIYJa3NmyEUXccoTZ7I&usqp=CAU',
        ]),
  ];

  bool _visualizarLista = true;

  List<QuadrasFutebolModel> get quadras => _quadrasfutebol;
  bool get visualizarLista => _visualizarLista;

  void alterarVisualizacao(valor) {
    _visualizarLista = valor;
    notifyListeners();
  }

  void removerItem(index) {
    _quadrasfutebol.removeAt(index);
    notifyListeners();
  }
}
