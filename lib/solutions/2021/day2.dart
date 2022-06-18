import 'dart:async';

import '../../utils/input.dart';

void main() {
  List<dynamic> lines = getLines();

  part1(lines);
  part2(lines);
}

List<dynamic> getLines() {
  List<dynamic> lines = readLinesAsString(2);

  // removing falsey values
  lines.removeWhere((x) => ["", null, false, 0].contains(x));

  return lines.map((x) => x = x.split(" ")).toList();
}

void part1(List<dynamic> lines) {
  int hPosition = 0;
  int depth = 0;

  for (int i = 0; i < lines.length; i++) {
    if (lines[i][0] == 'forward')
      hPosition += int.parse(lines[i][1]);
    else if (lines[i][0] == 'down')
      depth += int.parse(lines[i][1]);
    else if (lines[i][0] == 'up') depth -= int.parse(lines[i][1]);
  }

  print('Answer part 1: ' + (hPosition * depth).toString());
}

void part2(List<dynamic> lines) {
  int hPosition = 0;
  int aim = 0;
  int depth = 0;

  for (int i = 0; i < lines.length; i++) {
    if (lines[i][0] == 'forward') {
      hPosition += int.parse(lines[i][1]);
      depth += aim * int.parse(lines[i][1]);
    } else if (lines[i][0] == 'down')
      aim += int.parse(lines[i][1]);
    else if (lines[i][0] == 'up') aim -= int.parse(lines[i][1]);
  }

  print('Answer part 2: ' + (hPosition * depth).toString());
}
