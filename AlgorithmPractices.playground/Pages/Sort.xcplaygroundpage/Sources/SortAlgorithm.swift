import Foundation

open class SortAlgorithm {
    private static var inputedNumbers = [3, 5, 1, 0, 9, 7, 8, 6, 4, 2]
    
    open class func run() {
        for _ in 0...3 {
            let numbers = inputedNumbers.shuffled()
            let result = sortNumbers(numbers)
            print("\(self) result:\(result)  inputed:\(numbers)")
        }
    }
    
    open class func sortNumbers( _ numbers: [Int]) -> [Int] {
        return numbers
    }
}
