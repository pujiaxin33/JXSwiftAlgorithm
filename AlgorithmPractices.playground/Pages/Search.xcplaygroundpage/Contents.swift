//: [Previous](@previous)

import Foundation

/// 二分查找循环迭代实现
func binarySearchIterative<T: Comparable>(values: [T], target: T) -> Int? {
    var lowerBound = 0
    var upperBound = values.count
    while lowerBound < upperBound {
        let midIndex = lowerBound + (upperBound - lowerBound) / 2
        if target > values[midIndex]  {
            lowerBound = midIndex + 1
        }else if target < values[midIndex] {
            upperBound = midIndex
        }else {
            return midIndex
        }
    }
    return nil
}

func testBinarySearchIterative() {
    let sortedNumbers = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
    //        let numbers = [3, 5, 1, 0, 9, 7, 8, 6, 4, 2]
    let index = binarySearchIterative(values: sortedNumbers, target: 9)
    print(index!)
}
testBinarySearchIterative()

/// 使用递归实现二分查找
/// 输入的数组必须是已经排序好的数组，返回目标数的index
func binarySearchRecursive<T:Comparable>(values: [T], target: T, range: Range<Int>) -> Int?{
    if range.lowerBound >= range.upperBound {
        //not found
        return nil
    }
    let midIndex = range.lowerBound + (range.upperBound - range.lowerBound)/2
    if target > values[midIndex] {
        return binarySearchRecursive(values: values, target: target, range: (midIndex + 1)..<range.upperBound)
    }else if target < values[midIndex] {
        return binarySearchRecursive(values: values, target: target, range: range.lowerBound..<midIndex)
    }else {
        return midIndex
    }
}

func testBinarySearchRecursive() {
    let sortedNumbers = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
    //        let numbers = [3, 5, 1, 0, 9, 7, 8, 6, 4, 2]
    let index = binarySearchRecursive(values: sortedNumbers, target: 9, range: 0..<sortedNumbers.count)
    print(index!)
}
testBinarySearchRecursive()
let testRange = 3..<5

//: [Next](@next)
