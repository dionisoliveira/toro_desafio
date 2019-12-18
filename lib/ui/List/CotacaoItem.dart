import 'package:flutter/material.dart';
import 'package:flutter_sparkline/flutter_sparkline.dart';

import 'package:toro_desafio/models/Cotacao.dart';

class CotacaoItemCard extends StatelessWidget {
  final Cotacao cotacaoItem;

  CotacaoItemCard({@required this.cotacaoItem});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white30,
      child: Container(
        child: Padding(
          padding: EdgeInsets.all(8),
          child: Column(
            children: <Widget>[
              Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    GetNomeCotacao(),
                    GetGrafico(),
                    GetCotacaoValor(),
                    //stockDifference(stock),
                  ]),

              //stockGraph3(stock)
            ],
          ),
        ),
      ),
    );
  }

  Widget GetNomeCotacao() {
    return Padding(
      padding: EdgeInsets.only(left: 20),
      child: Column(
        children: <Widget>[
          Text(
            cotacaoItem.nome.toString(),
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 25,
              color: Colors.white,
            ),
          ),
          Text(
            cotacaoItem.GetValorAbertura(),
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 15,
              color: Colors.white,
            ),
          ),
          Text(
            'atualizado: '+DateTime.now().difference(cotacaoItem.data).inSeconds.toString()+' s',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 15,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }

  Widget GetCotacaoValor() {
    return Padding(
      padding: EdgeInsets.only(left: 20),
      child: Column(
        children: <Widget>[
      Container(

      width: 110,
      alignment: Alignment(0.0, 0.0),
      child:
          Text(
            cotacaoItem.valor.toString(),
            style: TextStyle(
              fontSize: 22,
              color: Colors.white,
            ),
          ),),
          Container(
            color: cotacaoItem.GetColor(),
            width: 110,
            alignment: Alignment(0.0, 0.0),
            child: Text(
              cotacaoItem.GetPercentualFormatado(),
              style: TextStyle(
                fontSize: 22,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget GetGrafico() {
    return Container(
      child: Container(
        color: Colors.transparent,
        height: 50,
        width: 100,
        child: Sparkline(
          data: cotacaoItem.GetHistoricoDeCotacao(),
          pointsMode: PointsMode.last,
          lineColor: cotacaoItem.GetColor(),
          pointSize: 4.0,
          pointColor: Colors.amber,
        ),
      ),
    );
  }
}
