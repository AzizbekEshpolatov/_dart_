import 'dart:collection';

/// * Queue *
/// Queue – bu birinchi kelgan birinchi ketadi (FIFO – First In First Out)
/// tartibida ishlaydigan ma'lumot tuzilmasi.
/// Navbat ga o‘xshaydi: kim oldin tursa, o‘sha birinchi chiqadi.

void main() {
  Queue<int> queue = Queue();
  queue.addFirst(2);
  queue.addFirst(3);
  queue.addLast(4);
  // * addFirst * => navbatni boshidan qoshadi
  // * addLast * => navbatni oxiridan qoshadi
  // * removeLast * => navbat oxiridan o'chiradi
  // * removeFirst * => navbat boshidan o'chiradi
  print(queue);
}

/// Boshidan o‘chirish va oxiriga qo‘shish tez ishlaydi.
/// Indeks orqali ishlay olmaysiz, faqat boshidan yoki oxiridan ishlaydi.
/// Ma'lumot o‘rtasidan topish yoki indeks bo‘yicha olish sekin.
/// Ayrim hollarda oddiy List dan ko‘ra ko‘proq xotira egallashi mumkin
