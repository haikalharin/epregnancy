import 'dart:async';
import 'dart:convert';

import 'package:PregnancyApp/env.dart';
import 'package:flutter/material.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

/// Manages opening and closing the sockets for the
/// two different sockets: ETH socker and BTC socket
class WebSocketChatChannel {
  late final WebSocketChannel chatWebSocket;
  String? userId;

  WebSocketChatChannel(this.userId)
      : chatWebSocket = WebSocketChannel.connect(
    Uri.parse('ws://${environment['host']}$userId'),
  );

  void connect(String? userIdParam){
    print('connection websocket');
    chatWebSocket = WebSocketChannel.connect(Uri.parse('ws://${environment['host']}$userIdParam'));
    chatWebSocket.stream.listen(
            (msg) {
          //process msg
          print('websocket listerner : $msg');
        }
    );
  }

  void closeChannel() {
    chatWebSocket.sink.close();
  }
}