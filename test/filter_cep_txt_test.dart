import 'package:filter_cep_txt/filter_cep_txt.dart';
import 'package:test/test.dart';

void main() {
  test('filter cep', () async {
    final result = await FilterCepTxt().filterCep();
    expect(result, isA<List<String?>>());
    expect(result.isEmpty, false);
  });
}
