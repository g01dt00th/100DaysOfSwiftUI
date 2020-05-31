import SwiftUI

struct CustomKeyboardView: View {
    @ObservedObject var device: NumPad
    @State var numStr = ""
    
    var body: some View {
        VStack(spacing: 20) {
            ForEach(0 ..< 3) { row in
                HStack(spacing: 20) {
                    ForEach(0 ..< 4) { item in
                        RandomShapesView(numStr: self.$device.numPad.arrayOfNum[row][item])
                    }
                    .onMove { source, destination in
                        self.device.numPad.arrayOfNum.move(fromOffsets: source, toOffset: destination)
                    }
                }
            }
            .onMove { source, destination in
                self.device.numPad.arrayOfNum.move(fromOffsets: source, toOffset: destination)
            }
        }
    }
}

struct CustomKeyboardView_Previews: PreviewProvider {
    static var previews: some View {
        CustomKeyboardView(device: NumPad(num: NumPadData()))
    }
}

struct ButtonsTextStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.custom("AlfaSlabOne-Regular", size: 24))
            .foregroundColor(.white)
    }
}
