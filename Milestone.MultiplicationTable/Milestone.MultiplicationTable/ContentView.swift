import SwiftUI

struct ContentView: View {
    @EnvironmentObject var device: NumPad
    
    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                HStack {
                    Image(device.numPad.sleep ? "zzz" : device.numPad.animalsEmotion ? "heart" : "heartBroken")
                        .resizable()
                        .frame(width: 50, height: 50)
                        .offset(x: 13, y: 240)
                    
                    Image("zebra")
                        .offset(y: 280)
                }
                
                MathKeyboardView().environmentObject(self.device)
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
    static let device = NumPad()
    
    static var previews: some View {
        ContentView().environmentObject(device)
    }
}
