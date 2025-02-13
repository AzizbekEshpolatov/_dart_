/// * Stack *
/// LIFO – Oxirgi kirgan birinchi chiqadi!
/// stack-bu ma'lumotlarni ustma-ust qo‘yib saqlash uchun ishlatiladigan tuzilma.
/// Oddiy hayotiy misol bilan tushuntirish:
/// 📚 Kitoblar ustuni (stack of books):
/// Stol ustiga birinchi kitob qo‘ydingiz.
/// Ikkinchi kitobni qo‘ydingiz, u birinchi kitobning ustida bo‘ladi.
/// Uchinchi kitobni qo‘ydingiz, u hammasining ustida bo‘ladi.
/*
+----------+   ← uchinchi qo‘yildi
|  Kitob 3 |
+----------+
|  Kitob 2 |
+----------+
|  Kitob 1 |   ← birinchi qo‘yildi
+----------+
*/
void main() {
  // List<int> stack = [];
  //
  // stack.add(10);
  // stack.add(20);
  // stack.add(30);
  //
  // print(stack.removeLast());
  // print(stack.last);
  // Example.
  print(isBalanced("{{[[(())]]}}"));
}

// Oddiy va tez ishlaydi
// Tepadagi elementga tez murojaat
// O‘rtadan element olish yo‘q
// Faqat tepa bilan ishlash qulay

bool isBalanced(String input) {
  List<String> stack = [];
  Map<String, String> matchingBrackets = {
    ')': '(',
    '}': '{',
    ']': '[',
  };

  for (int i = 0; i < input.length; i++) {
    String char = input[i];

    if (char == '(' || char == '{' || char == '[') {
      stack.add(char);
    } else if (char == ')' || char == '}' || char == ']') {
      if (stack.isEmpty) {
        return false;
      }
      String lastOpened = stack.removeLast();
      if (lastOpened != matchingBrackets[char]) {
        return false;
      }
    }
  }

  return stack.isEmpty;
}
