//import Foundation
//import Combine
import SwiftUI

enum NumPadEnum: CodingKey {
    case arrayOfNum, multiplicand, factor, example
}

struct NumPadData {
    let arrayOfNum = [
        ["1", "2", "3", "4"],
        ["5", "6", "7", "8"],
        ["del", "9", "0", "sub"]
    ]
    
    var arrayOfShapes = [[(String, String)]]()
    
    init() {
        arrayOfShapes = CreateNumPad()
    }
    
    var multiplicand = Int.random(in: 1 ..< 13)
    var factor = Int.random(in: 1 ..< 10)
    var example: Int {
        multiplicand * factor
    }
    var animalsEmotion = false
    var sleep = true
    
    let shape = Bool.random()
    
    var solution = ""
    
    func CreateNumPad() -> [[(String, String)]] {
        var result = [[(String, String)]]()
        var row = [(String, String)]()
        
        for _ in 0..<3 {
            for _ in 0..<4 {
                let shape = Bool.random()
                let colors = ["green", "blue", "red", "yellow"]
                if shape {
                    row.append(("Circle", colors.randomElement()!))
                } else {
                    row.append(("Rectangle", colors.randomElement()!))
                }
            }
            result.append(row)
            row.removeAll()
        }
        return result
    }
}

class NumPad: ObservableObject {
    @Published var numPad = NumPadData()
}
