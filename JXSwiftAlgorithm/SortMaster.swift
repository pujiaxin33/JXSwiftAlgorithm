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
}
