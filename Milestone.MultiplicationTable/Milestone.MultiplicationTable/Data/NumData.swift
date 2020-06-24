import Foundation
import Combine

enum NumPadEnum: CodingKey {
    case arrayOfNum, multiplicand, factor, example
}

struct NumPadData: Codable {
    let arrayOfNum = [
        ["1", "2", "3", "4"],
        ["5", "6", "7", "8"],
        ["del", "9", "0", "sub"]
    ]
    
    var multiplicand = Int.random(in: 1 ..< 13)
    var factor = Int.random(in: 1 ..< 10)
    var example: Int {
        multiplicand * factor
    }
    var animalsEmotion = false
    var sleep = true
    
    let shape = Bool.random()
    
    var solution = ""
}

class NumPad: ObservableObject {
    @Published var numPad = NumPadData()
}
