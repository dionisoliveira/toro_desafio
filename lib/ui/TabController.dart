import 'package:flutter/material.dart';
import 'package:toro_desafio/ui/CotacaoMaioresAltasPage.dart';
import 'package:toro_desafio/ui/main.dart';




void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            bottom: TabBar(
              tabs: [
                Tab(icon: Icon(Icons.av_timer)),
                Tab(icon: Icon(Icons.av_timer)),

              ],
            ),
            title: Text('Toro desafio'),
          ),
          body: TabBarView(
            children: [
              CotacaoBasePage(),
              CotacaoMaioresAltasPage(),

            ],
          ),
        ),
      ),
    );
  }
}