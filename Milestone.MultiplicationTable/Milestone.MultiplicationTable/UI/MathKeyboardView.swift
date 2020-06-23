import SwiftUI

struct MathKeyboardView: View {
    @EnvironmentObject var device: NumPad
    @State var solution = ""
    
    var body: some View {
        VStack(spacing: 20) {
            MathExampleView().environmentObject(self.device)
                .padding()
            
            Spacer()
            
            MathSolutionView(device: NumPad(), solution: $solution).environmentObject(self.device)
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
                                            self.device.numPad.sleep = false
                                            self.solution += self.device.numPad.arrayOfNum[row][item]
                                        }
                                case "del":
                                    if self.solution.count > 0 {
                                        self.device.numPad.sleep = false
                                        self.solution.removeLast()
                                    }
                                case "sub":
                                    if Int(self.solution) == self.device.numPad.example {
                                        withAnimation {
                                            self.device.numPad.sleep = false
                                            self.solution = ""
                                            self.device.numPad.multiplicand = Int.random(in: 1 ..< 10)
                                            self.device.numPad.animalsEmotion = true
                                        }
                                    } else {
                                        self.solution = ""
                                        self.device.numPad.animalsEmotion = false
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
