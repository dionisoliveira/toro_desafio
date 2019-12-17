import 'package:web_socket_channel/io.dart';
import 'package:web_socket_channel/status.dart' as status;

class WebSocketReceiver {
  void startSocket() async {
    final channel = await IOWebSocketChannel.connect(
        'ws://localhost:8080/quotes');

    channel.stream.listen((message) {
      channel.sink.add('received!');
      channel.sink.close(status.goingAway);
    });
  }
}