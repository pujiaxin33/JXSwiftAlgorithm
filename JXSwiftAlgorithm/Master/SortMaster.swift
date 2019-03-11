//
//  SortMaster.swift
//  JXSwiftAlgorithm
//
//  Created by jiaxin on 2018/11/20.
//  Copyright © 2018 jiaxin. All rights reserved.
//

import Foundation

class SortMaster {

    /// 学术名：冒泡排序
    /// 简介：每次循环，依次比较当前和下一个数，当前大于下一个数就交换。每次循环结束之后，当前最大的数，就冒到当前最后面了。
    /// 复杂度：时间复杂度O(n^2)   空间复杂度O(0)
    static func bubble() {
        var numbers = [3, 5, 1, 0, 9, 7, 8, 6, 4, 2]
        _bubble(numbers: &numbers)
    }

    static func _bubble( numbers: inout [Int]) {
        guard numbers.count > 1 else {
            return
        }
        for i in 0..<numbers.count - 1 {
            //n - 1
            var sorted = true
            for j in 0..<numbers.count - 1 - i {
                //n - 1 - i
                if numbers[j] < numbers[j + 1] {
                    numbers.swapAt(j, j + 1)
                    sorted = false
                }
            }
            if sorted {
                //提前退出
                break
            }
        }
        print(numbers)
    }


    /// 学术名：选择排序
    /// 简介：每次从当前index后面选择出最小的数，将其放到当前有序数组的后面
    /// 复杂度：时间复杂度O(n^2)  空间复杂度O(1)
    static func selection() {
        var numbers = [3, 5, 1, 0, 9, 7, 8, 6, 4, 2]
        _selection(numbers: &numbers)
    }

    static func _selection(numbers: inout [Int]) {
        guard numbers.count > 1 else {
            return
        }

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

        //另一种思路
//        for i in 0..<numbers.count - 1 {
//            for j in i+1..<numbers.count {
//                if numbers[i] > numbers[j] {
//                    numbers.swapAt(i, j)
//                }
//            }
//        }
        print(numbers)
    }


    /// 插入排序
    /// 依次获取未排序好的数组的元素，然后从后往前扫描排序好的数组，并与之对比，将新元素插入到合适的位置
    /// 时间复杂度：最好O(n)，最坏O(n^2)
    static func insert() {
        var numbers = [3, 5, 1, 0, 9, 7, 8, 6, 4, 2]
        _insert(numbers: &numbers)
        print(numbers)
    }

    private static func _insert(numbers: inout [Int]) {
        guard numbers.count > 1 else {
            return
        }
        for currentIndex in 1..<numbers.count {
            //n-1
            var compareIndex = currentIndex
            //像这种index需要从后往前遍历的，就用while循环
            while compareIndex >= 1 {
                //0-currentIndex
                if numbers[compareIndex] < numbers[compareIndex - 1] {
                    numbers.swapAt(compareIndex, compareIndex - 1)
                }
                compareIndex -= 1
            }
//            repeat {
//                if numbers[compareIndex] < numbers[compareIndex - 1] {
//                    numbers.swapAt(compareIndex, compareIndex - 1)
//                }
//                compareIndex -= 1
//            }while compareIndex >= 1
        }
    }

    /// 学术名：快速排序
    /// 简介：主要运用了分治思想，把问题规模缩小，再分开解决。找到一个基准值，小于基准值放在左边，大于则放到右边。接着递归排序拆分开的两个数组
    /// 复杂度：时间复杂度：最坏，每次的基准值都是当前最大数，O(n^2)。最好，已经排序好了，且基准值每次都是中间，O(nlogn)
    static func quick() {
        var numbers = [3, 5, 1, 0, 9, 7, 8, 6, 4, 2]
        quick(numbers: &numbers, start: 0, end: numbers.count - 1)
        print(numbers)
    }

    private static func quick( numbers: inout [Int], start: Int, end: Int) {
        if start >= end {
            return
        }
        let baseNumber = numbers[(start+end)/2]
        numbers.swapAt(start, (start+end)/2)
        var leftIndex = start
        var rightIndex = end
        //主要思想就是拿着基准数去跟左右两边的数组对比，而不是左右两边的数字找基准数对比，移动的是基准数
        while leftIndex < rightIndex {
            while leftIndex < rightIndex && numbers[rightIndex] > baseNumber {
                rightIndex -= 1
            }
            //找到右边第一个小于基准值的数字
            if leftIndex < rightIndex {
                numbers.swapAt(leftIndex, rightIndex)
                leftIndex += 1
            }

            while leftIndex < rightIndex && numbers[leftIndex] < baseNumber {
                leftIndex += 1
            }
            //找到左边第一个大于基准值的数字
            if leftIndex < rightIndex {
                numbers.swapAt(leftIndex, rightIndex)
                rightIndex -= 1
            }
        }


        quick(numbers: &numbers, start: start, end: leftIndex - 1)
        quick(numbers: &numbers, start: rightIndex + 1, end: end)
    }








}
