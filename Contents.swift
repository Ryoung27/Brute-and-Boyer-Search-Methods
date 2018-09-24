import UIKit
//Boyer Moore
//extension String {
//    fileprivate var skipTable: [Character: Int] {
//        var skipTable: [Character: Int] = [:]
//        for (i, c) in enumerated() {
//            skipTable[c] = count - i - 1
//        }
//        return skipTable
//    }
//    fileprivate func match(from currentIndex: Index, with pattern: String) -> Index {
//        if currentIndex < startIndex { return nil}
//        if currentIndex >= endIndex { return nil}
//
//        if self[currentIndex] != pattern.last { return nil}
//
//        if pattern.count == 1 && self[currentIndex] == pattern.last { return currentIndex}
//        return match(from: index(before: currentIndex), with: "\(pattern.dropLast())")
//    }
//    func index(of pattern: String) -> Index? {
//        let patternLength = pattern.count
//        guard patternLength > 0, patternLength <= count else { return nil }
//
//        let skipTable = pattern.skipTable
//        let lastChar = pattern.last!
//
//        var i = index(startIndex, offsetBy: patternLength - 1)
//        // 1
//        while i < endIndex {
//            let c = self[i]
//
//            // 2
//            if c == lastChar {
//                if let k = match(from: i, with: pattern) { return k! }
//                i = index(after: i)
//            } else {
//                // 3
//                i = index(i, offsetBy: skipTable[c] ?? patternLength, limitedBy: endIndex) ?? endIndex
//            }
//        }
//        return nil
//    }
//}
//
//
//let helloText = "Hello"
//helloText.skipTable.forEach { print($0) }




//Brute Force
extension String {
func index(of pattern: String) -> Index? {
    // 1
    for i in indices {
        
        // 2
        var j = i
        var found = true
        for p in pattern.indices {
            guard j != endIndex && self[j] == pattern[p] else { found = false; break }
            j = index(after: j)
        }
        if found {
            return i
        }
    }
    return nil
}
}

let text = "Hello World"
text.index(of: "lo") // returns 3
text.index(of: "ld") // returns 9



