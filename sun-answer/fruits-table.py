#!/opt/homebrew/bin/python3
# -*- coding: utf-8 -*-

maps = {"入口": 0, "苹果": 4, "桃子": 2, "梨": 3} 

def priceTables(furitsTable):
    if not furitsTable:
        return None

    def convert(x):
        if not x:
            return None
        return maps[x]

    def convertList(fruits):
        if not fruits:
            return None
        return list(map(convert, fruits))

    return list(map(convertList, furitsTable))




def pickFruits(fruits):
    prices = priceTables(fruits)
    m = len(fruits)
    n = len(fruits[0])
    ans = 0

    # 上下左右4个方向都可以走
    dirs = [(-1, 0), (1, 0), (0, -1), (0, 1)]

    def dfs(x, y, isPick, total):
        rec = prices[x][y]
        if isPick:
            total += prices[x][y]
            prices[x][y] = 0
        
        ans = max(ans, total)

        d = 0
        while d < 4:
            nx = x + dirs[d][0]
            ny = y + dirs[d][1]
            d += 1
            if nx >= 0 and ny >=0 and ny < n and prices[x][y] > 0:
                dfs(x, y, True, total)
                dfs(x, y, False, total)
            

        

        


	
	

if __name__ == '__main__':
    fruits = [
        ["入口", "苹果", "梨", "桃子", "苹果"],
        ["梨", "桃子", "苹果", "桃子", "苹果"],
        ["梨", "梨", "苹果", "苹果", "桃子"],
        ["苹果", "桃子", "梨", "桃子", "梨"]
    ]

    print(priceTables(fruits))