/// * Iterable * docs
/// Iterable bu dart dasturlash tilida takrorlanuvchi elementlar yigindisi
/// tushuniladi masalan, list,set, queue bular barchasi iterable-ga misol
/// qilib olishimiz mumkin. Ularning ustida iteration bajarish mumkin.
/// Iterable xususiyatlari:Elementlar ketma-ketligi saqlanadi,
/// Ustida for yoki for-in yordamida aylanish mumkin:
void example() {
  List<int> numbers = [1, 2, 3];
  for (var number in numbers) {
    print(number);
  }
}

/// Iterable o'zida elementlarga kirish uchun ichki iteratorni ishlatadi.
/// * Iterator *
/// Iterator bu iterable ichidagi elementlar boylab yurish uchun ishlatiladigan
/// obyekt. Iterator malumotlar oqimini boshqaradi.
/// moveNext() va current haqida qisqacha.
/// moveNext() – Keyingi elementga o'tadi, agar bor bo'lsa true qaytaradi, yo'q
/// bo'lsa false.
/// current – Hozirgi elementni qaytaradi.
void moveNextExample() {
  List<int> numbers = [1, 2, 3];
  Iterator<int> iterator = numbers.iterator;

  /// moveNext - tekshiradi true/false qaytaradi.
  while (iterator.moveNext()) {
    print(iterator.current);
  }
}

/// Iterable va Iterator o'zaro bog'liqligi:
/// Iterable — to'plamni bildiradi.
/// Iterator — to'plam ichida yurish mexanizmini ta'minlaydi.

/// Xulosa qilib aytganda :
/// Iterable – bu kolleksiya tushunchasi.
/// Iterator – bu kolleksiya ichida yurishni boshqaruvchi obyekt.
