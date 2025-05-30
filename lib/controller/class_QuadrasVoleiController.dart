// import 'package:flutter/material.dart';

// import 'package:friendly_sports/view/class_Quadras_view.dart';

// class QuadrasVoleibolModel {
//   final String nome;
//   final String end;
//   final String qtdquadras;
//   //final Widget pagina;
//   final List<String> imagemUrl;

//   QuadrasVoleibolModel({
//     required this.nome,
//     required this.end,
//     required this.qtdquadras,
//     //required this.pagina,
//     required this.imagemUrl,
//   });
// }

// class QuadrasVoleibolController extends ChangeNotifier {
//   final List<QuadrasVoleibolModel> _quadrasvoleibol = [
//     QuadrasVoleibolModel(
//         nome: 'Invictus RP',
//         end:
//             'Av. Itatiaia, 100 - Jardim Sumare, Ribeirão Preto - SP, 14025-240',
//         qtdquadras: '2 quadras',
//         //pagina: QuadrasView(),
//         imagemUrl: [
//           'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRC2zQqTwlxbltqjhh9MhovXXkb6xhUISkdRqVboe6LiSOle0RoHIYJa3NmyEUXccoTZ7I&usqp=CAU',
//         ]),
//   ];

//   bool _visualizarLista = true;

//   List<QuadrasVoleibolModel> get quadras => _quadrasvoleibol;
//   bool get visualizarLista => _visualizarLista;

//   void alterarVisualizacao(valor) {
//     _visualizarLista = valor;
//     notifyListeners();
//   }

//   void removerItem(index) {
//     _quadrasvoleibol.removeAt(index);
//     notifyListeners();
//   }
// }
