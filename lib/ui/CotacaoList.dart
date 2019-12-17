import 'package:flutter/material.dart';

import 'package:toro_desafio/models/Cotacao.dart';
import 'package:toro_desafio/ui/CotacaoItem.dart';




class CotacaoList extends StatelessWidget {
  final List<Cotacao> cotacao;

  CotacaoList({this.cotacao});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: cotacao.length,
      itemBuilder: (context, index) => CotacaoItemCard(cotacaoItem: cotacao[index]),
    );
  }
}