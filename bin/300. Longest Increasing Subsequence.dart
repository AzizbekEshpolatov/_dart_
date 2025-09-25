import 'dart:math';
void main() {
  List<int> nums = [10, 9, 2, 5, 3, 7, 101, 18];

  /// 9 > 10?
  /// 2 > 9?
  /// 5 > 2? xa => [2,5] => [1,1,1,3,..

  int len = nums.length;
  if (len == 0) {
    print(0);
    return;
  }
  List<int> dp = List<int>.filled(len, 1);
  for (int i = 1; i < len; i++) {
    for (int j = 0; j < i; j++) {
      if (nums[i] > nums[j]) {
        dp[i] = max(dp[i], dp[j] + 1);
      }
    }
  }
  int longest = 0;
  for (int val in dp) {
    if (val > longest) {
      longest = val;
    }
  }

  print("DP massivi: $dp");
  print("Eng uzun o'suvchi ketma-ketlikning uzunligi: $longest");
}
