import 'package:sucharydart/sucharydart.dart';

void main() async {
  print('--- TESTUJEMY SUCHARYDART --- \n');

  try {
    // 1. Pobieranie losowego suchara bez kategorii
    print('Pobieram losowy suchar...');
    final losowy = await dajKawal();
    print('Suchar: $losowy\n');

    // 2. Pobieranie suchara z konkretnej kategorii
    print('Pobieram suchar sucharowy...');
    final programistyczny = await dajKawal(kategoria: Kategoria.suchary);
    print('Suchar IT: $programistyczny\n');

    // 3. Pobieranie wiele sucharów
    print("Pobieram wiele sucharów...");
    final suchary = await wieleKawalow(ilosc: 3);
    print(suchary);
    suchary.forEach(print);
    print("\n");

    // 4. Pobieranie masakry
    print("Pobieram masakrę...");
    final m = await masakra();
    print(m);
    print("\n");

    // 5. Pobieranie wielu masakr
    print("Pobieram wiele masakr...");
    final masakry = await wieleMasakr(ilosc: 3);
    print(masakry);
    masakry.forEach(print);

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