//
//  JXSwiftAlgorithmDefines.swift
//  JXSwiftAlgorithm
//
//  Created by jiaxin on 2019/3/8.
//  Copyright © 2019 jiaxin. All rights reserved.
//

import Foundation

protocol AlgorithmType {
    var name: String { get }
}

enum SortAlgorithm: String, AlgorithmType {
    case maopao = "冒泡排序"
    case selection = "选择排序"
    case insert = "插入排序"
    case shellInsert = "希尔排序"
    case quick = "快速排序"
    case merge = "归并排序"

    var name: String {
        return self.rawValue
    }
}

enum BinaryTreeAlgorithm: String, AlgorithmType {
    case search                 = "查找"
    case searchNodeAtIndex      = "根据index按层次查找node"
    case preIterate             = "先序遍历"
    case middleIterate          = "中序遍历"
    case lastIterate            = "后序遍历"
    case reverseTree            = "反转二叉树"

    var name: String {
        return self.rawValue
    }
}

enum SearchAlgorithm: String, AlgorithmType {
    case binaryRecursive            = "二分递归查找"
    case binaryIterative            = "二分迭代查找"
    case twoDimensionArray          = "二维数组查找"
    case rotateBinarySearch         = "搜索旋转排序数组"

    var name: String {
        return self.rawValue
    }
}

enum TopicAlgorithm: String, AlgorithmType {
    case binaryOneCount             = "整数二进制1的个数"

    var name: String {
        return self.rawValue
    }
}


