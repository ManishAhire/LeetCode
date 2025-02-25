/*
 
 Top K Frequent Elements
 
 Given an integer array nums and an integer k, return the k most frequent elements within the array.
 
 The test cases are generated such that the answer is always unique.
 
 You may return the output in any order.
 
 Example 1:
 
 Input: nums = [1,2,2,3,3,3], k = 2
 Output: [2,3]
 
 
 Example 2:
 Input: nums = [7,7], k = 1
 Output: [7]
 
 
 */
import UIKit

func topKFrequent(_ nums: [Int], _ k: Int) -> [Int] {
    
    guard !nums.isEmpty else {
        print("Array is empty")
        return []
    }
    
    guard k <= nums.count else {
        print("K is greater than the array elements")
        return []
    }
    
    //MARK: Method 2 - Brute Force Approch
//    var dict : [Int : Int] = [:]
//    for no in nums {
//        dict[no, default: 0] += 1
//    }
//    
//    let sortedDict = dict.sorted { $0.value > $1.value }
//    
//    var output: [Int] = []
//    for i in 0..<k {
//        output.append(sortedDict[i].key)
//    }
//    
//    return output
    
    
    //MARK: Method 1 - Bucket Sort
    var dict: [Int: Int] = [:]
    for num in nums {
        dict[num, default: 0] += 1
    }
    
    var bucket: [[Int]] = Array(repeating: [Int](), count: nums.count + 1)
    for (key, value) in dict {
        bucket[value].append(key)
    }
    
    var output: [Int] = []
    for num in bucket.reversed() {
        output += num
        
        if k == output.count {
            return output
        }
    }
    return []
}

let nums = [1,2,2,3,3,3], k = 2

//let nums = [7, 7], k = 1

//let nums = [1, 2], k = 2

let outPut = topKFrequent(nums, k)
print("Final OutputL \(outPut)")
