//: [Previous](@previous)

import Foundation

//383：给你两个字符串：ransomNote 和 magazine ，判断 ransomNote 能不能由 magazine 里面的字符构成。
//
//如果可以，返回 true ；否则返回 false 。
//
//magazine 中的每个字符只能在 ransomNote 中使用一次。
func testConstructTwoString383() {
    func canConstruct(_ ransomNote: String, _ magazine: String) -> Bool {
        var ransomMap: [Character: Int] = [:]
        var magazineMap: [Character: Int] = [:]
        for cha in ransomNote {
            if let count = ransomMap[cha] {
                ransomMap[cha] = count + 1
            } else {
                ransomMap[cha] = 1
            }
        }
        for cha in magazine {
            if let count = magazineMap[cha] {
                magazineMap[cha] = count + 1
            } else {
                magazineMap[cha] = 1
            }
        }
        var result = true
        for key in ransomMap.keys {
            if (ransomMap[key] ?? 0) > (magazineMap[key] ?? 0) {
                result = false
                break
            }
        }
        return result
    }
    
    func canConstruct2(_ ransomNote: String, _ magazine: String) -> Bool {
        var magazineMap: [Character: Int] = [:]
        
        for cha in magazine {
            if let count = magazineMap[cha] {
                magazineMap[cha] = count + 1
            } else {
                magazineMap[cha] = 1
            }
        }
        
        var result = true
        for cha in ransomNote {
            let count = magazineMap[cha] ?? 0
            magazineMap[cha] = count - 1
            if (magazineMap[cha] ?? 0) < 0 {
                result = false
                break
            }
        }
        return result
    }
    
    let ransomNote = "aa"
    let magazine = "aab"
    print(canConstruct(ransomNote, magazine))
}
testConstructTwoString383()

//: [Next](@next)
