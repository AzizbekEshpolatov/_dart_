void main() {
  String version1 = "1.2", version2 = "1.10";
  print("RESULT FUNCTION:${compareVersion(version1, version2)}");
}

int compareVersion(String version1, String version2) {
  List<String> ls1 = version1.split('.');
  List<String> ls2 = version2.split('.');

  int maxLength = ls1.length > ls2.length ? ls1.length : ls2.length;

  for (int i = 0; i < maxLength; i++) {
    int v1 = i < ls1.length ? int.parse(ls1[i]) : 0;
    int v2 = i < ls2.length ? int.parse(ls2[i]) : 0;

    // condition
    if (v1 > v2)
      return 1;
    else if (v1 < v2) return -1;
  }

  // default
  return 0;
}

// 100/100

/*
Example 1:
Input: version1 = "1.2", version2 = "1.10"
Output: -1

Explanation:
version1's second revision is "2" and version2's second revision is "10": 2 < 10, so version1 < version2.

Example 2:
Input: version1 = "1.01", version2 = "1.001"
Output: 0

Explanation:
Ignoring leading zeroes, both "01" and "001" represent the same integer "1".
 */

/*
Given two version strings, version1 and version2, compare them. A version string
consists of revisions separated by dots '.'. The value of the revision is its
integer conversion ignoring leading zeros.

To compare version strings, compare their revision values in left-to-right
order. If one of the version strings has fewer revisions, treat the missing
revision values as 0.

Return the following:

If version1 < version2, return -1.
If version1 > version2, return 1.
Otherwise, return 0.
*/
