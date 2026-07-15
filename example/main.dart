import 'package:sucharydart/sucharydart.dart';

void main() async {
  print('--- TESTUJEMY SUCHARYDART --- \n');

  try {
    // 1. Pobieranie losowego suchara bez kategorii
    print('Pobieram losowy suchar...');
    final losowy = await dajKawal();
    print('Suchar: $losowy\n');

    // 2. Pobieranie suchara z konkretnej kategorii
    print('Pobieram suchar programistyczny...');
    final programistyczny = await dajKawal(kategoria: Kategoria.programowanie);
    print('Suchar IT: $programistyczny\n');

  } on ConnectionError catch (e) {
    print('Błąd sieci: ${e.tresc}');
  } on APIError catch (e) {
    print('Błąd API (Kod ${e.kod}): ${e.tresc}');
  } on JSONError catch (e) {
    print('Błąd formatu danych: ${e.tresc}');
  } catch (e) {
    print('Inny nieoczekiwany błąd: $e');
  }
}