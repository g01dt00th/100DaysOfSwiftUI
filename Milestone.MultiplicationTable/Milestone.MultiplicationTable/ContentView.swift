import SwiftUI

struct ContentView: View {
    @State var dragAmount = CGSize.zero
    
    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                Spacer()
                
                Image("zebra")
                
                Image("zebra")
                
                CustomKeyboardView(device: NumPad(num: NumPadData()))
                    .padding()
            }
            .animation(.easeOut)
            .modifier(ButtonsTextStyle())
            .padding()
            .background(Color(#colorLiteral(red: 0.9960784314, green: 0.9882352941, blue: 0.8862745098, alpha: 1)))
            .edgesIgnoringSafeArea(.all)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
