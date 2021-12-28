import Foundation

func binarySearch(array: [Int], key: Int) -> Int? {
  var lowLimit = 0
  var highLimit = array.count

  while lowLimit < highLimit {
    let midIndex = lowLimit + (highLimit - lowLimit) / 2
    if array[midIndex] == key {
      return midIndex
    } else if array[midIndex] < key {
      lowLimit = midIndex + 1
    } else {
      highLimit = midIndex
    }
  }
  return nil
}

let searchArray = [4, 9, 10, 27, 48, 60, 100, 503]
print(binarySearch(array: searchArray, key: 48) ?? 0)