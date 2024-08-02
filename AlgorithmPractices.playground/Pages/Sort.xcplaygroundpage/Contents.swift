//: [Previous](@previous)

import Foundation

/// 学术名：冒泡排序
/// 简介：每次循环，依次比较当前和下一个数，当前大于下一个数就交换。每次循环结束之后，当前最大的数，就冒到当前最后面了。
/// 复杂度：时间复杂度O(n^2)   空间复杂度O(1)
class BubbleSort: SortAlgorithm {
    
    override class func sortNumbers( _ numbers: [Int]) -> [Int] {
        guard numbers.count > 1 else { return numbers }
        var numbers = numbers
        let maxIndex = numbers.count - 1
        for recursiveTimes in 0...(maxIndex - 1) {
            let untilIndex = maxIndex - recursiveTimes - 1
            var isSorted = true
            for index in 0...untilIndex {
                if numbers[index] > numbers[index + 1] {
                    numbers.swapAt(index, index + 1)
                    isSorted = false
                }
            }
            if isSorted {
                break
            }
        }
        return numbers
    }
}
BubbleSort.run()

/// 学术名：选择排序
/// 简介：每次从当前index后面选择出最小的数，将其放到当前有序数组的后面
/// 复杂度：时间复杂度O(n^2)  空间复杂度O(1)
class SelectionSort: SortAlgorithm {
    override class func sortNumbers( _ numbers: [Int]) -> [Int] {
        guard numbers.count > 1 else { return numbers }
        var numbers = numbers
        let maxIndex = numbers.count - 1
        for startIndex in 0...(maxIndex - 1) {
            var minIndex = startIndex
            for nextIndex in (startIndex + 1)...maxIndex {
                if numbers[nextIndex] < numbers[minIndex] {
                    minIndex = nextIndex
                }
            }
            if minIndex != startIndex {
                numbers.swapAt(startIndex, minIndex)
            }
        }
        return numbers
    }
}
SelectionSort.run()

/// 插入排序
/// 依次获取未排序好的数组的元素，然后从后往前扫描排序好的数组，并与之对比，将新元素插入到合适的位置
/// 时间复杂度：最好O(n)，最坏O(n^2)
class InsertSort: SortAlgorithm {
    override class func sortNumbers( _ numbers: [Int]) -> [Int] {
        guard numbers.count > 1 else { return numbers }
        var numbers = numbers
        let maxIndex = numbers.count - 1
        for recursiveStartIndex in 1...maxIndex {
            var currentIndex = recursiveStartIndex
            while currentIndex >= 1 {
                if numbers[currentIndex - 1] > numbers[currentIndex] {
                    numbers.swapAt(currentIndex - 1, currentIndex)
                    currentIndex -= 1
                } else {
                    break
                }
            }
        }
        return numbers
    }
}
InsertSort.run()

/// 希尔排序(Shell Sort)
/// 又称为缩小增量排序，它是一种插入排序。它是直接插入排序算法的一种威力加强版。时间复杂度介于 O(n log^2 n) 和 O(n^2) 之间
class ShellSort: SortAlgorithm {
    override class func sortNumbers( _ numbers: [Int]) -> [Int] {
        guard numbers.count > 1 else { return numbers }
        var numbers = numbers
        let maxIndex = numbers.count - 1
        
        var stride = numbers.count/2
    //    var stride = (numbers.count - 1)/2
        while stride >= 1 {
            
            for recursiveStartIndex in stride...maxIndex {
                var currentIndex = recursiveStartIndex
                while currentIndex >= stride {
                    if numbers[currentIndex - stride] > numbers[currentIndex] {
                        numbers.swapAt(currentIndex - stride, currentIndex)
                        currentIndex -= stride
                    } else {
                        break
                    }
                }
            }
            
            stride = stride/2
        }
        return numbers
    }
}
ShellSort.run()

/// 学术名：快速排序
/// 简介：主要运用了分治思想，把问题规模缩小，再分开解决。找到一个基准值，小于基准值放在左边，大于则放到右边。接着递归排序拆分开的两个数组
/// 复杂度：时间复杂度：最坏，每次的基准值都是当前最大数，O(n^2)。最好，已经排序好了，且基准值每次都是中间，O(nlogn)
class QuickSort: SortAlgorithm {
    override class func sortNumbers( _ numbers: [Int]) -> [Int] {
        var numbers = numbers
        _quick(numbers: &numbers, start: 0, end: numbers.count - 1)
        return numbers
    }

    class func _quick( numbers: inout [Int], start: Int, end: Int) {
        guard start < end else {
            return
        }
        let p = partition(numbers: &numbers, start: start, end: end)
        _quick(numbers: &numbers, start: start, end: p - 1)
        _quick(numbers: &numbers, start: p + 1, end: end)
    }
    
    class func partition(numbers: inout [Int], start: Int, end: Int) -> Int {
        let pivot = numbers[end]
        var boundaryIndex = start
        for currentIndex in start..<end {
            if numbers[currentIndex] < pivot {
                numbers.swapAt(boundaryIndex, currentIndex)
                boundaryIndex += 1
            }
        }
        numbers.swapAt(boundaryIndex, end)
        return boundaryIndex
    }
}
QuickSort.run()

// MARK: - 归并排序
class MergeSort: SortAlgorithm {
    override class func sortNumbers( _ numbers: [Int]) -> [Int] {
        return mergeSort(numbers)
    }
    
    class func mergeSort(_ array: [Int]) -> [Int] {
        guard array.count > 1 else {
            return array
        }
        
        let middleIndex = array.count/2
        let leftArray = mergeSort(Array(array[0..<middleIndex]))
        let rightArray = mergeSort(Array(array[middleIndex..<array.count]))

        return merge(leftPile: leftArray, rightPile: rightArray)
    }

    class func merge(leftPile: [Int], rightPile: [Int]) -> [Int] {
        var leftIndex: Int = 0
        var rightIndex: Int = 0
        
        var tempArray = [Int]()
        tempArray.reserveCapacity(leftPile.count + rightPile.count)
        
        while leftIndex < leftPile.count && rightIndex < rightPile.count {
            if leftPile[leftIndex] < rightPile[rightIndex] {
                tempArray.append(leftPile[leftIndex])
                leftIndex += 1
            } else if leftPile[leftIndex] > rightPile[rightIndex] {
                tempArray.append(rightPile[rightIndex])
                rightIndex += 1
            } else {
                tempArray.append(leftPile[leftIndex])
                leftIndex += 1
                tempArray.append(rightPile[rightIndex])
                rightIndex += 1
            }
            
        }
        while leftIndex < leftPile.count {
            tempArray.append(leftPile[leftIndex])
            leftIndex += 1
        }
        
        while rightIndex < rightPile.count {
            tempArray.append(rightPile[rightIndex])
            rightIndex += 1
        }
        return tempArray
    }
}
MergeSort.run()

//: [Next](@next)
