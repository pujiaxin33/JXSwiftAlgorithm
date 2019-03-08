//
//  TopicMaster.swift
//  JXSwiftAlgorithm
//
//  Created by jiaxin on 2019/3/8.
//  Copyright © 2019 jiaxin. All rights reserved.
//

import Foundation

class TopicMaster {
    
    //“请实现一个函数，输入一个整数，输出该数二进制表示中1的个数。例如把9表示成二进制是1001，有2位是1。因此如果输入9，该函数输出2。”
    static func binaryOneCount() {
        let number = 31
        var count = 0
        /*
         //直接操作输入的数字，如果是负数就会无限循环
         while number != 0 {
         let value = number & 0x01
         if value == 1 {
         count += 1
         }
         number = number >> 1
         }
         */
        var base: Int = 1
        while base != 0 {
            if number & base == 1 {
                count += 1
            }
            base = base << 1
        }
        print(count)
    }
}
