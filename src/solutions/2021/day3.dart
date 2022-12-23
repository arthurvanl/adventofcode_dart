import '../../utils/input.dart';

void main() {
  List<String> lines = getLines();

  part1(lines);
  part2(lines);
}

List<String> getLines() {
  List<String> lines = readLinesAsString(1, 2021).split("\n").toList();
  lines.removeWhere((x) => ["", null, false, 0].contains(x));

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

void part2(lines) {
  List<String> o2_array = lines;

  List<String> co2_array = lines;

  for (int i = 0; i < o2_array[0].length; i++) {
    var zeros = o2_array.where((x) => x[i] == '0').toList();
    var ones = o2_array.where((x) => x[i] == '1').toList();

    if (zeros.length > ones.length)
      o2_array = zeros;
    else if (ones.length > zeros.length)
      o2_array = ones;
    else if (ones.length == zeros.length) o2_array = ones;

    if (o2_array.length == 1) i = o2_array[0].length;
  }

  int o2_gen = int.parse(o2_array[0], radix: 2);

  for (int i = 0; i < co2_array[0].length; i++) {
    var zeros = co2_array.where((x) => x[i] == '0').toList();
    var ones = co2_array.where((x) => x[i] == '1').toList();

    if (zeros.length < ones.length)
      co2_array = zeros;
    else if (ones.length < zeros.length)
      co2_array = ones;
    else if (ones.length == zeros.length) co2_array = zeros;

    if (co2_array.length == 1) i = co2_array[0].length;
  }

  int co2_scrub = int.parse(co2_array[0], radix: 2);
  int lifeSupportRate = (o2_gen * co2_scrub);

  print("Answer part 2: $lifeSupportRate");
}
