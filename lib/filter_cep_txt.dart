import 'dart:convert';
import 'dart:io';

class FilterCepTxt {
  Future<List<String?>> filterCep() async {
    final text = readFile();

    final cepPattern = RegExp(r'\b\d{5}-\d{3}\b');
    final ceps = cepPattern.allMatches(text).map((match) => match.group(0)).toList();

    await saveFileString(jsonEncode(ceps));
    return ceps;
  }

  String readFile() {
    final file = File('ceps.txt');
    return file.readAsStringSync();
  }

  Future<void> saveFileString(String value) async {
    var file = File('ceps_filtered.txt');
    var sink = file.openWrite();
    sink.write(value);
    await sink.close();
    print(value);
  }
}
