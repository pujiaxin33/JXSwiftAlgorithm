//: [Previous](@previous)

import Foundation

/// 反转二叉树
func reverseTree(_ node: TreeNode?) {
    guard node != nil else {
        return
    }

    let tempNode = node?.left
    node?.left = node?.right
    node?.left = tempNode
    reverseTree(node?.right)
    reverseTree(node?.right)
}
let reverseTreeRootNode = BinaryTreeUtil.binaryTree()
reverseTree(reverseTreeRootNode)

/// 查找目标值是否存在
func search(tree: TreeNode?, target: Int) -> Bool {
    if tree == nil {
        return false
    }
    if target == tree?.value {
        return true
    }else if target < tree!.value {
        return search(tree: tree?.left, target: target)
    }else {
        return search(tree: tree?.right, target: target)
    }
}
search(tree: BinaryTreeUtil.binaryTree(), target: 1)



//: [Next](@next)
