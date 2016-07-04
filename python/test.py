#!/usr/bin/python3.5
#coding=utf-8

import os
import sys
#import MySQLdb

def test_func(var):
	print("this is a function: ", var)
	var = 12
	print("this is a function: ", var)

if __name__ == '__main__':
	print('hello world !你好')
	print('I\'m good at python')
	print(os.getcwd())
	print(os.name)
	aa, bb = os.path.split('aa/bb/cc')
	print("return values:", aa, bb)
	
	a,b,c,d,e = 'hello'
	print(a,b,c,d,e)
	
	print(sys.path)
	print("are you ok ?")
	
	age = 23
	test_func(age)
	print(age)
	
	input_str = input("\n\nPress any key to exit.\n")
	print("you entered ", input_str)
