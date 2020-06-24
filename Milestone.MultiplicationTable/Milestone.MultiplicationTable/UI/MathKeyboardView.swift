import SwiftUI

struct MathKeyboardView: View {
    @EnvironmentObject var device: NumPad
    @State private var shape = UserDefaults.standard.bool(forKey: "1")
    
    var body: some View {
        VStack(spacing: 20) {
            ForEach(0 ..< 3) { row in
                HStack(spacing: 20) {
                    ForEach(0 ..< 4) { item in
                        Button(action: {
                            switch self.device.numPad.arrayOfNum[row][item] {
                            case "0" ... "9":
                                if self.device.numPad.solution.count <= 2 {
                                    self.device.numPad.sleep = false
                                    self.device.numPad.solution += self.device.numPad.arrayOfNum[row][item]
                                }
                            case "del":
                                if self.device.numPad.solution.count > 0 {
                                    self.device.numPad.sleep = false
                                    self.device.numPad.solution.removeLast()
                                }
                            case "sub":
                                if Int(self.device.numPad.solution) == self.device.numPad.example {
                                    withAnimation {
                                        self.device.numPad.sleep = false
                                        self.device.numPad.solution = ""
                                        self.device.numPad.multiplicand = Int.random(in: 1 ..< 10)
                                        self.device.numPad.animalsEmotion = true
                                    }
                                } else {
                                    self.device.numPad.solution = ""
                                    self.device.numPad.animalsEmotion = false
                                }
                            default:
                                print("Unknown case")
                            }
                        }) {
                            ZStack {
                                RandomShapesView()
                                
                                Text(self.device.numPad.arrayOfNum[row][item])
                            }
                        }
                    }
                    
                }
            }
        }
    }
}

struct MathKeyboardView_Previews: PreviewProvider {
    static let device = NumPad()
    
    static var previews: some View {
        MathKeyboardView().environmentObject(device)
    }
}

struct ButtonsTextStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.custom("AlfaSlabOne-Regular", size: 24))
            .foregroundColor(.white)
    }
}
