class Solution {
    static func letterCombinations(_ digits: String) -> [String] {
        let letters = [2 : "abc", 3 : "def", 4 : "ghi", 5 : "jkl", 6 : "mno", 7 : "pqrs", 8 : "tuv", 9 : "wxyz"]
        var res: [String] = []
        
        for c in digits{
            let key = Int(String(c))!
            let strings = Array(letters[key]!).map{String($0)}
            if res.count == 0{
                res = strings
            }else{
                res = res.flatMap{(string) in strings.map{string + $0}}
            }
            
        }
        
        return res
    }
}
print(Solution.letterCombinations("23"))
