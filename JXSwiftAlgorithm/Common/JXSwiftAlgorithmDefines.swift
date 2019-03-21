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
    case shellInsert            //希尔排序
    case quick                  //快速
    case merge                  //归并
}

enum AlgorithmBinarySortTreeType: AlgorithmType {
    case search                 //查找
    case searchNodeAtIndex      //根据index按层次查找node
    case preIterate             //先序遍历
    case middleIterate          //中序遍历
    case lastIterate            //后序遍历
}

enum AlgorithmSearchType: AlgorithmType {
    case binaryRecursive         //二分递归查找
    case binaryIterative         //二分迭代查找
    case twoDimensionArray       //二维数组查找
}

enum AlgorithmTopicType: AlgorithmType {
    case binaryOneCount          //输入一个整数，输出该数二进制表示中1的个数
}


