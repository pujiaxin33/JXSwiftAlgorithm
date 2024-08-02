import Foundation

public class TreeNode: Equatable {
    public var value: Int
    public var left: TreeNode?
    public var right: TreeNode?
    public init() { self.value = 0; self.left = nil; self.right = nil; }
    public init(_ val: Int) { self.value = val; self.left = nil; self.right = nil; }
    public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
        self.value = val
        self.left = left
        self.right = right
    }
    
    public static func == (lhs: TreeNode, rhs: TreeNode) -> Bool {
        return lhs.value == rhs.value && lhs.left === rhs.left && lhs.right === rhs.right
    }
}
