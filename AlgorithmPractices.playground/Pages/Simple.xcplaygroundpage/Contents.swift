//: [Previous](@previous)

import Foundation

//递归，会有重复计算、栈溢出等问题
func fibonacciRecusive(_ n: Int) -> Int {
        if n <= 0 {
            return 0
        }
        if n == 1 {
            return 1
        }
        return fibonacciRecusive(n - 1) + fibonacciRecusive(n - 2)
}
fibonacciRecusive(9)

func fibonacciIteration(n: Int) -> Int {
    if n == 0 {
        return 0
    } else if n == 1 {
        return 1
    }
    var resultArray = [Int]()
    for i in 0...n {
        if i == 0 {
            resultArray.append(0)
        }else if i == 1 {
            resultArray.append(1)
        }else {
            let value = resultArray[i - 1] + resultArray[i - 2]
            resultArray.append(value)
        }
    }
    return resultArray[n - 1] + resultArray[n - 2]
}
fibonacciIteration(n: 9)

//“请实现一个函数，输入一个整数，输出该数二进制表示中1的个数。例如把9表示成二进制是1001，有2位是1。因此如果输入9，该函数输出2。”
func binaryOneCount(_ number: Int) -> Int {
    var count = 0
    var num = number

    while num > 0 {
        count += num & 1 // 使用位运算符 & 检查当前位是否为1
        num >>= 1 // 将num右移一位，丢弃最低位
    }

    return count
}
binaryOneCount(9)

//: [Next](@next)
