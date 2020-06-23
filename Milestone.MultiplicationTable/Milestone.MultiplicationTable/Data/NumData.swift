import Foundation

enum NumPadEnum: CodingKey {
    case arrayOfNum, multiplicand, factor, example
}

struct NumPadData: Codable {
    var arrayOfNum = [
        ["1", "2", "3", "4"],
        ["5", "6", "7", "8"],
        ["del", "9", "0", "sub"]
    ]
    
    var multiplicand = Int.random(in: 1 ..< 13)
    var factor = Int.random(in: 1 ..< 13)
    var example: Int {
        multiplicand * factor
    }
}

class NumPad: ObservableObject {
    @Published var numPad: NumPadData
    
    init(num: NumPadData) {
        self.numPad = num
    }
}
