

import 'package:flutter/material.dart';
import 'package:toro_desafio/Const/ConstColor.dart';

class Cotacao {
  String nome;
  double valor;
  int dataUltimaAtualizacao;
  DateTime data;
  double percentual;
  double aberturaCotacao;
  List<Cotacao> cotacaoCache = new List<Cotacao>();

  String body;

  Cotacao({this.nome, this.data, this.percentual,this.aberturaCotacao,this.valor});

  void atualizaCotacao(Cotacao cotacao)
  {
    this.valor = cotacao.valor;
    this.data = DateTime.now();
  }


  //Converte json map para o objeto cotacão
  factory Cotacao.fromJson(Map<String, dynamic> json) => new Cotacao(
        nome: json.keys.first.toString(),
        valor: double.parse(json.values.first.toString()),
        percentual: 0,
        aberturaCotacao: double.parse(json.values.first.toString()),
        data: DateTime.now());


  //Recuper a cor que deve ser aplicado no backgroundo do percentual e na cor da linha do gráfico
   Color GetColor()
   {
     if(this.percentual == 0)
       return Colors.blue;
     if(this.percentual > 0)
       return  CoresAplicacao.Singleton.backgroundPercentualCotacaoPositiva;
     else if (this.percentual < 0)
       return  CoresAplicacao.Singleton.backgroundPercentualCotacaoNegativa;


   }


   String GetValorAbertura()
   {
     return "Abertura:" + this.aberturaCotacao.toString();
   }

   //Aplicar formatacao no percentual de acordo com a variação
  String GetPercentualFormatado() {
     if(this.percentual == 0)
    return 0.toString();

    return this.percentual > 0
        ? ' + ' + this.percentual.toStringAsFixed(2)
        : ' ' +  this.percentual.toStringAsFixed(2);
  }

  String GetValorFormatado() {
    // var valorFormatadao =NumberFormat.currency(symbol: 'R\$').format(' ${this.valor}');
    return this.valor.toString();
  }

   //Recuperar histórico da cotação e order por data
   List<double> GetHistoricoDeCotacao()
   {

     //Controle para não sobrecarregar a lista do histórico.
     if(cotacaoCache.length >30)
       cotacaoCache.removeAt(0);

     List<double> plotData = cotacaoCache.map((historico) => historico.valor).toList();

     if (plotData.length == 0)
       return [0];

     return plotData;

   }

}