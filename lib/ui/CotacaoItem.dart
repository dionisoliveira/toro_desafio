

import 'package:flutter/material.dart';
import 'package:toro_desafio/models/Cotacao.dart';


class CotacaoItemCard extends StatelessWidget {
  final Cotacao cotacaoItem;

  CotacaoItemCard({@required this.cotacaoItem});

  @override
  Widget build(BuildContext context) {
   return new Card(
      child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            ListTile(
              leading: const Icon(Icons.album),
              title: Text(' ${cotacaoItem.nome} '),
              subtitle: Text('${cotacaoItem.percentual.toStringAsFixed(3)}'),

            ),
            ListTile(

              title: Text(' ${cotacaoItem.valor} '),

            ),
          ]),


    );
  }
}