/// event loop-ning ish jarayoni haqida qisqacha nazariy tushuncha
/// example kod bilan.
/// dart dasturalsh tilida event loop asinxrom operatsiyalarni boshqarish
/// mexanizmi bolib, Future,Stream kabi methodlarni ishlashini taminlaydi
/// dart dasturlash tilida bu tushuncha kotta ahamiyatga ega.
///
/// kodlarning ishga tushish ketma ketligi:
/// * sinxrom kodlar birinchi ishga tushadi
/// * Microtask queue sinxrom koddan keyin ishga tushadi
/// * Microtask queue tugagach event queue bajariladi

import 'dart:async';

void main() {
  print('Ofitsiant ishni boshladi.');
  Future(() => print('1. Katta buyurtma bajarildi (Event queue)'));
  scheduleMicrotask(
      () => print('2. Kichik buyurtma bajarildi (Microtask queue)'));
  Future(() => print('3. Katta buyurtma bajarildi (Event queue)'));
  scheduleMicrotask(
      () => print('4. Kichik buyurtma bajarildi (Microtask queue)'));
  print('Ofitsiant barcha buyurtmalarni tekshirdi.');
}
