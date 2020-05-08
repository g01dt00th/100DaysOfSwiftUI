import SwiftUI

struct ContentView: View {
    @State private var animationAmountRed: CGFloat = 1
    @State private var animationAmountBlue: CGFloat = 1
    @State private var animationAmountGreen = 0.0
    
    var body: some View {
        VStack {
            Button("Red button") {
                self.animationAmountRed += 1
            }
            .padding(50)
            .background(Color.red)
            .foregroundColor(.white)
            .clipShape(Circle())
            .overlay(
                Circle()
                    .stroke(Color.red)
                    .scaleEffect(animationAmountRed)
                    .opacity(Double(2 - animationAmountRed))
                    .animation(
                        Animation.easeInOut(duration: 1)
                            .repeatForever(autoreverses: false)
                )
            )
                .onAppear() {
                    self.animationAmountRed = 2
            }
            
            Spacer()
            
            Button("Green button") {
                withAnimation(.interpolatingSpring(stiffness: 5, damping: 1)) {
                    self.animationAmountGreen += 360.0
                }
            }
            .padding(50)
            .background(Color.green)
            .foregroundColor(.white)
            .clipShape(Circle())
            .rotation3DEffect(.degrees(animationAmountGreen), axis: (x: 0, y: 1, z: 0))
            
            Spacer()
            
            Stepper("Scale amount", value: $animationAmountBlue.animation(
                Animation.easeInOut(duration: 1)
                    .repeatCount(3, autoreverses: true)
            ), in: 1 ... 10)
            
            Spacer()
            
            Button("Blue button") {
                self.animationAmountBlue += 1
            }
            .padding(40)
            .background(Color.blue)
            .foregroundColor(.white)
            .clipShape(Circle())
            .scaleEffect(animationAmountBlue)
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
