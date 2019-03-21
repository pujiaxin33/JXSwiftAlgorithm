//
//  BinaryTreeMaster.swift
//  JXSwiftAlgorithm
//
//  Created by jiaxin on 2019/3/21.
//  Copyright © 2019 jiaxin. All rights reserved.
//

import Foundation

class TreeNode {
    var value: Int = 0
    var leftChildNode: TreeNode?
    var rightChildNode: TreeNode?
}

class BinaryTreeMaster {

    static func binarySortTree() -> TreeNode {
        let elements = [7, 3, 9 , 1, 5, 10, 2, 8, 4, 6]
        return createBinaySortTree(elements: elements)!
    }

    /// 根据传入的数组创建一个二叉排序树🌲
    static func createBinaySortTree(elements: [Int]) -> TreeNode? {
        guard !elements.isEmpty else {
            return nil
        }
        let rootNode = TreeNode()
        rootNode.value = elements.first!
        for i in 1..<elements.count {
            appendBinaySortTreeNode(parentNode: rootNode, element: elements[i])
        }
        return rootNode
    }

    static func appendBinaySortTreeNode(parentNode: TreeNode, element: Int) {
        if element < parentNode.value {
            if parentNode.leftChildNode != nil {
                appendBinaySortTreeNode(parentNode: parentNode.leftChildNode!, element: element)
            }else {
                let childNode = TreeNode()
                childNode.value = element
                parentNode.leftChildNode = childNode
            }
        }else if element > parentNode.value {
            if parentNode.rightChildNode != nil {
                appendBinaySortTreeNode(parentNode: parentNode.rightChildNode!, element: element)
            }else {
                let childNode = TreeNode()
                childNode.value = element
                parentNode.rightChildNode = childNode
            }
        }
    }

    /// 查找目标值是否存在
    static func search(tree: TreeNode?, target: Int) -> Bool {
        if tree == nil {
            return false
        }
        if target == tree?.value {
            return true
        }else if target < tree!.value {
            return search(tree: tree?.leftChildNode, target: target)
        }else {
            return search(tree: tree?.rightChildNode, target: target)
        }
    }

    /// 按层寻找目标index的treeNode
    /// 因为是按层次查找，所以不能用递归
    static func treeNode(at index: Int, rootNode: TreeNode) -> TreeNode? {
        guard index >= 0 else {
            return nil
        }

        var tempArray = [TreeNode]()
        tempArray.append(rootNode)
        var targetNode: TreeNode?
        var targetIndex = index
        while !tempArray.isEmpty {
            let firstNode = tempArray.first
            if targetIndex == 0 {
                targetNode = firstNode
                break
            }
            tempArray.removeFirst()
            targetIndex -= 1

            if firstNode?.leftChildNode != nil {
                tempArray.append(firstNode!.leftChildNode!)
            }
            if firstNode?.rightChildNode != nil {
                tempArray.append(firstNode!.rightChildNode!)
            }
        }
        return targetNode
    }

    /// 先序遍历，先遍历左子节点，再遍历右子节点
    static func preIterateTree(node: TreeNode?, handler: ((TreeNode)->())?) {
        guard node != nil else {
            return
        }
        handler?(node!)
        preIterateTree(node: node?.leftChildNode, handler: handler)
        preIterateTree(node: node?.rightChildNode, handler: handler)
    }

    /// 中序遍历，先遍历左子节点，再遍历根节点，最后遍历右子节点
    /// 对于排序二叉树的中序遍历结果，就是从小到大的排序
    static func middleIterateTree(node: TreeNode?, handler: ((TreeNode)->())?) {
        guard node != nil else {
            return
        }
        middleIterateTree(node: node?.leftChildNode, handler: handler)
        handler?(node!)
        middleIterateTree(node: node?.rightChildNode, handler: handler)
    }

    /// 后序遍历，先遍历子左节点，然后右子节点，最后根节点。前中后序遍历，都是针对根节点的遍历顺序而言的。比如后序遍历，就是其根节点最后遍历
    static func lastIterateTree(node: TreeNode?, handler: ((TreeNode)->())?) {
        guard node != nil else {
            return
        }
        lastIterateTree(node: node?.leftChildNode, handler: handler)
        lastIterateTree(node: node?.rightChildNode, handler: handler)
        handler?(node!)
    }

    /// 反转二叉树
    static func reverseTree(node: TreeNode?) {
        guard node != nil else {
            return
        }

        let tempNode = node?.leftChildNode
        node?.leftChildNode = node?.rightChildNode
        node?.rightChildNode = tempNode
        reverseTree(node: node?.leftChildNode)
        reverseTree(node: node?.rightChildNode)
    }
}
