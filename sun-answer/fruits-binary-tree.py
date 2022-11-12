#!/opt/homebrew/bin/python3
# -*- coding: utf-8 -*-

class TreeNode(object):
	def __init__(self, val=0, left=None, right=None):
		self.val = val
		self.left = left
		self.right = right


# 数组构建完全二叉树：
# 完全二叉树的特性：左孩子的下标为 2i+1，右孩子的下标为 2i+2
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

maps = {"入口": 0, "苹果": 4, "桃子": 2, "梨": 3} 
maxTotal = 0

def priceConvert(furits):
	if not furits:
		return None

	def convert(x):
		if not x:
			return None
		return maps[x]
	
	return list(map(convert, furits))
	

# 不限制相邻果树采摘情况下所能采摘的最大金额
# 前序遍历，每个叶子结点作为出口，遍历每条道路上所能采摘的金额，取最大值
def pickFruits(root, total, canVisited):
	global maxTotal

	if root is None: # 已经到叶子结点，出口
		maxTotal = max(maxTotal, total)
		return total
	
	if canVisited:
		total += root.val

	pickFruits(root.left, total, not canVisited)

	pickFruits(root.right, total, not canVisited)

	return maxTotal

def getMaxAmount(fruits):
	global maxTotal
	maxTotal = 0
	prices = priceConvert(fruits)
	tree = buildTree(prices)
	t1 = pickFruits(tree, 0, True)
	t2 = pickFruits(tree, 0, False)
	t = max(t1, t2)
	
	return t

def runcases():
	fruitsList = [
		["入口", "苹果", "桃子", "梨", "桃子", "苹果", "梨", None, None, "苹果", None, None, "梨"],
		["入口", "苹果", "梨", "梨", "桃子", "苹果", "梨", None, None, "桃子", None, None, "梨", None, "苹果"],
		["入口", "桃子", "苹果", "梨", "桃子", "苹果", "梨"],
		["入口", "桃子", "桃子", "苹果", "梨", "桃子", "梨"]
	]
	result = [8, 7, 4, 4]
	
	for i in range(len(fruitsList)):
		r = getMaxAmount(fruitsList[i])
		if r == result[i]:
			pass
		else:
			print('第 %s 个 case 失败，当前结果：%s；预期结果：%s' % (i, r, result[i]))
			return

	print("运行通过 😄😄😄😄")


if __name__ == '__main__':
	print('\n开始运行...\n\n')
	runcases()
	print('\n\n运行结束')

