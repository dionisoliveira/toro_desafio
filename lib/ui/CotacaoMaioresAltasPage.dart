

import 'package:flutter/material.dart';
import 'package:toro_desafio/models/Cotacao.dart';
import 'package:toro_desafio/models/CotacaoListExtend.dart';
import 'package:toro_desafio/ui/CotacaoList.dart';
import 'package:toro_desafio/ui/main.dart';
import 'package:web_socket_channel/io.dart';
import 'package:web_socket_channel/status.dart' as status;
import 'dart:convert';





class CotacaoMaioresAltasPage extends CotacaoBasePage {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: HomeScreens(),
    );
  }
}

  class HomeScreens extends HomeScreen {

    @override
    void SortAndFilterList(CotacaoListExtend cotacaoListExtend) {
      cotacaoListExtend.sort((a, b)=> b.percentual.compareTo(a.percentual));

      Future.delayed(const Duration(milliseconds: 2), () {

      });
    }

  }






