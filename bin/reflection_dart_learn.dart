import 'dart:mirrors';

/// * dart reflection *

/// Reflection-bu dastur ishlayotgan paytda  yani runtime vaqtida dasturiy
/// kodning tuzilmasi va objectlar haqida qoshimcha malumot olish va ularga
/// dynamic tarzda ozgarish kiritishimiz mumkin boladi.
/// Reflection orqali objectning type-ni aniqlash,properties va methodlari
/// haqida malumot olish mumkin.
/// reflectionni - serialization/deserialization(jsondan objectga) o'tishda
/// Object-Relational Mapping kutubxonalarini yaratishda,deep copy uchun
/// foydalanishimiz mumkin.
class MyClass {
  int myField = 42;

  void myMethod() {
    print('Hello, Reflection!');
  }
}

void main() {
  // Klassni olish
  // reflectClass funksiyasi orqali MyClass klassining ClassMirror
  // obyekti olinadi.
  ClassMirror classMirror = reflectClass(MyClass);

  // Klassning metodlarini ko'rish
  // declarations xususiyati orqali klassning barcha metodlar,
  // o'zgaruvchilar ko'rib chiqiladi.
  classMirror.declarations.forEach((key, value) {
    if (value is MethodMirror) {
      print('Method: ${MirrorSystem.getName(key)}');
    } else if (value is VariableMirror) {
      print('Field: ${MirrorSystem.getName(key)}');
    }
  });

  // Obyekt yaratish va metodni chaqirish
  InstanceMirror instanceMirror = reflect(MyClass());
  instanceMirror.invoke(#myMethod, []);
}
