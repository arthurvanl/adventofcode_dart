import 'dart:math';

import '../../utils/input.dart';

void main() {
  List<int> lines = getLines();

  part1(lines);
  part2(lines);
}

List<int> getLines() {
  return readLinesAsString(2, 2022)
      .trim()
      .replaceAll(RegExp(r'\r'), '')
      .split("\n\n")
      .map(
          (x) => x.split('\n').map((y) => int.parse(y)).reduce((a, b) => a + b))
      .toList();
}

void part1(List<int> lines) {
  print("Part 1: ${lines.reduce(max)}");
}

void part2(List<int> lines) {
  List<int> topElfes = [];

  for (int i = 0; i < 3; i++) {
    int topElf = lines.reduce(max);
    int index = lines.indexOf(topElf);
    lines.removeAt(index);

    topElfes.add(topElf);
  }

  print("Part 2: ${topElfes.reduce((a, b) => a + b)}");
}
