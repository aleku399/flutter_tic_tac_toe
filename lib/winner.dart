class Winner {
    Winner({required this.squares});

    final List<String?> squares;

    List<List<int>> lines = [
        [0, 1, 2],
        [3, 4, 5],
        [6, 7, 8],
        [0, 3, 6],
        [1, 4, 7],
        [2, 5, 8],
        [0, 4, 8],
        [2, 4, 6],
    ];

    String? calculateWinner() {
        for (var i = 0; i < lines.length; i++) {
            final a = lines[i][0];
            final b = lines[i][1];
            final c = lines[i][2];

            if (squares[a]  != null && 
                squares[a] == squares[b] && 
                squares[a] == squares[c]) {
                return squares[a];
            }
        }

        return null;
    }
}