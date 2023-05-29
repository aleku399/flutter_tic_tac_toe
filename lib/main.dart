import 'package:flutter/material.dart';
import 'package:tic_tac_toe/square.dart';
import 'package:tic_tac_toe/winner.dart';
import 'package:tic_tac_toe/player.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'TIC TAC TOE'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool isNext = true;
  int scoreOne = 0;
  int scoreTwo = 0;
  int scoreTie = 0;
  List<String> _squares = List.generate(9, (i) => "");

  void _squareClick(int i) {
    final winner = Winner(squares: _squares);

    var won = winner.calculateWinner();

  
    if ((won == "X" || won == "O") ||  _squares[i] != "") {
      return;
    }

    var _nextSquares = [..._squares];
    
    if (isNext) {
      _nextSquares[i] = "X";
    } else {
      _nextSquares[i] = "O";
    }

    setState((){
      _squares = _nextSquares;
      isNext = !isNext;
    });

    _checkWinner();
  }

  _checkWinner() {
    final winner = Winner(squares: _squares);
  
    var isXorO = winner.calculateWinner();

    if (isXorO == 'X') {
      setState((){
        scoreOne++;
      });
      _showAlertDialog('Winner', 'Player 1');
    } else if (isXorO == 'O') {
      setState((){
        scoreTwo++;
      });
      _showAlertDialog('Winner', 'Player 2');
    } else if (_squares.every((square) => square != '')) {
      setState((){
        scoreTie++;
      });
      _showAlertDialog('Tie', '');
    } 
  }

  Future<void> _showAlertDialog(String title, String winner) async {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: Text(
            winner == '' ? 
            'Match ended in a Draw' :
            'Winner is ${winner}',
          ),
          actions: <Widget>[
            TextButton(
              child: Text('OK'),
              onPressed: () {
                _newGame();
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void _newGame() {
    setState(() {
      _squares = List.generate(9, (i) => "");
    });
  } 

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        padding: EdgeInsets.all(50),
        height: 500,
        child: Column(
          children: <Widget>[
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Square(
                    squareClick: () => _squareClick(0),
                    text: _squares[0],
                  ),
                  VerticalDivider(
                    width: 1,
                    color: Colors.grey,
                  ),
                  Square(
                    squareClick: () => _squareClick(1),
                    text: _squares[1],
                  ),
                  VerticalDivider(
                    width: 1,
                    color: Colors.grey,
                  ),
                  Square(
                    squareClick: () => _squareClick(2),
                    text: _squares[2],
                  ),
                ],
              ), 
            ),
            Divider(
              height: 0,
              color: Colors.grey,
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Square(
                    squareClick: () => _squareClick(3),
                    text: _squares[3],
                  ),
                  VerticalDivider(
                    width: 1,
                    color: Colors.grey,
                  ),
                  Square(
                    squareClick: () => _squareClick(4),
                    text: _squares[4],
                  ),
                  VerticalDivider(
                    width: 1,
                    color: Colors.grey,
                  ),
                  Square(
                    squareClick: () => _squareClick(5),
                    text: _squares[5],
                  ),
                ],
              ), 
            ),
            Divider(
              height: 0,
              color: Colors.grey,
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Square(
                    squareClick: () => _squareClick(6),
                    text: _squares[6],
                  ),
                  VerticalDivider(
                    width: 1,
                    color: Colors.grey,
                  ),
                  Square(
                    squareClick: () => _squareClick(7),
                    text: _squares[7],
                  ),
                  VerticalDivider(
                    width: 1,
                    color: Colors.grey,
                  ),
                  Square(
                    squareClick: () => _squareClick(8),
                    text: _squares[8],
                  ),
                ],
              ), 
            ),
            SizedBox(
              height: 20
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Player(text: 'Player X', score: scoreOne),
                Player(text: 'Tie', score: scoreTie),
                Player(text: 'Player O', score: scoreTwo),
              ],
            ),
          ]
        ),
      ),
    );
  }
}
