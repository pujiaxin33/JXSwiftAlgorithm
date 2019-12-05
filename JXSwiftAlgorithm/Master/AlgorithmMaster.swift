//
//  AlgorithmMaster.swift
//  JXSwiftAlgorithm
//
//  Created by jiaxin on 2018/11/8.
//  Copyright © 2018 jiaxin. All rights reserved.
//

import Foundation

class AlgorithmMaster {
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

}
