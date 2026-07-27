# SucharyPL - oficjalna biblioteka SucharyAPI dla Dart
Biblioteka Dart do pobierania kawałów z ogólnopolskiej bazy SucharyAPI

[![Dart Version](https://img.shields.io/badge/dart-2.12%2B-blue)](https://dart.dev/)
[![License](https://img.shields.io/badge/license-MIT-green)](LICENSE)

---

## 🚀 Instalacja
### Za pomocą pub
```bash
dart pub add sucharydart
```

### Za pomocą flutter
```bash
flutter pub add sucharydart
```

---

## ⚡ Szybki start
### Pobranie losowego suchara
```dart
import 'package:sucharydart/sucharydart.dart';

void main() async {
  final suchar = await dajKawal();
  print(suchar);
}
```

### Pobranie suchara z konkretnej kategorii
```dart
import 'package:sucharydart/sucharydart.dart';

void main() async {
  final suchar = await dajKawal(kategoria: Kategoria.programowanie);
  print(suchar);
}
```

---

## Kategorie
- `programowanie` - Suchary o programowaniu
- `dwuznaczne` - Suchary dwuznaczne
- `szkolne` - Suchary szkolne
- `suchary` - Suchary ogólne
- `wulgarne` - Suchary wulgarne
- `czarnyhumor` - Czarny humor
- `inne` - Inne kategorie

W kodzie dostępne jako enum Kategoria (zobacz sucharydart_base.dart).

---

## 🛡️ Obsługa błędów

Biblioteka definiuje sformalizowane wyjątki:

- `SucharyError` - bazowy wyjątek
- `ConnectionError` - problemy z połączeniem (HTTP/klient)
- `APIError` - błędy serwera (z kodem HTTP)
- `JSONError` - błąd dekodowania odpowiedzi

### Przykład obsługi błędów
```dart
import 'package:sucharydart/sucharydart.dart';

void main() async {
  try {
    final suchar = await dajKawal(kategoria: Kategoria.programowanie);
    print(suchar);
  } on ConnectionError catch (e){
    print('❌ Błąd połączenia');
  } on APIError catch (e) {
    print('❌ Błąd serwera: ${e.tresc}');
  } on SucharyError catch (e) {
    print('❌ Błąd biblioteki: ${e.tresc}');
  }
}
```

---

## 📡 API

Biblioteka korzysta z oficjalnej bazy SucharyAPI:
🔗 https://sucharyapi.onrender.com

---

## 📝 Licencja

MIT

---
