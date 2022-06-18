import 'dart:io';

// Get input List<String>
List<String> readLinesAsString(int day, int year) =>
    File(getFilePath(day, year)).readAsLinesSync();

// Get input file path
String getFilePath(int day, int year) => "./assets/inputs/$year/day$day.txt";