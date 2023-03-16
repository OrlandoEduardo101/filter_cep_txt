import 'dart:convert';
import 'dart:io';

class FilterCepTxt {
  List<String?> filterCep() {
    final file = File('ceps.txt');
    final text = file.readAsStringSync();

    final cepPattern = RegExp(r'\b\d{5}-\d{3}\b');
    final ceps = cepPattern.allMatches(text).map((match) => match.group(0)).toList();

    print(jsonEncode(ceps));
    return ceps;
  }
}
