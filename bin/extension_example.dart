/// * extension dart docs *
/// Extension bu mavjud classlarga yoki type-larga qoshimcha funksionallik
/// qoshish imkonini beruvchi vosita.
/// Asl class ozgarmaydi va qoshimcha funksionallik qoshish mumkin boladi.

void main() {
  final text = 'dart extension advanced';
  print(text.capitalizeEachWord());
  print(text.wordCount);
  print('example@gmail.com'.isValidEmail);

  final items = [1, 2, 3, 2, 1, 4];
  print(items.distinct);

  final grouped = items.groupBy((e) => e.isEven ? 'even' : 'odd');
  print(grouped);
}

// * Iterable uchun extension *
extension AdvancedStringExtensions<T> on Iterable<T> {
  // Takrorlanuvchi elementlarni olib tashlash
  Iterable<T> get distinct => toSet().toList();

// Elementlarni berilgan funksiyaga ko'ra guruhlash

  Map<K, List<T>> groupBy<K>(K Function(T) keySelector) {
    final map = <K, List<T>>{};
    for (var element in this) {
      final key = keySelector(element);
      map.putIfAbsent(key, () => []).add(element);
    }
    return map;
  }
}

// * String type uchun qoshimcha extension *
extension StringAdvancedExtension on String {
  // matndagi barcha sozning bosh harfini katta qilish.
  String capitalizeEachWord() => split(' ')
      .map((e) => e.isEmpty ? e : e[0].toUpperCase() + e.substring(1))
      .join(' ');

  // sozlarning sonini sanash
  int get wordCount => trim().split(RegExp(r"\s+")).length;

  // email validatsiyasini tekshirish
  bool get isValidEmail =>
      RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}\$')
          .hasMatch(this);
}
