import Foundation

enum NumPadEnum: CodingKey {
    case arrayOfNum
}

struct NumPadData: Codable {
    let arrayOfNum = [
        ["1", "2", "3", "4"],
        ["5", "6", "7", "8"],
        ["del", "9", "0", "sub"]
    ]
}

class NumPad: ObservableObject {
    @Published var numPad: NumPadData
    
    init(num: NumPadData) {
        self.numPad = num
    }
}
