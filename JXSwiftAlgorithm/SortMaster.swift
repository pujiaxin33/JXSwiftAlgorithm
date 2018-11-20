//
//  SortMaster.swift
//  JXSwiftAlgorithm
//
//  Created by jiaxin on 2018/11/20.
//  Copyright © 2018 jiaxin. All rights reserved.
//

import Foundation

class SortMaster {
    static func maopaoSort() {
        var numbers = [3, 5, 1, 0, 9, 7, 8, 6, 4, 2]
        for i in 0..<(numbers.count - 1) {
            for j in 0..<(numbers.count - 1 - i) {
                if numbers[j] > numbers[j + 1] {
                    numbers.swapAt(j, j + 1)
                }
            }
        }
        print(numbers)
    }
}
