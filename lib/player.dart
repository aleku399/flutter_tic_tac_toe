import 'package:flutter/material.dart';

class Player extends StatelessWidget {
    Player({super.key, required this.text, required this.score});

    String text;
    int score;

    @override
    Widget build(BuildContext context) {
        return Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
                Text(text, style: TextStyle(
                    fontSize: 18,
                )),
                SizedBox(
                    height: 10,
                ),
                Text(score.toString(), style: TextStyle(
                    fontSize: 18,
                )),
            ]
        );
    }
}
