import SwiftUI

struct MathKeyboardView: View {
    @ObservedObject var device: NumPad
    @State var solution = ""
    
    var body: some View {
        VStack(spacing: 20) {
            MathExampleView(device: NumPad(num: NumPadData()))
                .padding()
            
            Spacer()
            
            MathSolutionView(device: NumPad(num: NumPadData()), solution: $solution)
                .padding()
            
            Spacer()
            
            ForEach(0 ..< 3) { row in
                HStack(spacing: 20) {
                    ForEach(0 ..< 4) { item in
                        ZStack {
                            RandomShapesView()
                            
                            Button(action: {
                                switch self.device.numPad.arrayOfNum[row][item] {
                                case "0" ... "9":
                                        if self.solution.count <= 2 {
                                            self.solution += self.device.numPad.arrayOfNum[row][item]
                                        }
                                case "del":
                                    if self.solution.count > 0 {
                                        self.solution.removeLast()
                                    }
                                case "sub":
                                    if Int(self.solution) == self.device.numPad.example {
                                        print(true)
                                    } else {
                                        print("\(self.device.numPad.factor) * \(self.device.numPad.multiplicand)")
                                    }
                                default:
                                    print("Unknown case")
                                }
                            }) {
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
    static var previews: some View {
        MathKeyboardView(device: NumPad(num: NumPadData()))
    }
}

struct ButtonsTextStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.custom("AlfaSlabOne-Regular", size: 24))
            .foregroundColor(.white)
    }
}
