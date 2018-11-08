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

}
