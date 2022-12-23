import '../../utils/input.dart';

void main() {
  List<dynamic> lines = getLines();

  part1(lines);
  part2(lines);
}

List<dynamic> getLines() {
  List<dynamic> lines = readLinesAsString(1, 2021).split("\n").toList();
  lines.removeWhere((x) => ["", null, false, 0].contains(x));

  // parsing values to int
  return lines.map((x) => int.parse(x)).toList();
}

void part1(List<dynamic> lines) {
  int counter = -1;
  int prev = -1;

  for (int i = 0; i < lines.length; i++) {
    if (prev < lines[i]) counter++;

    prev = lines[i];
  }

  print('Answer part 1: $counter');
}

void part2(List<dynamic> lines) {
  int counter = -1;
  int prev = -1;

  for (int i = 2; i < lines.length; i++) {
    int curr = lines[i - 2] + lines[i - 1] + lines[i];

    if (curr > prev) counter++;

    prev = curr;
  }

  print('Answer part 2: $counter');
}
