import 'dart:math';

void main() {
  Solution solution = Solution();
  print("result => ${solution.lengthOfLongestSubstring("abcabcbb")}");
}

class Solution {
  int lengthOfLongestSubstring(String s) {
    int maxLength = 0;
    int left = 0;
    Map<String, int> charIndexMap = {};
    for (int i = 0; i < s.length; i++) {
      String currentChar = s[i];

      if (charIndexMap.containsKey(currentChar) &&
          charIndexMap[currentChar]! >= left) {
        left = charIndexMap[currentChar]! + 1;
      }

      charIndexMap[currentChar] = i;
      maxLength = max(maxLength, i - left + 1);
    }
    return maxLength;
  }
}
