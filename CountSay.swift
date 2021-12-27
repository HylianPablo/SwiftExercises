import Foundation

/*
Count and Say

The count-and-say sequence is the sequence of integers beginning as follows:
1, 11, 21, 1211, 111221, ...

1 is read off as "one 1" or 11.
11 is read off as "two 1s" or 21.
21 is read off as "one 2, then one 1" or 1211.

Given an integer n, generate the nth sequence.

Note: The sequence of integers will be represented as a string.
*/

class CountSay {
    func sequence(_ number: Int) -> String {
        if number < 1 {
            return "Invalid case!"
        } else if number == 1 {
            return "1"
        } else {
            var result: String = "11"
            for _ in 2..<number {
                var iterationResult: String = ""
                var count = 1
                for j in 1..<result.count {
                    if charAt(result, index:j-1) == charAt(result, index:j) {
                        count += 1
                    } else {
                        iterationResult += String(count)
                        iterationResult += String(charAt(result, index: j - 1))
                        count = 1
                    }
                }
                iterationResult += String(count)
                iterationResult += String(charAt(result, index:result.count - 1))
                result = iterationResult
            }
            return result
        }
    }

    func charAt(_ s: String, index: Int) -> Character {
        return s[s.index(s.startIndex, offsetBy: index)]
    }
}