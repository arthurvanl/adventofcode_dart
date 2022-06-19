import 'package:adventofcode/utils/input.dart';

void main() {
  List<String> lines = getLines();

  part1(lines);
  part2(lines);
}

List<String> getLines() {
  List<String> lines = readLinesAsString(3, 2021);

  // removing falsey values
  lines.removeWhere((x) => ["", null, false, 0].contains(x));

  // parsing values to int
  return lines.toList();
}

void part1(List<dynamic> lines) {
  var array = List<dynamic>.filled(0, 0, growable: true);

  for (int i = 0; i < lines[0].length; i++) {
    array.add(List<dynamic>.filled(0, 0, growable: true));
  }

  for (int i = 0; i < lines.length; i++) {
    int index = 0;
    for (var bit in lines[i].toString().split("")) {
      array[index]?.add(bit);
      index++;
    }
  }
  String gammaRate = '';
  String epsilonRate = '';

  for (int i = 0; i < lines[0].length; i++) {
    int zeros = 0;
    int ones = 0;

    for (int j = 0; j < array[i].length; j++)
      if (array[i][j] == '0')
        zeros++;
      else
        ones++;

    if (ones > zeros) {
      gammaRate += '1';
      epsilonRate += '0';
    } else if (ones < zeros) {
      gammaRate += '0';
      epsilonRate += '1';
    }
  }

  int powerComsumption =
      int.parse(gammaRate, radix: 2) * int.parse(epsilonRate, radix: 2);

  print("Answer part 1: $powerComsumption");
}

void part2(lines) {}
