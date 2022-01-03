import Foundation

// The Longest Common Subsequence (LCS) of two strings is the longest sequence of characters that appear in the same order in both strings.

// For example the LCS of "Hello World" and "Bonjour le monde" is "oorld". If you go through both strings from left-to-right, you'll find that the characters o, o, r, l, d appear in both strings in that order.

// To find the lengths of all possible subsequences, we use a helper function, lcsLength(). This creates a matrix of size (n+1) by (m+1), where matrix[x][y] is the length of the LCS between the substrings a[0...x-1] and b[0...y-1]

func lcsLength(firstString: String, secondString: String) -> [[Int]] {
  var matrix = [[Int]](repeating: [Int](repeating: 0, count: secondString.count + 1), count: firstString.count + 1)
  for (i, firstChar) in firstString.enumerated() {
    for (j, secondChar) in secondString.enumerated() {
      if firstChar == secondChar {
        matrix[i + 1][j + 1] = matrix[i][j] + 1
      } else {
        matrix[i + 1][j + 1] = max(matrix[i][j + 1], matrix[i + 1][j])
      }
    }
  }
  return matrix
}

// Having the length of every combination of substrings makes it possible to determine which characters are part of the LCS itself by using a backtracking strategy.

func backtrack(matrix: [[Int]], firstString: String, secondString: String) -> String {
  var i = firstString.count
  var j = secondString.count

  var charSequenceIndex = firstString.endIndex
  var result: String = ""

  while i > 0 && j > 0 {
    if matrix[i][j] == matrix[i][j - 1] {
      j = j - 1
    } else if matrix[i][j] == matrix[i - 1][j] {
      i = i - 1
      charSequenceIndex = firstString.index(before: charSequenceIndex)
    } else {
      i = i - 1
      j = j - 1
      charSequenceIndex = firstString.index(before: charSequenceIndex)
      result.append(firstString[charSequenceIndex])
    }
  }
  return String(result.reversed())
}

let firstString = "ABCBX"
let secondString = "ABDCAB"

let matrix = lcsLength(firstString: firstString, secondString: secondString)
let result = backtrack(matrix: matrix, firstString: firstString, secondString: secondString)
print("LONGEST COMMON SUBSEQUENCE: \(result)")