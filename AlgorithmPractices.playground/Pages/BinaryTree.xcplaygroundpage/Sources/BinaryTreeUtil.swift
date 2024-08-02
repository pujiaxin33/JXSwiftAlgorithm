import Foundation

public class BinaryTreeUtil {
    public static func binaryTree() -> TreeNode {
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
            if parentNode.left != nil {
                appendBinaySortTreeNode(parentNode: parentNode.left!, element: element)
            }else {
                let childNode = TreeNode()
                childNode.value = element
                parentNode.left = childNode
            }
        }else if element > parentNode.value {
            if parentNode.right != nil {
                appendBinaySortTreeNode(parentNode: parentNode.right!, element: element)
            }else {
                let childNode = TreeNode()
                childNode.value = element
                parentNode.right = childNode
            }
        }
    }
}
