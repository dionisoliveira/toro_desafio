import 'package:flutter/material.dart';
import 'package:toro_desafio/Const/ConstColor.dart';
import 'package:toro_desafio/ui/CotacaoPageBaixas.dart';

import 'package:toro_desafio/ui/CotacaoPageTop10.dart';
import 'package:toro_desafio/ui/CotatoPageTodos.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      home: DefaultTabController(
        length: 3,

        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.black,
            bottom: TabBar(
              tabs: [
                Tab(icon: Icon(Icons.av_timer),text: 'Altas'),
                Tab(icon: Icon(Icons.av_timer),text: 'Baixas'),
                Tab(icon: Icon(Icons.av_timer),text: 'Todos'),
              ],
            ),
            title: Text('Toro desafio'),
          ),
          body: TabBarView(
            children: [
              CotacaoPageTop10(),
              CotacaoPageBaixas(),
              CotacaoPageTodos()
            ],
          ),
        ),
      ),
    );
  }
}
