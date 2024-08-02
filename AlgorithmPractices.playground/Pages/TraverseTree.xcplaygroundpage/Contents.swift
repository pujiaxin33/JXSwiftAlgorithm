//: [Previous](@previous)

import Foundation

class RecursivePreorderTraversal: TreeTraversal {
    override class func traverse(_ root: TreeNode?) -> [Int] {
        var result: [Int] = []
        _preorderTraversal(root, &result)
        return result
    }
    
    class func _preorderTraversal(_ root: TreeNode?, _ result: inout [Int]) {
        guard let root else {
            return
        }
        result.append(root.val)
        _preorderTraversal(root.left, &result)
        _preorderTraversal(root.right, &result)
    }
}
RecursivePreorderTraversal.run()

class PreorderTraversal: TreeTraversal {
    override class func traverse(_ root: TreeNode?) -> [Int] {
        guard let root else {
            return []
        }
        var result: [Int] = []
        var stack: [TreeNode] = []
        var currentNode: TreeNode? = root
        while stack.isEmpty == false || currentNode != nil {
            while currentNode != nil {
                stack.append(currentNode!)
                result.append(currentNode!.val)
                currentNode = currentNode?.left
            }
            currentNode = stack.popLast()?.right
        }
        
        return result
    }
}
PreorderTraversal.run()

func _inorderTraversal(_ root: TreeNode?, _ result: inout [Int]) {
    guard let root else {
        return
    }
    _inorderTraversal(root.left, &result)
    result.append(root.val)
    _inorderTraversal(root.right, &result)
}

class RecursiveInorderTraversal: TreeTraversal {
    override class func traverse(_ root: TreeNode?) -> [Int] {
        var result: [Int] = []
        _inorderTraversal(root, &result)
        return result
    }
    
    class func _inorderTraversal(_ root: TreeNode?, _ result: inout [Int]) {
        guard let root else {
            return
        }
        _inorderTraversal(root.left, &result)
        result.append(root.val)
        _inorderTraversal(root.right, &result)
    }
}
RecursiveInorderTraversal.run()

class InorderTraversal: TreeTraversal {
    override class func traverse(_ root: TreeNode?) -> [Int] {
        var stack: [TreeNode] = []
        var result: [Int] = []
        var currentNode = root
        while stack.isEmpty == false || currentNode != nil {
            while currentNode != nil {
                stack.append(currentNode!)
                currentNode = currentNode?.left
            }
            let tmp = stack.popLast()
            if let tmp {
                result.append(tmp.val)
            }
            currentNode = tmp?.right
        }
        return result
    }
}
InorderTraversal.run()

class RecursivePostorderTraversal: TreeTraversal {
    override class func traverse(_ root: TreeNode?) -> [Int] {
        var result: [Int] = []
        _postorderTraversal(root, &result)
        return result
    }
    
    class func _postorderTraversal(_ root: TreeNode?, _ result: inout [Int]) {
        guard let root else {
            return
        }
        _inorderTraversal(root.left, &result)
        _inorderTraversal(root.right, &result)
        result.append(root.val)
    }
}
RecursivePostorderTraversal.run()

class PostorderTraversal: TreeTraversal {
    override class func traverse(_ root: TreeNode?) -> [Int] {
        var stack: [TreeNode] = []
        var result: [Int] = []
        var currentNode = root
        var previousNode: TreeNode?
        while stack.isEmpty == false || currentNode != nil {
            while currentNode != nil {
                stack.append(currentNode!)
                currentNode = currentNode?.left
            }
            
            //拿出栈顶第一个node开始处理
            currentNode = stack.popLast()
            //右边没有了，或者右边处理完了。previousNode就是上一个被处理完的node
            if currentNode?.right == nil || currentNode!.right == previousNode {
                result.append(currentNode!.val)
                previousNode = currentNode
                currentNode = nil
            } else {
                //当前Node的right还没有被处理完，那就把currentNode再放回stack，转头继续处理right
                stack.append(currentNode!)
                currentNode = currentNode?.right
            }
            
        }
        return result
    }
}
PostorderTraversal.run()

class BreadthFirstTraversal: TreeTraversal {
    override class func traverse(_ root: TreeNode?) -> [Int] {
        guard let root else {
            return []
        }
        var result: [Int] = []
        var stack: [TreeNode] = [root]
        
        while stack.isEmpty == false {
            var nextLevelStack: [TreeNode] = []
            for node in stack {
                result.append(node.val)
                if let node = node.left {
                    nextLevelStack.append(node)
                }
                if let node = node.right {
                    nextLevelStack.append(node)
                }
            }
            stack = nextLevelStack
        }
        
        return result
    }
}
BreadthFirstTraversal.run()


//: [Next](@next)
