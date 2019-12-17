import 'dart:collection';

import 'package:toro_desafio/models/Cotacao.dart';

class CotacaoListExtend extends ListBase<Cotacao> {
  final List<Cotacao> l = [];
  final List<Cotacao> updateLists = [];//Cache da cotação - não permite replicar cotação já adicionada na lista.
  CotacaoListExtend();

  void set length(int newLength) { l.length = newLength; }
  int get length => l.length;
  Cotacao operator [](int index) => l[index];
  void operator []=(int index, Cotacao value) { l[index] = value; }

@override
void add(Cotacao element) {
    // TODO: implement add
  var updateList =this.updateLists.where((p)=>p.nome == element.nome);
  if(updateList.length > 0)
  {
    var valor =  element.valor.toDouble();

    var ultimaCotacao = updateList.first.ultimaCotacao.toDouble();


    //Aplica o calculo da variação
    double percentual = CalcularVariacaoDaAcao(ultimaCotacao, valor);

    updateList.first.nome = element.nome;
    updateList.first.data = element.data;
    updateList.first.valor = element.valor;

    updateList.first.percentual = percentual;




  }
  else {

    updateLists.add(element);
    super.add(element);
  }

  }


double CalcularVariacaoDaAcao(double ultimaCotacao, double valor) {
   //Aplica o calculo da variação
  var percentual = ( 100 * ( ultimaCotacao - valor)/valor) *-1;
  return percentual;
}

// your custom methods
}