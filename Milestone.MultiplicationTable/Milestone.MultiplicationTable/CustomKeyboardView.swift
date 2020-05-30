import SwiftUI

struct CustomKeyboardView: View {
    @ObservedObject var pad: NumPad
    @State var numStr = ""
    
    var body: some View {
        VStack(spacing: 20) {
            ForEach(0 ..< 3) { row in
                HStack(spacing: 20) {
                    ForEach(0 ..< 4) { item in
                        RandomShapesView(numStr: self.$pad.numPad.arrayOfNum[row][item])
                    }
                }
            }
        }
    }
}

struct CustomKeyboardView_Previews: PreviewProvider {
    static var previews: some View {
        CustomKeyboardView(pad: NumPad(num: NumPadData()))
    }
}

struct ButtonsTextStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.custom("AlfaSlabOne-Regular", size: 24))
            .foregroundColor(.white)
    }
}
