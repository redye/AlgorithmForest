import Foundation

public class TreeNode {
    public var val: Int
    public var left: TreeNode?
    public var right: TreeNode?
    
    public init(_ val: Int) {
        self.val = val
        self.left = nil
        self.right = nil
    }
}

extension TreeNode: Equatable {
    static public func == (lhs: TreeNode, rhs: TreeNode) -> Bool {
        return lhs.val == rhs.val
    }
}

extension TreeNode: Hashable {
    public func hash(into hasher: inout Hasher) {
        hasher.combine(val)
    }
}

extension TreeNode {
}
