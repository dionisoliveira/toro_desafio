# Desafio Mobile
<table>
  <thread>
    <th>Baixa </th>
  </thread>  
  <thread>
    <th>Alta</th>
  </thread>  
  <tbody>
<tr>
    <td><img src="https://user-images.githubusercontent.com/11008585/71060867-72c20780-2145-11ea-8609-51e16f2f4c5d.png"     alt="Example" width="200" height="450"></td>

   
<td><img src="https://user-images.githubusercontent.com/11008585/71061037-dea47000-2145-11ea-8f57-7c2ec170cff6.png" alt="Example" width="200" height="450"></td>
       </tr>
 </table>
 <img src="https://user-images.githubusercontent.com/11008585/71063668-f5e65c00-214b-11ea-9125-e29fe376d19a.gif" alt="Example" width="200" height="450">


Flutter 
  Dependências necessárias.
  
  cupertino_icons: ^0.1.2

  #adicionar websocket
  web_socket_channel: "^1.0.8"
  

  #adicionar gráfico de linha
  flutter_sparkline: "^0.1.0"
  
  #formatar para currency
  intl: "^0.15.8"

Detalhes:
CotacaoListExtend é criada através do inicializador Initialize, que controla o objeto singleton para a listView, com isto a lista passa a ser compartilhada entre a tela de Baixas e Altas mantendo atualizado os dados da tela quando a mesma não esta no foco da aplicação.

Padrão BLoC não foi utilizado na brench master.



## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)

For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
