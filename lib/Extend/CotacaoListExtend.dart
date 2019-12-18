import 'dart:collection';

import 'package:toro_desafio/models/Cotacao.dart';

class CotacaoListExtend extends ListBase<Cotacao> {
  static CotacaoListExtend listExtend;

  final  List<Cotacao> l = [];
  final  List<Cotacao> updateLists = []; //Cache da cotação - não permite replicar cotação já adicionada na lista.
  CotacaoListExtend();

  //Criado objeto Singleton para suportar compartilhamento do mesmo objeto entre duas telas.
  static CotacaoListExtend Initialize()
  {
    if(listExtend == null) {
      listExtend = new CotacaoListExtend();
      return listExtend;
    }
    else

      {
        return listExtend;
      }

  }
  void set length(int newLength) {
    l.length = newLength;
  }

  int get length => l.length;
  Cotacao operator [](int index) => l[index];
  void operator []=(int index, Cotacao value) {
    l[index] = value;
  }

  @override
  void add(Cotacao element) {

    var updateList = updateLists.where((p) => p.nome == element.nome);

    if (updateList.length > 0) {
      //Refatorar:Adicionar esta regra dentro do objeto cotacao.Dart.
      var valor = element.valor.toDouble();

      var ultimaCotacao = updateList.first.aberturaCotacao.toDouble();

      updateList.first.dataUltimaAtualizacao =
          dataUltimaAtualizacao(updateList.first.data);
      updateList.first.nome = element.nome;
      updateList.first.data = DateTime.now();
      updateList.first.valor = element.valor;

      updateList.first.percentual =
          calcularVariacaoDaAcao(ultimaCotacao, valor);
      updateList.first.cotacaoCache.add(element);
    } else {
      updateLists.add(element);
      super.add(element);
    }
  }

  int dataUltimaAtualizacao(DateTime ultimaData) {
    return DateTime.now().difference(ultimaData).inSeconds;
  }

  double calcularVariacaoDaAcao(double ultimaCotacao, double valor) {
    //Aplica o calculo da variação
    if (valor == 0 || ultimaCotacao == 0) return 0;
    var percentual = ((ultimaCotacao - valor) * 100 / valor) * -1;
    return percentual;
  }


  //Top 10 de altas
  List<Cotacao> getUltimasAltas()
  {
    //Adiciona somente itens necessários para ordenação de alta
    var listDeAltas =this.updateLists.where((p)=>p.percentual > 0).toList();
    listDeAltas.sort((a, b) => b.percentual.compareTo(a.percentual));
    return listDeAltas.take(10).toList();
  }

  //Top 10 de baixas
  List<Cotacao> getUltimasBaixas()
  {
    //Adiciona somente itens necessários para ordenação de baixa
    var listDeBaixas =this.updateLists.where((p)=>p.percentual < 0).toList();

    listDeBaixas.sort((a, b) => a.percentual.compareTo(b.percentual));
    return listDeBaixas.where((p)=>p.percentual < 0 ).take(10).toList();
  }

  //Top 10 de baixas
  List<Cotacao> getTodasCotacoes()
  {
    //Adiciona somente itens necessários para ordenação de baixa
    var todosList =this.updateLists.toList();

    todosList.sort((a, b) => a.percentual.compareTo(b.percentual));
    return todosList.toList();
  }


}
