//
//  AlgorithmMaster.swift
//  JXSwiftAlgorithm
//
//  Created by jiaxin on 2018/11/8.
//  Copyright © 2018 jiaxin. All rights reserved.
//

import Foundation

class AlgorithmMaster {

    //“题目：在一个二维数组中，每一行都按照从左到右递增的顺序排序，每一列都按照从上到下递增的顺序排序。请完成一个函数，输入这样的一个二维数组和一个整数，判断数组中是否含有该整数。”
    //对于题目的思考可以按步找到关键点，比如需要调整行列，跟目标值进行对比，不同的结果需要做出不同的调整。
    //通过按步思考之后，应当抽象出关键的操作。比如等于就是找到了，大于就列数减少，小于就行数增加。
    static func testTwoDimensionArrayFind() {
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

    static func fibonacci(n: Int) -> Int {
        //递归，会有重复计算、栈溢出等问题
//        if n <= 0 {
//            return 0
//        }
//        if n == 1 {
//            return 1
//        }
//        return fibonacci(n: n - 1) + fibonacci(n: n - 2)

        var resultArray = [Int]()
        var result = 0
        for i in 0...n {
            if i == 0 {
                resultArray.append(0)
                result += 0
            }else if i == 1 {
                resultArray.append(1)
                result += 1
            }else {
                let value = resultArray[i - 1] + resultArray[i - 2]
                resultArray.append(value)
                result += value
            }
        }
        return result
    }

    /// 使用递归实现二分查找
    ///
    /// - Parameters:
    ///   - values: 输入的数组必须是已经排序好的数组
    ///   - target: 目标值
    ///   - range: 目标范围
    /// - Returns: 返回目标值的index
    static func binarySearchRecursive<T:Comparable>(values: [T], target: T, range: Range<Int>) -> Int?{
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

    /// 二分查找循环迭代实现
    static func binarySearchIterative<T: Comparable>(values: [T], target: T) -> Int? {
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

}
