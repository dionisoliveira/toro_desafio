class Cotacao {
  String nome;
  double valor;

  String data;
  double percentual;
  double ultimaCotacao;


  String body;

  Cotacao({this.nome, this.data, this.percentual,this.ultimaCotacao,this.valor});



  factory Cotacao.fromJson(Map<String, dynamic> json) => new Cotacao(
        nome: json.keys.first.toString(),
        valor: double.parse(json.values.first.toString()),
        percentual: 0,
        ultimaCotacao: double.parse(json.values.first.toString()),
        data: json.keys.last.toString());



}