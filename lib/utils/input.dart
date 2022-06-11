import 'dart:io';

// Get input List<String>
List<String> readLinesAsString(int day) =>
    File(getFilePath(day)).readAsLinesSync();

// Get input file path
String getFilePath(int day) => "./assets/inputs/day$day.txt";