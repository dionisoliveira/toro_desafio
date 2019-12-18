


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

bool aplicarDarkMode =true ;

class CoresAplicacao
{
   Color backgroundPercentualCotacaoPositiva;
   Color backgroundPercentualCotacaoNegativa;
   Color textpercentualCotacaoPositiva;
   Color textpercentualCotacaoNegativa;
   Color backgroundColor;
   Color backgroundColorList;
   static CoresAplicacao Singleton;

 void Initalize()
{
  if(aplicarDarkMode)
    {
      backgroundPercentualCotacaoPositiva =Color.fromRGBO(44, 210, 11, 1);
      backgroundPercentualCotacaoNegativa = Colors.red;
      textpercentualCotacaoPositiva = Colors.white;
      textpercentualCotacaoNegativa = Colors.white;
      backgroundColor = Colors.black;
      backgroundColorList = Colors.black26;
    }
    else
    {
      backgroundPercentualCotacaoPositiva =Color.fromRGBO(44, 210, 11, 1);
      backgroundPercentualCotacaoNegativa = Colors.red;
      textpercentualCotacaoPositiva = Colors.black;
      textpercentualCotacaoNegativa = Colors.black;
      backgroundColor = Colors.transparent;
      backgroundColorList = Colors.transparent;
    }
  Singleton = this;

}

}