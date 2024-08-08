//: [Previous](@previous)

import Foundation

// 给你一个长度为 n 的整数数组，每次操作将会使 n - 1 个元素增加 1 。返回让数组所有元素相等的最小操作次数。
func minMoves(_ nums: [Int]) -> Int {
    let min = nums.min() ?? 0
    var result = 0
    for num in nums {
        result += num - min
    }
    return result
}

//minMoves([1,1000000000])
//minMoves([1,2,3])
minMoves([-1,1])

//88. 合并两个有序数组
//给你两个按 非递减顺序 排列的整数数组 nums1 和 nums2，另有两个整数 m 和 n ，分别表示 nums1 和 nums2 中的元素数目。
//
//请你 合并 nums2 到 nums1 中，使合并后的数组同样按 非递减顺序 排列。
//
//注意：最终，合并后数组不应由函数返回，而是存储在数组 nums1 中。为了应对这种情况，nums1 的初始长度为 m + n，其中前 m 个元素表示应合并的元素，后 n 个元素为 0 ，应忽略。nums2 的长度为 n 。
//示例 1：
//
//输入：nums1 = [1,2,3,0,0,0], m = 3, nums2 = [2,5,6], n = 3
//输出：[1,2,2,3,5,6]
//解释：需要合并 [1,2,3] 和 [2,5,6] 。
//合并结果是 [1,2,2,3,5,6] ，其中斜体加粗标注的为 nums1 中的元素。
//示例 2：
//
//输入：nums1 = [1], m = 1, nums2 = [], n = 0
//输出：[1]
//解释：需要合并 [1] 和 [] 。
//合并结果是 [1] 。
//示例 3：
//
//输入：nums1 = [0], m = 0, nums2 = [1], n = 1
//输出：[1]
//解释：需要合并的数组是 [] 和 [1] 。
//合并结果是 [1] 。
//注意，因为 m = 0 ，所以 nums1 中没有元素。nums1 中仅存的 0 仅仅是为了确保合并结果可以顺利存放到 nums1 中。
func testMergeTwoSortedArray() {
    func merge(_ nums1: inout [Int], _ m: Int, _ nums2: [Int], _ n: Int) {
        if n == 0 {
            return
        }
        
        let totalIndex = m + n
        for index in m..<totalIndex {
            nums1[index] = nums2[index - m]
        }
        // 从m的index开始做插入排序
        for index in m..<totalIndex {
            var i = index
            while i >= 1 {
                if nums1[i - 1] > nums1[i] {
                    nums1.swapAt(i - 1, i)
                    i -= 1
                } else {
                    break
                }
            }
        }
    }
    
    func merge2(_ nums1: inout [Int], _ m: Int, _ nums2: [Int], _ n: Int) {
        var sortedNums = Array<Int>(repeating: 0, count: m + n)
        var i = 0
        var j = 0
        var index = 0
        while i < m && j < n {
            if nums1[i] <= nums2[j] {
                sortedNums[index] = nums1[i]
                index += 1
                i += 1
            } else {
                sortedNums[index] = nums2[j]
                index += 1
                j += 1
            }
        }
        while i < m {
            sortedNums[index] = nums1[i]
            index += 1
            i += 1
        }
        while j < n {
            sortedNums[index] = nums2[j]
            index += 1
            j += 1
        }
        nums1 = sortedNums
    }
    
    func merge22(_ nums1: inout [Int], _ m: Int, _ nums2: [Int], _ n: Int) {
        var sortedNums = Array<Int>(repeating: 0, count: m + n)
        var p1 = 0
        var p2 = 0
        var currentIndex = 0
        var currentNum = 0
        while p1 < m || p2 < n {
            if p1 == m {
                currentNum = nums2[p2]
                p2 += 1
            } else if p2 == n {
                currentNum = nums1[p1]
                p1 += 1
            } else if nums1[p1] <= nums2[p2] {
                currentNum = nums1[p1]
                p1 += 1
            } else {
                currentNum = nums2[p2]
                p2 += 1
            }
            sortedNums[currentIndex] = currentNum
            currentIndex += 1
        }
        nums1 = sortedNums
    }
    
    // 逆向双指针
    func merge3(_ nums1: inout [Int], _ m: Int, _ nums2: [Int], _ n: Int) {
        var p1 = m - 1
        var p2 = n - 1
        var trail = m + n - 1
        var sortedNums = Array<Int>.init(repeating: 0, count: m + n)
        var currentNum = 0
        while p1 >= 0 || p2 >= 0 {
            if p1 == -1 {
                currentNum = nums2[p2]
                p2 -= 1
            } else if p2 == -1 {
                currentNum = nums1[p1]
                p1 -= 1
            } else if nums1[p1] > nums2[p2] {
                currentNum = nums1[p1]
                p1 -= 1
            } else {
                currentNum = nums2[p2]
                p2 -= 1
            }
            sortedNums[trail] = currentNum
            trail -= 1
        }
        nums1 = sortedNums
    }
    
    var nums1 = [1,2,3,0,0,0]
    let nums2 = [2,5,6]
    merge22(&nums1, 3, nums2, 3)
    print(nums1)
    
    var nums21 = [1]
    merge22(&nums21, 1, [], 0)
    print(nums21)
    
    var nums31 = [0]
    merge22(&nums31, 0, [1], 1)
    print(nums31)
}
testMergeTwoSortedArray()

// 27. 移除元素
//给你一个数组 nums 和一个值 val，你需要 原地 移除所有数值等于 val 的元素。元素的顺序可能发生改变。然后返回 nums 中与 val 不同的元素的数量。
//
//假设 nums 中不等于 val 的元素数量为 k，要通过此题，您需要执行以下操作：
//
//更改 nums 数组，使 nums 的前 k 个元素包含不等于 val 的元素。nums 的其余元素和 nums 的大小并不重要。
//返回 k。

func testRemoveElement27() {
    func removeElement(_ nums: inout [Int], _ val: Int) -> Int {
        guard nums.count > 0 else {
            return 0
        }
        //思路：双指针。leftIndex只要等于val，就把rightIndex的值交换过来（不管右边的值是否等于val）
        var leftIndex = 0
        var rightIndex = nums.count - 1
        //循环之前设定终止条件
        while leftIndex <= rightIndex {
            if nums[leftIndex] == val {
                nums[leftIndex] = nums[rightIndex]
                rightIndex -= 1
            } else {
                leftIndex += 1
            }
        }
        return leftIndex
    }
    func removeElement2(_ nums: inout [Int], _ val: Int) -> Int {
        //遍历整个数组，leftIndex就是等于val的值，被遍历的值只要不等于val，就填充到leftIndex
        var leftIndex = 0
        for index in 0..<nums.count {
            if nums[index] != val {
                nums[leftIndex] = nums[index]
                leftIndex += 1
            }
        }
        return leftIndex
    }
    
    var nums = [3,2,2,3]
    removeElement2(&nums, 3)
    print(nums)
}
testRemoveElement27()

//: [Next](@next)

