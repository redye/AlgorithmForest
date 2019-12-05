import Foundation

public class TreeNode {
    public var val: Int
    public var chileren: [TreeNode]?
    
    public init(_ val: Int, _ children: [TreeNode]?) {
        self.val = val
        self.chileren = children
    }
}
