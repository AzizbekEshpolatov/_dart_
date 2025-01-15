/// generic bu malumot turlariga bogliq bolmagan holda umumiy kod yozishga imkon
/// beradigan dasturlash konsepti. yani kodimiz aynan bir type-ga bogliq emas.
/// Generic-lar yordamida type-ni dynamic emas va kompilyatsiya vaqtida
/// aniqlanadi. Bu bizga katta hajmdagi kodlarni qayta yozish zaruriyatini
/// yoq qiladi,kod xavfsizligini oshiradi,type bilan bogliq xatolarni
/// kompilyatsiya vaqtida aniqlash imkonini beradi.

class Box<T> {
  T? value;

  //qiymat yangilash
  setValue(T newValue) => value = newValue;

  //qiymatni olish
  T? getValue() => value;
}

// void main() {
//   Box<int> intBox = Box();
//   intBox.setValue(10);
//   print(intBox.getValue());
// }

/// Generiklar ma'lumot turiga bog‘liq bo‘lmagan kod yozish uchun mo‘ljallangan.
/// Kodni optimallashtirish, xavfsizlikni oshirish va qayta foydalanish uchun
/// ishlatsak boladi
/// Generik parametrlarga extends orqali cheklovlar qo‘yish mumkin.

// Har xil turdagi ma'lumotlarni saqlash uchun generik sinf
class DataHolder<T> {
  T data;

  DataHolder(this.data);

  void showData() {
    print('Ma\'lumot turi: ${data.runtimeType}, Qiymati: $data');
  }
}

void main() {
  DataHolder<String> stringHolder = DataHolder<String>('Salom, Generics!');
  stringHolder.showData();
  DataHolder<int> intHolder = DataHolder<int>(42);
  intHolder.showData();
  DataHolder<double> doubleHolder = DataHolder<double>(3.14);
  doubleHolder.showData();
}
