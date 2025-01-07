import 'dart:async';

/// Stream bu asiinxrom malumotlar oqimini ifodalovchi sinf, Stream yordamida
/// malumotlar real vaqt rejimida uzatiladi. Stream 1 yoki bir nechta events
/// oz ichiga olishi mumkin.Bu vaqt davomida ketma ket sodir boladi.
/// -------------------------------------------------------------------------///
/// Stream 2 turdan iborat,
/// * Single subscription stream
/// * Broadcast stream
/// -------------------------------------------------------------------------///
/// * Single-subscription stream.
/// Bu turdagi stream faqatgina 1ta listenerga ega bolishi mumkin, Misol qilib
/// file oqish jarayonini olishimiz mumkin.

void singleSubscriptionStreamExample() {
  // stream yaratish, bu joyda men fromIterable yordamida 5ta sondan iborat
  // stream yaratdim va bu stream 5ta raqamni malumot sifatida uzatadi.
  Stream<int> numberStream = Stream.fromIterable([1, 2, 3, 4, 5]);

  // streamni listen qilib o'qib olyabman buni pastda kengroq yoritaman
  // * (stream oqib olishni 2xil usuli bor)
  numberStream.listen(
    (data) => print('Olingan data : $data'),
    onDone: () => print('stream tugadi.'),
  );
  // -------------------------------------------------------------------------//
  // periodic yordamida stream hosil qilyabman va bu 1sekund farqi bilan 0 dan
  // boshlab raqamlarni uzatadi.  .take(5) qilib shart berganman, qachonki value
  // 0,1,2,3,4 va 5ga yetganda stream tugatiladi.
  Stream<int> periodicStream = Stream.periodic(
    Duration(seconds: 1),
    (count) => count,
  ).take(5);
  periodicStream.listen(
    (data) => print('Olingan data : $data'),
    onDone: () => print('stream tugadi.'),
  );
}

/// * Broadcast stream
/// broadcast stream bu bir qancha listener-ga malumot uzatishga mo'ljallangan
/// Stream turi. Oddiyroq qilib aytganda broadcast stream, bir hodisani bir
/// qancha joylarga elituvchi stream turi.
/// broadcast streamni tarmoq monitoringi (masalan, ma'lumotlarni real vaqtda
/// bir nechta modulga uzatish). ishlatish mumkin.

void broadcastStreamExample() {
  // stream yaratyabman, single-subscription qilib
  Stream<int> singleSubscriptionStream = Stream.fromIterable([1, 2, 3, 4, 5]);

  // single subscription streamni oxiridan asBroadcastStream qilish orqali
  // broadcast stream yasadim
  Stream<int> broadcastStream = singleSubscriptionStream.asBroadcastStream();

  // stream-ni listen qildim tinglovchi 1,2 korinishda.
  broadcastStream.listen((data) => print('Tinglovchi 1: $data'));
  broadcastStream.listen((data) => print('Tinglovchi 2: $data'));
}

/// Dart-da Streamni o'qish uchun ikkita asosiy usul mavjud:
/// * listen
/// * await for
void readStream() async {
  Stream<int> numberStream = Stream.fromIterable([1, 2, 3, 4, 5]);
  numberStream.listen(
    // (_) qismida bizning streamdagi navbatma navbat uzatilgan malumot keladi
    // kelgan data-ni print qilib chiqaryabman.
    (data) => print('Olingan data : $data'),
    // onError -> (error) -> error kelyabdi mavjud errorni print qilib chiqardim
    // onError methodiga error yuzaga kelganda tushadi.
    onError: (error) => print('Xatolik yuz berdi: $error'),
    // onDone methodiga stream muvafaqqiyatli yakunlangach tushadi.
    // stream tugadi degan methodni chiqarib qoydim.
    onDone: () => print('Stream tugadi.\n'),
    // cancelOnError-ga qachonki error yuzaga kelsa stream yakunlansinmi degan
    // savolni beradi, true/false-ga qarab bu methodni boshqaramiz.
    cancelOnError: true,
  );
  await Future.delayed(Duration(seconds: 2))
      .then((value) => print("navbatdagi stream ishga tushmoqda...\n"));
  await for (int number in numberStream) {
    print('Olingan data : $number');
  }
}

/// Stream yasash usullari.
/// * Transforming existing streams.
/// * Creating a stream from scratch by using an async* function.
/// * Creating a stream by using a StreamController.

/// * Transforming existing streams. bu usul mavjud Stream-larni o'zgartirish
/// orqali yangi stream yaratish tushuniladi.
/// Example kod:
void transformedStream() {
  Stream<int> stream = Stream.fromIterable([1, 2, 3, 4, 5]);
  Stream<int> transformStream = stream.map((event) => event + 1);
  transformStream.listen((data) => print(data));
}

/// * async* orqali stream yasash usuli. Bu dart dasturlash tilida streak
/// yasashning eng sodda usullaridan biri bolib yield orqali malumotlarni
/// uzatadi.

/// - async* bilan belgilanadigan funksiya har doim Stream qaytaradi.
/// - Bu funksiya yield yordamida qiymatni oqimga yuboradi.
/// - Har bir yield chaqirig'i oqimda yangi ma'lumot hosil qiladi.

/// # Eslatma:
/// yield* korinishda biz stream ichida stream yuborsak boladi.
/// yield* boshqa Streamni qayta chiqarish uchun ishlatiladi.

