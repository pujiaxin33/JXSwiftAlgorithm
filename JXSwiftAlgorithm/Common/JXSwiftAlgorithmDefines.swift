//
//  JXSwiftAlgorithmDefines.swift
//  JXSwiftAlgorithm
//
//  Created by jiaxin on 2019/3/8.
//  Copyright © 2019 jiaxin. All rights reserved.
//

import Foundation

protocol AlgorithmType {
}

struct AlgorithmCellModel<T: AlgorithmType> {
    var name: String?
    var type: T?
}

enum AlgorithmSortType: AlgorithmType {
    case maopao                 //冒泡
    case selection              //选择
    case insert                 //插入
    case quick                  //快速
}

enum AlgorithmSearchType: AlgorithmType {
    case binaryRecursive         //二分递归查找
    case binaryIterative         //二分迭代查找
    case twoDimensionArray       //二维数组查找
}

enum AlgorithmTopicType: AlgorithmType {
    case binaryOneCount          //输入一个整数，输出该数二进制表示中1的个数
}


