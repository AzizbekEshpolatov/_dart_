void main() {
  List<int> numbers = [2, 3, 4, 5];

  /// * Iterator *
  /// Iterator – bu kolleksiya (List, Set, Map.values) elementlari ustida
  /// bosqichma-bosqich yurish uchun ishlatiladigan maxsus mexanizm.
  /// Iterator – bu ko‘rsatkich,har safar moveNext qilib keyingi elementga
  /// o'tkazsak boladi. Va current hozirgi elementni korsatadi.
  Iterator<int> iterator = numbers.iterator;
  while (iterator.moveNext()) {
    print(iterator.current);
  }

  /// * firstOrNull *
  /// birinchi element null bolsa null, mavjud bolsa [0]-> qiymatni qaytaradi
  print(numbers.firstOrNull);

  /// first-dan fari Expection bermaydi yani firstda expection beradi.

  /// * Iterable<(int, T)> indexed *
  for (var (i, v) in numbers.indexed) {
    print("$i-index va qiymat:$v");
  }

  /// Bu metod har bir elementni o‘zining indeks raqami bilan birga qaytaradi.

  /// * Iterable<T> nonNulls *
  /// List yoki Set ichida null lar bo‘lishi mumkin.
  /// nonNulls esa faqat null bo‘lmaganlarini olib beradi.
  List<int?> numbers1 = [1, null, 2, null, 3];
  print(numbers1.nonNulls.toList()); // (1, 2, 3)

  /// * singleOrNull *
  // List (yoki Set) faqat bitta elementga ega bo‘lsa, o‘sha elementni qaytaradi.
  // Agar bo‘sh bo‘lsa yoki 2 ta va undan ko‘p element bo‘lsa, null qaytaradi.
  // ✅ single – bo‘sh yoki 2 va undan ko‘p element bo‘lsa, Exception beradi,
  // ✅ singleOrNull – bo‘sh bo‘lsa yoki 2 tadan ko‘p bo‘lsa, null qaytaradi.

  /// * getRange *
  /// Listdagi elementlarning start va end indexlari orasidagi qismini
  /// (subrange) qaytaradi.
  print(numbers.getRange(1, 4));

  /// * List<T> castFrom<S, T>(List<S> source) *
  /// Bitta turdagi Listni boshqa turga o‘tkazadi (casting).
  List<int> intList = [1, 2, 3];
  List<num> numList = List.castFrom<int, num>(intList);
  print(numList); // [1, 2, 3]

  /// * List<E> filled(int length, E fill, {bool growable = false}) *
  /// Berilgan uzunlikdagi List yaratadi va barcha elementlarini bitta qiymat
  /// bilan to‘ldiradi.

  var ls = List.filled(5, 0);
  print(ls);
  // var list = List.filled(5, 'hello');
  // print(list); // [hello, hello, hello, hello, hello]
  var list = List.filled(3, 'a', growable: true);
  list.add('b');
  print(list); // [a, a, a, b]
  /// ❌ Growable = false bo‘lsa qo‘shib bo‘lmaydi:

  /// * unmodifiable *
  /// Berilgan Iterable asosida o‘zgartirib bo‘lmaydigan (read-only) List
  /// yaratadi.
  var list1 = List.unmodifiable([1, 2, 3]);
  print(list1); // [1, 2, 3]
}