/// # foydali jihatlari haqida gaplashamiz [yield*]-ni
/// & Bir nechta Streamlarni birlashtirish imkonini beradi
/// &	Shartli ravishda Streamlarni birlashtirish mumkin
/// & Turli manbalardan kelgan ma'lumotlarni oqimga oson qo'shadi

Stream<int> generateNumber(int count) async* {
  for (int i = 0; i <= count; i++) {
    // # Eslatma: malumotlarni yield orqali uzatyabman!!!
    yield i;
    await Future.delayed(Duration(seconds: 1));
  }
}

// ------------------------- yield* uchun example kod ------------------------//
Stream<int> evenNumbers() async* {
  // Juft sonlar
  yield 2;
  yield 4;
}

Stream<int> oddNumbers() async* {
  // Toq sonlar
  yield 1;
  yield 3;
}
// -------------- shu 2ta stream-ni yangi stream-da foydalanish --------------//

Stream<int> combineStreams() async* {
  // Juft sonlarni chiqaryabman
  yield* evenNumbers();
  // Toq sonlarni chiqaryabman
  yield* oddNumbers();
}

/// combineStreams stream-ni odatdagidek listen qilib o'qib olsak bolaveradi
/// malumotlar doimgidek navbatma navbat keladi

// -------------------------- Terminaldagi natija ----------------------------//
/*
Olingan ma'lumot: 2
Olingan ma'lumot: 4
Olingan ma'lumot: 1
Olingan ma'lumot: 3
 */

///  * Creating a stream by using a StreamController.
/// dart-da Stream yaratishning yana bir usuli bu streamController bolib,
/// Stream-ni yaratish va malumotlarni uzatish uchun kuchli vositadir. Bu usul
/// bizga stream-ni toliq boshqarish imkonini beradi , uni istalgan vaqti
/// cancel,pause .. va h.k qilishimiz mumkin.

void main() async {
  // streamController obyektini yaratib oldim.
  // # Eslatma: <int> - bu Streamdagi malumotlarning turini belgilaydi.
  StreamController<int> controller = StreamController<int>();

  /// listen qilib oqib olyabman doimgidek, yuqorida yozganman methodlarini
  /// onError,onDone va h.k haqida.
  controller.stream.listen(
    (data) => print('Olingan ma\'lumot: $data'),
    onError: (error) => print('Xatolik yuz berdi: $error'),
    onDone: () => print('Stream tugadi.'),
  );

  // Malumot qo'shish quyidagicha amalga oshhiriladi.
  controller.add(1);
  controller.sink.add(2);
  // bu ikki usul ham aslida bir xil manoda foydalanilmoqda.
  // controller.add()-StreamController-ning o'zidan foydalanib ma'lumot qo'shish.
  // controller.sink.add(): StreamController-ning sink (oqimning kirish nuqtasi)
  // obyekti orqali ma'lumot qo'shish.

  // Xatolik qo'shish
  controller.addError('custom error qoshdim..');

  /// yuqoridagi onDone buyrgiga o'xshash, stream tugagach ishga tushadi.
  controller.done.then((_) => print('----- Stream tugadi -----'));

  /// hasListener methodi haqida.
  // bu method Streamda faol tinglovchilar(listener) bor-yo'qligini aniqlaydi.
  // Agar streamda eng kamida bitta tinglovchi(listener) bo'lsa, true, aks holda
  // false qiymat qaytaradi
  print('Tinglovchilar bormi? ${controller.hasListener}');

  //isClosed methodi haqida
  // Streamning yopilgan-yo'qligini tekshiradi.
  // Agar stream yopilgan bo'lsa, true, aks holda false.
  print('Stream yopilganmi? ${controller.isClosed}');

  // isPaused methodi haqida
  // stream pause bolganmi yoqmi tekshiradi bu ham true/false qaytaradi
  print('Stream pause qilinganmi? ${controller.isPaused}');

  // Streamni yopish, doimgidek close() buyrugini amalga oshiramiz!
  controller.close().then((value) => print("stream closed.."));

  // stream controller ishlatganimizda eng kerakli bolgan bir tushuncha bor
  // bu StreamSubscription  bolib uning vazifasini yaxshiroq tushunishga
  // harakat qilamiz.

  /// # Eslatma:
  /// StreamSubscription  bu stream va uning listener(tinglovchisi) o'rtasidagi
  /// o'rnatilgan aloqa bolib, Stream-dagi malumotlarni boshqarish uchun
  /// foydalanamiz.
  /// Stream-ga listener bolish orqali StreamSubscription  obyektini qaytariladi
  /// ushbu obyekt orqali Stream-dagi ma’lumotlarni olish, xatolarni tinglash,
  /// Streamni pauza qilish, davom ettirish yoki bekor qilish, kabi amallarni
  /// bajarishimiz mumkin.

  Stream<int> numberStream = Stream.fromIterable([1, 2, 3, 4, 5]);

  StreamSubscription<int> subscription = numberStream.listen(
    (data) => print("- $data -"),
  );

  // Streamni pauza qilish quyidagicha.
  subscription.pause();
  print('Stream pauza qilindi.');

  Future.delayed(Duration(seconds: 2), () {
    // 2 sekundan song stream-ni davom ettirish
    subscription.resume();
    print('Stream davom ettirildi.');
  });

  // 5 sekunddan song streamni cancel qildik.
  await Future.delayed(Duration(seconds: 5));
  subscription.cancel();
  print('Stream obunasi bekor qilindi.');
}
