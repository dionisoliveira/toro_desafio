import 'package:flutter/material.dart';
import 'package:toro_desafio/Const/ConstColor.dart';
import 'package:toro_desafio/Extend/CotacaoListExtend.dart';
import 'package:toro_desafio/models/Cotacao.dart';
import 'package:toro_desafio/ui/List/CotacaoList.dart';
import 'package:web_socket_channel/io.dart';
import 'package:web_socket_channel/status.dart' as status;
import 'dart:convert';


class CotacaoPageTodos extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(


      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final IOWebSocketChannel channel =
  IOWebSocketChannel.connect('ws://localhost:8080/quotes');
  var init = new CoresAplicacao().Initalize();

  //Inicializa lista customizada singleton
  CotacaoListExtend cotacaoList =  CotacaoListExtend.Initialize();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CoresAplicacao.Singleton.backgroundColor,
      body: Container(
          padding: EdgeInsets.all(8),
          child:

          GetContentColunm()

      ),
    );
  }

  Column GetContentColunm()
  {
    return Column(
      children: <Widget>[
        Expanded(
          flex: 9,
          child: StreamBuilder(
            stream: channel.stream,
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return Center(child: Text(snapshot.error.toString()));
              }

              if (snapshot.data == null) {
                return Center(child: Text('Aguarde.......'));
              } else {
                var novacotacao =
                Cotacao.fromJson(jsonDecode(snapshot.data));

                cotacaoList.add(novacotacao);

              }

              return CotacaoList(cotacao: cotacaoList.getTodasCotacoes());
            },
          ),
        ),
      ],
    );
  }




  @override
  void dispose() {
    channel.sink.close(status.goingAway);
    super.dispose();
  }
}
