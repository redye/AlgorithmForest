function Node(val, children) {
    this.val = val;
    this.children = children;
};

/// 前序遍历
/// 入栈
let preorder = function(root) {
    if (!root) {
        return []
    }
    let stack = [root]
    let result = []
    while (stack.length > 0) {
        let top = stack.pop()
        result.push(top.val)
        let children = top.children
        if (children.length > 0) {
            let i = top.children.length - 1
            while (i >= 0) {
                stack.push(children[i--])
            }
        }
    }
    return result
}

/// 递归
let preorder2 = function(root) {
    if (!root) {
        return []
    }
    let result = [root.val]
    if (root.children) {
        for (let i = 0; i < root.children.length; i++) {
            let child = preorder2(root.children[i])
            result = result.concat(child)
        }
    }
    return result
}

/// 后序遍历
let postorder = function(root) {
    if (!root) {
        return []
    }
    let cur = [root.val]
    let children = root.children
    let result = []
    if (children) {
        for (let i = 0; i < children.length; i ++) {
            let child = postorder(children[i])
            result = result.concat(child)
        }
    } else {
        result = cur
    }
    result = result.concat(cur)
    return result
}

/// 入栈
let postorder2 = function(root) {
    if (!root) {
        return []
    }
    let stack = [root]
    let result = []
    while (stack.length > 0) {
        let top = stack.pop()
        result.push(top.val)
        let children = top.children 
        if (children) {
            for (let i = 0; i < children.length; i++) {
                stack.push(children[i])
            }
        }
    }
    return result.reverse()
}

/// 层次遍历
let levelOrder = function(root) {
    if (!root) {
        return []
    }
    let queue = [root]
    let level = 0
    let levels = []
    while (queue.length > 0) {
        levels.push([])
        let len = queue.length
        for (let i = 0; i < len; i ++) {
            let node = queue.shift()
            levels[level].push(node.val)
            if (node.children) {
                queue = queue.concat(node.children)
            }
        }
        level += 1
    }
    return levels
}

/// 递归
let levelOrder2 = function(root) {
    if (!root) {
        return []
    }
    let levels = []
    function innerOrder(root, level) {
        if (levels.length == level) {  
            levels.push([])
        }
        levels[level].push(root.val)
        if (root.children) {
            for (let i = 0; i < root.children.length; i ++) {
                innerOrder(root.children[i], level + 1)
            }
        }
    }
    innerOrder(root, 0)
    return levels
}