import 'dart:async';

/// Memory management with dart!
/// memory management nima va nega muhim eknaligi haqida qisqacha.
/// dart d.tilida xotira avotmatik ravishda tozalanadi GC yordamida
/// GC(Garbage Collector).
/// Ammo natogri kod yozish natijasida Memory Leak yoki ortiqcha xotira
/// ishlatilishi mumkin.
/// Dart’dagi Garbage Collector foydalanilmayotgan obyektlarni avtomatik
/// ravishda xotiradan olib tashlaydi.
class Person {
  String name;

  Person(this.name);
}

void personExample() {
  var p1 = Person("Eddie");
  var p2 = p1;
  // p2 va p1 bir obyektga ishora qiladi
  p1 = Person("New Name");
  // Eski obyekt GC tomonidan tozalanadi
}

/// natogri yozilgan yoki etiborsiz qoldirilgan ha bir case Memory Leak-ga
/// olib kelishi mumkin.

void timerWithExample() {
  Timer.periodic(Duration(seconds: 1), (timer) {
    print("Ishlamoqda...");
  });
}

/// Bu kod cheksiz vaqt ishlaydi va hech qachon to‘xtamaydi! Bu esa xotirani
/// to‘ldirib tashlashi mumkin
void timerExample() {
  Timer? timer = Timer.periodic(Duration(seconds: 1), (timer) {
    print("Ishlamoqda...");
  });

  Future.delayed(Duration(seconds: 5), () {
    timer.cancel();
    // Timer to‘xtatiladi va xotira bo‘shatiladi
    print("Timer to‘xtatildi.");
  });
}

/// Immutable obyektlar bilan samaradorlikni oshirish
class UserNoImmutable {
  String name;

  UserNoImmutable(this.name);
}

/// immutable qilish
/// Yangi obyekt yaratish o‘rniga mavjud obyektni ishlatish natijasida xotira
/// tejaydi.
class UserWithImmutable {
  final String name;

  const UserWithImmutable(this.name);
}

/// Stack vs Heap
/// * Stack

/// Stack (Stek) – Tez, avtomatik boshqariladigan xotira maydoni
/// stack -> call stack yordamida ishlaydi va lokal ozgaruvchilar hamda
/// methodlar chaqiruvlari saqlanadi.
/// Stack -> funksiyadan chiqishda ma’lumotlar avtomatik o‘chiriladi.
/// Kichik va vaqtinchalik malumotlar uchun ideal
/// Kamchiliklari:faqat lokal ozgaruvchilar saqlanadi, stack overflow xatosi
/// bolishi mumkin.
int add(int a, int b) {
  // Stack ichida saqlanadi
  int sum = a + b;
  return sum;
}

void main() {
  // result ham Stack'ga yoziladi
  int result = add(10, 20);
  print(result);
}

/// Heap – dastur ish vaqtida yaratilgan obyektlar va ma’lumotlarni saqlaydi.
/// Dart’da class obyektlari Heap'ga joylashtiriladi.
/// Dinamik ma’lumotlar uchun ideal (katta obyektlar, ma’lumotlar bazasi
/// natijalari va h.k.)
/// Obyektlar va koleksiyalar uzoq vaqt saqlanishi mumkin
/// Sezilarli sekinroq ishlaydi (Stack'ga qaraganda)
/// Garbage Collector (GC) ishlashi tufayli performans pasayishi mumkin
/// Xotira Memory Leak xavfi bor
class Person1 {
  String name;

  Person1(this.name);
}

// void main() {
//   var p1 = Person("Eddie"); // Heap xotirasiga yoziladi
//   var p2 = p1; // p2 ham o‘sha obyektga ishora qiladi
//
//   print(p1.name);
//   print(p2.name);
// }
