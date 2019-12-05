//
//  SearchMaster.swift
//  JXSwiftAlgorithm
//
//  Created by jiaxin on 2019/3/8.
//  Copyright © 2019 jiaxin. All rights reserved.
//

import Foundation

class SearchMaster {

    static func firstBadVersion(n: Int) -> Int {
        var start = 1
        var end = n
        while start < end {
            let middle = (start + end)/2
            if isBadVerison(n: middle) {
                if !isBadVerison(n: middle - 1) {
                    return middle
                }else {
                    end = middle
                }
            }else {
                start = middle + 1
            }
        }
        if start != n && isBadVerison(n: start) {
            return start
        }
        return 1
    }

    private static func isBadVerison(n: Int) -> Bool {
        if n >= 4 {
            return true
        }
        return false
    }

    static func rotateBinarySearch(nums: [Int], target: Int) -> Int {
        if nums.isEmpty {
            return -1
        }
        var left = 0
        var right = nums.count - 1
        var middle = 0
        while left <= right {
            middle = (left + right)/2
            if nums[middle] == target {
                return middle
            }
            if nums[left] <= nums[middle] {
                //前部分有序
                if target <= nums[middle] && target >= nums[left] {
                    right = middle - 1
                }else {
                    left = middle + 1
                }
            }else {
                //后部分有序
                if target >= nums[middle] && target <= nums[right] {
                    left = middle + 1
                }else {
                    right = middle - 1
                }
            }
        }
        return -1
    }

    static func binarySearchRecursive() {
        let sortedNumbers = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
        //        let numbers = [3, 5, 1, 0, 9, 7, 8, 6, 4, 2]
        let index = _binarySearchRecursive(values: sortedNumbers, target: 9, range: 0..<sortedNumbers.count)
        print(index!)
    }

    /// 使用递归实现二分查找
    /// 输入的数组必须是已经排序好的数组，返回目标数的index
    private static func _binarySearchRecursive<T:Comparable>(values: [T], target: T, range: Range<Int>) -> Int?{
        if range.lowerBound >= range.upperBound {
            //not found
            return nil
        }
        let midIndex = range.lowerBound + (range.upperBound - range.lowerBound)/2
        if target > values[midIndex] {
            return _binarySearchRecursive(values: values, target: target, range: (midIndex + 1)..<range.upperBound)
        }else if target < values[midIndex] {
            return _binarySearchRecursive(values: values, target: target, range: range.lowerBound..<midIndex)
        }else {
            return midIndex
        }
    }

    static func binarySearchIterative() {
        let sortedNumbers = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
        //        let numbers = [3, 5, 1, 0, 9, 7, 8, 6, 4, 2]
        let index = _binarySearchIterative(values: sortedNumbers, target: 9)
        print(index!)
    }

    /// 二分查找循环迭代实现
    private static func _binarySearchIterative<T: Comparable>(values: [T], target: T) -> Int? {
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


    //“题目：在一个二维数组中，每一行都按照从左到右递增的顺序排序，每一列都按照从上到下递增的顺序排序。请完成一个函数，输入这样的一个二维数组和一个整数，判断数组中是否含有该整数。”
    //对于题目的思考可以按步找到关键点，比如需要调整行列，跟目标值进行对比，不同的结果需要做出不同的调整。
    //通过按步思考之后，应当抽象出关键的操作。比如等于就是找到了，大于就列数减少，小于就行数增加。
    static func twoDimensionArray() {
        let numbers = [[1, 2, 8, 9],
                       [2, 4, 9, 12],
                       [4, 7, 10, 13],
                       [6, 8, 11, 15]]
        let targetNumber = 11
        let maxColumn = numbers.first!.count - 1
        let maxRow = numbers.count - 1
        //从右往左比对
        var currentColumn = maxColumn
        var currentRow = 0
        /* 自己按步思考的方案
         while numbers[currentRow][currentColumn] > targetNumber  {
         currentColumn -= 1
         }
         while numbers[currentColumn][currentRow] < targetNumber {
         currentRow += 1
         }
         while currentColumn >= 0 && numbers[currentRow][currentColumn] != targetNumber   {
         currentColumn -= 1
         }
         if currentRow >= numbers.count || currentColumn < 0 {
         print("not found")
         return
         }
         if numbers[currentRow][currentColumn] == targetNumber {
         print("find number on \(currentRow):\(currentColumn)")
         }else {
         print("not found")
         }
         */
        var isExist = false
        while currentRow <= maxRow && currentColumn >= 0 {
            //确定行列的边界
            //根据对比的三种结果做出对应的调整
            if numbers[currentRow][currentColumn] == targetNumber {
                print("find number on \(currentRow):\(currentColumn)")
                isExist = true
                break
            }else if numbers[currentRow][currentColumn] > targetNumber {
                currentColumn -= 1
            }else {
                currentRow += 1
            }
        }
        if !isExist {
            print("not found")
        }
    }
}
