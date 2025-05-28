import 'package:flutter/material.dart';

import 'package:friendly_sports/models/class_Esportes_model.dart';
import 'package:friendly_sports/view/class_8EsporteFutebol_view.dart';
import 'package:friendly_sports/view/class_9EsporteVolei_view.dart';

class EsportesController extends ChangeNotifier {
  final List<EsportesModel> _esportes = [
    EsportesModel(nome: 'Futebol', pagina: FutebolView()),
    EsportesModel(nome: 'Voleibol', pagina: VoleibolView()),
  ];

  bool _visualizarLista = true;

  List<EsportesModel> get esportes => _esportes;
  bool get visualizarLista => _visualizarLista;

  void alterarVisualizacao(valor) {
    _visualizarLista = valor;
    notifyListeners();
  }

  void removerItem(index) {
    _esportes.removeAt(index);
    notifyListeners();
  }
}
