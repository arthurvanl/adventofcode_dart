import '../../utils/input.dart';

void main() {
  List<List<String>> lines = parseInput();

  final before = DateTime.now();

  part1(lines);
  part2(lines);

  print("Code runned in ${DateTime.now().millisecond - before.millisecond}ms");
}

List<List<String>> parseInput() {
  return readLinesAsString(2, 2022)
      .trim()
      .replaceAll(RegExp(r'\r'), '')
      .split('\n')
      .map((x) => x.split(' ').toList())
      .toList();
}

void part1(List<dynamic> lines) {
  int score = 0;
  const moves = [
    {"score": 1, "A": 3, "B": 0, "C": 6}, // X
    {"score": 2, "A": 6, "B": 3, "C": 0}, // Y
    {"score": 3, "A": 0, "B": 6, "C": 3} // Z
  ];

  for (int i = 0; i < lines.length; i++) {
    switch (lines[i][1]) {
      case 'X':
        score += moves[0]["score"]! + moves[0][lines[i][0]]!;
        break;
      case 'Y':
        score += moves[1]["score"]! + moves[1][lines[i][0]]!;
        break;
      case 'Z':
        score += moves[2]["score"]! + moves[2][lines[i][0]]!;
        break;
    }
  }

  print("Part 1: ${score}");
}

void part2(dynamic lines) {
  int score = 0;

  const moves_pc = [
    {"X": 3, "Y": 1, "Z": 2}, // A
    {"X": 1, "Y": 2, "Z": 3}, // B
    {"X": 2, "Y": 3, "Z": 1} // C
  ];

  const scores = {"X": 0, "Y": 3, "Z": 6};

  for (int i = 0; i < lines.length; i++) {
    switch (lines[i][0]) {
      case 'A':
        score += moves_pc[0][lines[i][1]]! + scores[lines[i][1]]!;
        break;
      case 'B':
        score += moves_pc[1][lines[i][1]]! + scores[lines[i][1]]!;
        break;
      case 'C':
        score += moves_pc[2][lines[i][1]]! + scores[lines[i][1]]!;
        break;
    }
  }

  print("Part 2: ${score}");
}
