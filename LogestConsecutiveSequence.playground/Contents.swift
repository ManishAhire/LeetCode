import UIKit

/*
 
 Given an unsorted array of integers nums, return the length of the longest consecutive elements sequence.

 You must write an algorithm that runs in O(n) time.

 
 Example 1:

 Input: nums = [100,4,200,1,3,2]
 Output: 4
 
 Explanation: The longest consecutive elements sequence is [1, 2, 3, 4]. Therefore its length is 4.
 
 Example 2:

 Input: nums = [0,3,7,2,5,8,4,6,0,1]
 Output: 9
 
 Example 3:

 Input: nums = [1,0,1,2]
 Output: 3
 
 */

func longestConsecutive(_ nums: [Int]) -> Int {
        
    guard !nums.isEmpty else {  return 0 }
    
//    let set = Set(nums)
//    let sortedArray = Array(set.sorted())
//    
//    var longestLength = 1
//    for i in 1..<sortedArray.count {
//        
//        if sortedArray[i] == sortedArray[i-1] + 1 {
//            longestLength += 1
//        } else {
//            
//            if i != sortedArray.count {
//                if sortedArray[i] == sortedArray[i+1] - 1 {
//                    longestLength = 1
//                } else {
//                    return longestLength
//                }
//            }
//        }
//    }
//    
//    return longestLength
    
    
    // Hash Set
    
    var set = Set(nums)
    var longest = 0
    
    for num in set {
        
        if set.contains(num - 1) == false {
            
            var lenght = 1
            
            while (set.contains(num + lenght)) {
                lenght += 1
            }
            
            longest = max(longest, lenght)
        }
    }
    
    return longest
}

//let nums = [100,4,200,1,3,2]
//let nums = [1,0,1,2]
let nums = [0,3,7,2,5,8,4,6,0,1]
//let nums = [9,1,4,7,3,-1,0,5,8,-1,6] // Output = 7
//let nums = [-8,-4,9,9,4,6,1,-4,-1,6,8] // Output = 2
let length = longestConsecutive(nums)
print("Logest Consecutive Sequence Lenght is: \(length)")

