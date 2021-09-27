import 'package:bot_dart/bot_dart.dart' as bot_dart;

import 'dart:io' show Platform;
// import 'dart:io' as io;

import 'package:teledart/teledart.dart';
import 'package:teledart/telegram.dart';
import 'package:teledart/model.dart';

void main(List<String> arguments) {
  var teledart = TeleDart(
      Telegram("1101950025:AAE3XStkYEVTa_l6MaIeT5pqh0CKDkJh3zU"), Event());
  teledart.start().then((me) => print('${me.username} is rolled up'));

  teledart.onCommand('hello').listen((message) {
    teledart.replyMessage(message, 'halo saya bot di bangun dengan dart');
  });

  // You can even filter streams with stream processing methods
  // See: https://www.dartlang.org/tutorials/language/streams#methods-that-modify-a-stream
  teledart
      .onMessage(keyword: 'dart')
      .where((message) => message.text.contains('telegram'))
      .listen((message) => teledart.replyPhoto(
          message,
          //  io.File('example/dash_paper_plane.png'),
          'https://raw.githubusercontent.com/DinoLeung/TeleDart/master/example/dash_paper_plane.png',
          caption: 'This is how Dash found the paper plane'));
}
