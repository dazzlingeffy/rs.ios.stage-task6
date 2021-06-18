import Foundation

class CoronaClass {
 
    var seats = [Int]()
    let n: Int

     init(n: Int) {
        self.n = n
     }
     
     func seat() -> Int {
        var res = 0
        var diff = 0
        
        if !seats.contains(n - 1) {
            res = n - 1
        }
        if seats.contains(0) {
        
            var i = 0;
            while i < seats.count - 1 {
                let tmp = abs(seats[i + 1] - seats[i]) / 2
                if tmp > diff {
                    diff = tmp
                    res = seats[i] + tmp
                }
                i += 1
            }
        }
        
        seats.append(res)
        seats.sort()
        return res
     }
     
     func leave(_ p: Int) {
        if seats.contains(p) {
            seats.remove(at: seats.firstIndex(of: p)!)
        }
     }
}
