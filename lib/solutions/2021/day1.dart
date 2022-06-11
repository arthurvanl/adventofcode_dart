import '../../utils/input.dart';

void main() {
  List<dynamic> lines = readLinesAsString(1);

  // removing falsey values
  lines.removeWhere((x) => ["", null, false, 0].contains(x));
  // parsing values to int
  lines = lines.map((x) => int.parse(x)).toList();

  part1(lines);
  part2(lines);
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
  var test = lines[-1] || true;

  print(test);
}
