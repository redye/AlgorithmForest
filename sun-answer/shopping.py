#!/opt/homebrew/bin/python3
# -*- coding: utf-8 -*-

# 抽象为背包问题：
# 要满足活动门槛，则背包的最大容量应该为商品的总个数 j，我们需要找出满足门槛时所需要花费的金额最小的商品组合
# 假设每个商品的重量为 w, 则 w = 1(购物车下单时商品选择时会忽略件数，所有可以认为每个商品的重量为 1), 价格为 v
#
# 我们分为两步来解决：
# 第一步：列举出在购物车在添加商品 [1-w] 件下商品的所有最大金额
# dp[i][j] 表示从下标 [0-i] 的物品里任意取，放进容量为 j 的背包，价值总和最大是多少
# 不放物品 i，dp[i][j] = dp[i-1][j]
# 放物品 i，则 dp[i][j] = min{dp[i-1][j], dp[i-1][j-w[i]] + v[i]}
# 所以递归公示 dp[i][j] = min{dp[i-1][j], dp[i-1][j-1] + v[i]}
def dp(goodsList, threshold):
    count = len(goodsList)
    w = [1] * count
    v = list(map(value, goodsList))
    bagweight = count

    dp = []
    for i in range(len(goodsList)):
        dp.append([0] * (bagweight + 1))

    print('初始化前 dp: ', dp)
    print('初始化前 w: ', w)
    print('初始化前 v: ', v)

    j = w[0]
    while j <= bagweight:
        dp[0][j] = v[0]
        j += 1

    print('初始化后 dp: ', dp)

    goodsMaps = []

    # 遍历物品
    for i in range(1, len(w)):
        curWeight = w[i]
        goodsIndexs = []
        count = 0
        for j in range(0, bagweight + 1):
            # 当前背包容量小于物品件数，则不能放下物品
            if j < curWeight:
                dp[i][j] = dp[i-1][j]
            else: # 背包容量大于等于物品件数，可以放下
                dp[i][j] = max(dp[i-1][j], dp[i-1][j-curWeight] + v[i])
            
            if j > 0:
                goodsIndexs.append(i - count)
                count += 1

            # print('商品组合：', goodsIndexs)
            # 这里跳出循环，表明当前添加的商品总额是最小且满足优惠门槛
            if dp[i][j] >= threshold:
                print('满足门槛的商品组合：', goodsIndexs)
                goodsMaps.append(goodsIndexs)
                break

    print('遍历物品后 dp: ', dp)

    def goodsName(index):
        return goodsList[index][0]

    res = list(map(goodsName, goodsIndexs))

    print('商品组合：', res)
    return res
    

def value(item):
    return item[1]

def runCases():
    pass
    

if __name__ == '__main__':
    print('\n开始运行...\n\n')
    # if runCases():
    #     print('\n\n测试通过 😄😄😄😄')

    
    dp([('A', 1), ('B', 2), ('C', 2), ('D', 4)], 4)

    print('\n\n运行结束')