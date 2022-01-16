import Foundation

// Given an integer number of rows 'n', return the first 'n' rows of Pascal's triangle.

func triangle(numRows: Int) -> [[Int]] {
  guard numRows > 0 else {
    return []
  }
  if numRows == 1 { return [[1]] }

  var result: [[Int]] = []
  result.append([1])

  for i in 1..<numRows {
    var currentRow = [1]
    let previousRow = result[i - 1]
    for j in 1..<previousRow.count {
      currentRow.append(previousRow[j] + previousRow[j - 1])
    }
    currentRow.append(1)
    result.append(currentRow)
  }
  return result
}

let result = triangle(numRows: 5)
for row in result {
  print(row)
}