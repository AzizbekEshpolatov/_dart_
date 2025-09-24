class Solution {
  void wiggleSort(List<int> nums) {
    nums.sort();
    int n = nums.length;

    int smallHalfEnd = (n + 1) ~/ 2 - 1;
    int largeHalfEnd = n - 1;

    List<int> res = List<int>.filled(n, 0);

    for (int i = 1; i < n; i += 2) {
      res[i] = nums[largeHalfEnd--];
    }

    for (int i = 0; i < n; i += 2) {
      res[i] = nums[smallHalfEnd--];
    }

    for (int i = 0; i < n; i++) {
      nums[i] = res[i];
    }
    print(res);
    print(nums);
  }
}

void main() {
  Solution solution = Solution();
  solution.wiggleSort([1, 5, 1, 1, 6, 4]);
}
