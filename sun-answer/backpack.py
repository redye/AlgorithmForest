#!/opt/homebrew/bin/python3
# -*- coding: utf-8 -*-

def dp(weights, bagweight):
    # 初始化数组
    dp = []
    for i in range(len(weights)):
        dp.append([0] * (bagweight + 1))
        
    print('初始化前 dp: ', dp)

    j = weights[0][0]
    while j <= bagweight:
        dp[0][j] = weights[0][1]
        j += 1

    print('初始化后 dp: ', dp)

    # 遍历物品
    for i in range(1, len(weights)):
        curWeight = weights[i][0]
        for j in range(0, bagweight + 1):
            if j < curWeight:
                dp[i][j] = dp[i-1][j]
            else:
                dp[i][j] = max(dp[i-1][j], dp[i-1][j-curWeight] + weights[i][1])

    print('遍历物品后 dp: ', dp)


if __name__ == '__main__':
    dp([(1, 15), (3, 20), (4, 30)], 4)