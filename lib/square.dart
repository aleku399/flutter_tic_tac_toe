import 'package:flutter/material.dart';

class Square extends StatelessWidget {
    Square({super.key, required this.squareClick, required this.text});

    VoidCallback squareClick;
    String text;

    @override
    Widget build(BuildContext context) {
        return Expanded(
            child: TextButton(
                style: TextButton.styleFrom(
                textStyle: const TextStyle(fontSize: 50),
                ),
                onPressed: squareClick,
                child: Text(text),
            ), 
        );
    }
}
