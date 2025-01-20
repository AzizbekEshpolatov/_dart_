/**
 * Compile time bu dart dasturlash tilida kodni ishlatishdan oldin , yani dastur
 * kodni dart kopilatori yordamida mashina tiliga o'zgartirayotgan jarayon
 * tushuniladi. Kompilyator kodni oqib sintaksis xatolarni aniqlaydi. Dart-da
 * har bir ozgaruvchining tipi belgilangan bolishi kerak, Kompilator type
 * xatolarini ham aniqlaydi
 * Compile-time xatoliklar – bu xatoliklar dastur ishga tushirilishidan oldin
 * aniqlanadi, ya'ni kodni kompilyatsiya qilganda chiqadi. Masalan:
 *
 * Compile-time xatoliklar – bu xatoliklar dastur ishga tushirilishidan oldin
 * aniqlanadi, ya'ni kodni kompilyatsiya qilganda chiqadi. Masalan:
 *
 * Compile time afvzalliklari:
 * Xatoliklar oldindan aniqlanadi, shuning uchun dastur ishga tushirilmasdan
 * turib tuzatiladi.
 * Kode optimallashtirish imkoniyatlari mavjud.
 *
 * Runtime
 * Runtime – bu dastur ishga tushirilgan va ishlayotgan paytni anglatadi
 * O'zgaruvchilarni tayinlash, arifmetik amallarni bajarish, funksiyalarni
 * chaqirish, va boshqa harakatlar runtime vaqtida amalga oshiriladi.
 * Runtime xatoliklar – bu xatoliklar dastur ishlayotganda, yani dastur ishga
 * tushirilganda yuzaga keladi. Masalan, null pointer hatoliklari, noto'g'ri
 * funktsiyalarni chaqirish va boshqa amaliyot xatoliklari.
 *
    void main() {
    int a = 5;
    print(a ~/ 0); // runtime error: ZeroDivisionError
    }
 *  */
