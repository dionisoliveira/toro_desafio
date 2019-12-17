

import 'package:flutter/material.dart';
import 'package:toro_desafio/models/Cotacao.dart';
import 'package:toro_desafio/models/CotacaoListExtend.dart';
import 'package:toro_desafio/ui/CotacaoList.dart';
import 'package:web_socket_channel/io.dart';
import 'package:web_socket_channel/status.dart' as status;
import 'dart:convert';





class CotacaoBasePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.blue),
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

  static CotacaoListExtend cotacaoList = new CotacaoListExtend();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(8),
        child: Column(
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
                    return Center(
                        child: Text('Aguarde.......'));
                  } else {
                    var novacotacao =
                    Cotacao.fromJson(jsonDecode(snapshot.data));

                    cotacaoList.add(novacotacao);
                    SortAndFilterList(cotacaoList);
                  }

                  return CotacaoList(cotacao: cotacaoList.take(5).toList() );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
  @override
  void SortAndFilterList(CotacaoListExtend cotacaoList) {
    cotacaoList.sort((a, b)=> b.percentual.compareTo(a.percentual));

    Future.delayed(const Duration(milliseconds: 2), () {

    });
  }

  @override
  void dispose() {
    channel.sink.close(status.goingAway);
    super.dispose();
  }


}