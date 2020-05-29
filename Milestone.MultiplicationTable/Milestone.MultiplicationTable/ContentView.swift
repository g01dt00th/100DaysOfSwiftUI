import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack(spacing: 20) {
            Spacer()
            
            Image("zebra")
            
            CustomKeyboardView(pad: NumPad(num: NumPadData()))
                .padding()
        }
        .animation(.easeOut)
        .modifier(ButtonsTextStyle())
        .padding()
        .background(Color(#colorLiteral(red: 0.9960784314, green: 0.9882352941, blue: 0.8862745098, alpha: 1)))
        .edgesIgnoringSafeArea(.all)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
