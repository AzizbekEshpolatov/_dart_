import 'dart:io';
import 'dart:isolate';

/// -------------------- Dart dasturlash tili isolate -----------------------///
/// dart dasturlash tilida isolate bu parallel hisoblash amalga oshirish uchun
/// alohida bajariladigan mustaqil ishchi jarayon hisoblanadi dartda isolate
/// ozining xotira maydoniga ega bolgan obyektlar yigindisidir. Ular mutlaqo
/// mustaqil ishlaydi bir biriga aloqasi bolmagan xolda va bir biri bilan
/// xabarlar orqali muloqat qiladi.
/// Har bir isolate o'z ishchi jarayoniga ega bo'lib, asosiy ilova oqimidan
/// (main thread) ajratilgan holda ishlaydi. Har bir isolate o'zining xotirasida
/// ishlaydi va boshqa izolyatsiyalarning xotirasiga to'g'ridan-to'g'ri
/// kira olmaydi. Izolyatsiyalar bir-biri bilan ma'lumot almashish uchun
/// SendPort va ReceivePort orqali xabar yuboradi. (pastroqda toliq yozaman)
///
/// isolate ishlatilishi mumkin bolgan xolatlar quyidagilar
/// * Juda katta hajmdagi JSON maʼlumotlarni tahlil qilish va dekodlash.
/// * Fotosuratlar, audio va video fayllarni qayta ishlash.
/// * Audio va video fayllarni formatini oʻzgartirish.
/// * Katta roʻyxatlar yoki fayl tizimlarida murakkab qidiruv va filtrlash.
/// * Maʼlumotlar bazasi bilan muloqot kabi kirish-chiqish ishlarini bajarish.
/// * Koʻp miqdordagi tarmoq soʻrovlarini boshqarish.
///
/// Isolate.spawn orqali isolate yasash.
/// Isolate.spawn yordamida siz yangi isolate yaratasiz va unda biror funksiyani
/// ishga tushirasiz. Bu funksiya odatda uzoq davom etadigan vazifalarni asosiy
/// isolate-dan ajratib bajarish uchun ishlatiladi.
/// malumot almashish uchun sendPort va ReceivePort ishlatiladi va bu asosiy
/// oqimdan mustaqil ishlaydi
/// SendPort va ReceivePort  bu dart-da isolate ortasida xabar almashish
/// vositalari hisoblanadi.
/// * ReceivePort bu xabarlarni qabul qilish uchun ishlatiladi.
/// qabul qilingan habarni qayta ishlash uchun listen methodidan foydalanadi
/// * SendPort Bu xabarlarni boshqa izolyatsiyaga yuborish uchun ishlatiladi.
/// Har bir ReceivePort o‘zining **SendPort**iga ega.
///
/// kamchiliklari
/// * har bir isolate ozining xotira maydoniga ega va ular o'rtasida togridan
/// togri malumot almashinuvi yoq.
/// Isolate-larni yaratish boshqa asinxrom vazifalarga qaraganda resurs talab
/// qiladi
/// * Xabar almashinuvi ma’lumotni serializatsiya qilishni talab qiladi, bu
/// ba’zida sekinlashishga olib keladi.(shu joyoga qoshimcha qilamiz, masalan
/// xotiradan katta xajmdagi malumot oqimochi bolsangiz oldin fileni oqib olib
/// unga ishlov berasiz bu vaqt oladi va dasturni sekinlashtiradi)

/// example--katta hajmli file oqimoqchi bolsak isolate yasash tartibi
void fileReadWithIsolate(SendPort mainSendPort) {
  ReceivePort receivePort = ReceivePort();
  mainSendPort.send(receivePort.sendPort);
  receivePort.listen((path) async {
    if (path is String) {
      try {
        final file = File(path);
        String response = await file.readAsString();
        mainSendPort
            .send("file hajmi : ${response.length} ta belgidan iborat!");
      } catch (e) {
        mainSendPort.send("Error : $e");
      }
    } else {
      mainSendPort.send("path formati xato!");
    }
  });
}

int calculate(int limit) {
  int sum = 0;
  for (int i = 0; i <= limit; i++) {
    sum += limit;
  }
  return sum;
}

void main() async {

  // final int sum = await compute(calculate,calculate(212121221));

  ReceivePort mainReceivePort = ReceivePort();
  Isolate? workerIsolate;
  workerIsolate = await Isolate.spawn(
    fileReadWithIsolate,
    mainReceivePort.sendPort,
  );
  SendPort? workerSendPort;
  mainReceivePort.listen((message) {
    if (message is SendPort) {
      workerSendPort = message;
      workerSendPort?.send(
        r'C:\Users\pro\PycharmProjects\_dart_\bin\example_file',
      );
    } else {
      print("javob-$message");
      mainReceivePort.close();
      workerIsolate?.kill(priority: Isolate.beforeNextEvent);
    }
  });
  print('Asosiy izolyatsiya: Hisoblash boshlanmoqda...');
  final int result = await Isolate.run(() => calculate(1000000));
  print('Asosiy isolate: Hisoblash tugadi. Natija: $result');
}

