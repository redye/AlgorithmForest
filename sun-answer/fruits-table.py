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


def pickFruits():
    pass
	
	

if __name__ == '__main__':
    fruits = [
        ["入口", "苹果", "梨", "桃子", "苹果"],
        ["梨", "桃子", "苹果", "桃子", "苹果"],
        ["梨", "梨", "苹果", "苹果", "桃子"],
        ["苹果", "桃子", "梨", "桃子", "梨"]
    ]
    X = 4
    Y = 5



    print(priceTables(fruits))