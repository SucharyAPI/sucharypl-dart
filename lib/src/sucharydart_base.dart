import "package:http/http.dart" as http;
import "dart:convert";

// Kategorie
enum Kategoria {
  domyslny(''),
  programowanie('programowanie'),
  dwuznaczne('dwuznaczne'),
  szkolne('suchary'),
  suchary('suchary'),
  wulgarne('wulgarne'),
  czarnyhumor('czarnyhumor'),
  inne('inne');

  final String wartosc;
  const Kategoria(this.wartosc);
}

// Customowe błędy
abstract class SucharyError implements Exception {
  final String tresc;
  SucharyError(this.tresc);
}

class ConnectionError extends SucharyError {
  ConnectionError(String tresc) : super('Problemy z siecią: $tresc');
}

class APIError extends SucharyError {
  final int kod;
  APIError(this.kod, String tresc) : super('Serwer zwrócił kod $kod: $tresc');
}

class JSONError extends SucharyError {
  JSONError(String tresc) : super('Błąd dekodowania danych: $tresc');
}

// Funkcja główna
Future<String> dajKawal({Kategoria kategoria = Kategoria.domyslny}) async {
  String adres = "https://sucharyapi.onrender.com";
  if (kategoria != Kategoria.domyslny) {
  adres = "https://sucharyapi.onrender.com/${kategoria.wartosc}";
  }
  try {
    final odpAPI = await http.get(Uri.parse(adres));
    if (odpAPI.statusCode != 200) {
      throw APIError(odpAPI.statusCode, "Nie udało się pobrać suchara");
    } else {
      final dane = jsonDecode(odpAPI.body);
      final zart = dane['tresc'];
      if (zart == null) {
        throw JSONError("Błąd odpowiedzi serwera");
      }
      return zart;
    }
  } on http.ClientException catch (e) {
    throw ConnectionError("Błąd połączenia HTTP: $e");
  } catch (e) {
    if (e is SucharyError) {
      rethrow;
    }
    throw ConnectionError("Błąd połączenia: $e");
  }
}