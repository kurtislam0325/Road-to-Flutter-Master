import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

void main() => runApp(XylophoneApp());

class XylophoneApp extends StatefulWidget {
  const XylophoneApp({super.key});

  @override
  State<XylophoneApp> createState() => _XylophoneAppState();
}

class _XylophoneAppState extends State<XylophoneApp> {
  final player = AudioPlayer();

  void playSound(int num) {
    player.stop();
    player.play(AssetSource('note$num.wav'));
  }

  Expanded buildKey(Color color, int num) {
    return Expanded(
      child: TextButton(
        style: TextButton.styleFrom(
            backgroundColor: color,
        ),
        onPressed: () {
          playSound(num);
        },
        child: Text(''),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              buildKey(Colors.red,  1),  
              buildKey(Colors.orange,  2),  
              buildKey(Colors.yellow,  3),  
              buildKey(Colors.lime,  4),  
              buildKey(Colors.green,  5),  
              buildKey(Colors.blue,  6),  
              buildKey(Colors.purple,  7),                                                                                                           
            ]
          ),
        ),
      ),
    );
  }
}
