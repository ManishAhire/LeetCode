import UIKit

/*
 Encode and Decode Strings
 Design an algorithm to encode a list of strings to a single string. The encoded string is then decoded back to the original list of strings.

 Please implement encode and decode

 Example 1:

 Input: ["neet","code","love","you"]
 Output:["neet","code","love","you"]

 Example 2:

 Input: ["we","say",":","yes"]
 Output: ["we","say",":","yes"]
 */

func encode(strs: [String]) -> String {
    
    guard !strs.isEmpty else { return ""}
    
    var output: String = String()
    for str in strs {
        output += String(str.count) + "#" + str
    }
    return output
}

func decode(str: String) -> [String] {
    
    guard !str.isEmpty else { return [] }
    
    var decodedString: [String] = []
    var i = str.startIndex
    
    while i < str.endIndex {
         
        var length : Int = 0
        
        while str[i] != "#" {
            length = str[i].wholeNumberValue ?? 0
            i = str.index(after: i)
        }
        
        // Move i after #
        i = str.index(after: i)
        
        // Extract actual string
        let start = i
        let end = str.index(i, offsetBy: length)
        
        decodedString.append(String(str[start..<end]))
        
        // Move i to the next starting position
        i = end
        
    }
    return decodedString
}

//let strs = ["neet","code","love","you"]
let strs = ["we","say",":","yes"]
let encodedStr = encode(strs: strs)
print("Encoded String: \(encodedStr)")

let originalStrs = decode(str: encodedStr)
print("Decoded String: \(originalStrs)")
