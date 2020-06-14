import SwiftUI

struct MathKeyboardView: View {
    @ObservedObject var device: NumPad
    @State var solution = ""
    @State private var shape = Bool.random()
    
    var body: some View {
        VStack(spacing: 20) {
            MathSolutionView(device: NumPad(num: NumPadData()), solution: $solution)
                .padding()
            
            Spacer()
            
            ForEach(0 ..< 3) { row in
                HStack(spacing: 20) {
                    ForEach(0 ..< 4) { item in
                        ZStack {
                            RandomShapesView()
                            
                            Button(action: {
                                if self.device.numPad.arrayOfNum[row][item] == "del" && self.solution.count > 0 {
                                    self.solution.removeLast()
                                } else if self.device.numPad.arrayOfNum[row][item] == "sub" {
                                    print("sub")
                                } else if (Int(self.device.numPad.arrayOfNum[row][item]) != nil) {
                                    self.solution += self.device.numPad.arrayOfNum[row][item]
                                    print(self.device.numPad.arrayOfNum[row][item])
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
