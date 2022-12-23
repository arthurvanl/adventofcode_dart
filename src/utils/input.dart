import 'dart:io';

// Get input List<String>
String readLinesAsString(int day, int year) =>
    File(getFilePath(day, year)).readAsStringSync();

// Get input file path
String getFilePath(int day, int year) => "./assets/inputs/$year/day$day.txt";
