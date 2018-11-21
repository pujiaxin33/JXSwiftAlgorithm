//
//  SortMaster.swift
//  JXSwiftAlgorithm
//
//  Created by jiaxin on 2018/11/20.
//  Copyright © 2018 jiaxin. All rights reserved.
//

import Foundation

class SortMaster {


    /// 冒泡排序
    /// 每次循环，依次比较当前和下一个数，当前大于下一个数就交换。每次循环结束之后，当前最大的数，就冒到当前最后面了。
    static func maopaoSort() {
        //时间复杂度O(n^2)
        //空间复杂度O(0)
        var numbers = [3, 5, 1, 0, 9, 7, 8, 6, 4, 2]
        for i in 0..<(numbers.count - 1) {
            //n - 1
            for j in 0..<(numbers.count - 1 - i) {
                //n - 1 - i
                if numbers[j] > numbers[j + 1] {
                    numbers.swapAt(j, j + 1)
                }
            }
        }
        print(numbers)
    }


    /// 选择排序
    /// 每次从当前index后面选择出最小的数，将其放到当前有序数组的后面
    static func chooseSort() {
        //时间复杂度O(n^2)
        //空间复杂度O(1)
        var numbers = [3, 5, 1, 0, 9, 7, 8, 6, 4, 2]
        for i in 0..<(numbers.count - 1) {
            //n - 1
            var minIndex = i
            for j in (i + 1)..<numbers.count {
                // n - i - 1
                if numbers[j] < numbers[minIndex] {
                    minIndex = j
                }
            }
            if i != minIndex {
                numbers.swapAt(i, minIndex)
            }
        }
        print(numbers)
    }


    /// 快速排序
    /// 找到一个基准值，小于基准值放在左边，大于则放到右边。接着递归排序拆分开的两个数组
    /// 时间复杂度：最坏，每次的基准值都是当前最大数，O(n^2)。最好，已经排序好了，且基准值每次都是中间，O(nlogn)
    static func quickSort() {
        var numbers = [3, 5, 1, 0, 9, 7, 8, 6, 4, 2]
        quickSort(numbers: &numbers, start: 0, end: numbers.count - 1)
        print(numbers)
    }

    static func quickSort( numbers: inout [Int], start: Int, end: Int) {
        if start >= end {
            return
        }
        let baseNumber = numbers[start]
        var i = start
        var j = end
        while i < j {
            //找到右边第一个比基准值小的数，找到就交换
            while i < j && numbers[j] > baseNumber {
                j -= 1
            }
            if i < j {
                numbers.swapAt(i, j)
                i += 1
            }
            //找到左边第一个比基准值大的数，找到就交换
            while i < j && numbers[i] < baseNumber {
                i += 1
            }
            if i < j {
                numbers.swapAt(i, j)
                j -= 1
            }
        }
        quickSort(numbers: &numbers, start: start, end: i - 1)
        quickSort(numbers: &numbers, start: i + 1, end: end)
    }








}
