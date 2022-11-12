#!/opt/homebrew/bin/python3
# -*- coding: utf-8 -*-


class TreeNode(object):
	def __init__(self, val=0, left=None, right=None):
		self.val = val
		self.left = left
		self.right = right


# 数组构建完全二叉树：
# 完全二叉树的特性：左孩子的下标为 2i+1，有孩子的下标为 2i+2
def buildTree(list):
	if list is None or len(list) == 0:
		return None

	root = None
	tree = []
	for i in range(len(list)):
		if list[i] is None:
			node = None
		else:
			node = TreeNode(list[i])
		tree.append(node)
		if i > 0:
			if i % 2 == 1: # 左孩子
				pIndex = int((i - 1) / 2)
				parent = tree[pIndex]
				parent.left = node
			else: # 右孩子
				pIndex = int((i - 2) / 2)
				parent = tree[pIndex]
				parent.right = node
		else:
			root = node

	return root

# 前序遍历	
def preorderTraversal(root):
	if root is None:
		return []
	
	val = [root.val]
	left = preorderTraversal(root.left)
	right = preorderTraversal(root.right)
	
	return val + left + right



if __name__ == '__main__':
	root = buildTree([1, 2, 3, 4, 5, 6, None, 8])
	r = preorderTraversal(root)
	print(r)
