import Foundation

open class TreeTraversal {
    
    public class func run() {
        let left2Node = TreeNode(21)
        let left2RightNode = TreeNode(22)
        let left1Node = TreeNode(11, left2Node, left2RightNode)
        let right2Node = TreeNode(25)
        let right2RightNode = TreeNode(39)
        let rightNode = TreeNode(35, right2Node, right2RightNode)
        let rootNode = TreeNode(3, left1Node, rightNode)
        let result = traverse(rootNode)
        print("\(self) result:\(result)")
    }
    
    open class func traverse(_ root: TreeNode?) -> [Int] {
        return []
    }
}
