import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  return runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.blue[200],
        appBar: AppBar(
          title: Text("Ask Me Anything"),
          backgroundColor: Colors.blue,
        ),
        body: magic8Ball(),
      )
    )
  );
}

class magic8Ball extends StatefulWidget {
  const magic8Ball({super.key});

  @override
  State<magic8Ball> createState() => _magic8BallState();
}

class _magic8BallState extends State<magic8Ball> {

  int ansNumber = 1;

  void changeAns() {
    ansNumber = Random().nextInt(5) + 1;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        children: [
          Expanded(
            child: TextButton(
              child: Image(
                image: AssetImage('images/ball$ansNumber.png'),
              ),
              onPressed: () {
                setState(() {
                  changeAns();
                });
              },
            ),
          ),
        ],
      )
    );
  }
}