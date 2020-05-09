import SwiftUI

struct CornerRotateModifier: ViewModifier {
    let amount: Double
    let anchor: UnitPoint
    
    func body(content: Content) -> some View {
        content.rotationEffect(.degrees(amount), anchor: anchor)
            .clipped()
    }
}

extension AnyTransition {
    static var pivot: AnyTransition {
        .modifier(active: CornerRotateModifier(amount: -90, anchor: .topLeading), identity: CornerRotateModifier(amount: 0, anchor: .topLeading))
    }
}

struct ContentView: View {
    let letters = Array("Hello, SwiftUI!")
    @State private var enabled = false
    @State private var dragAmount = CGSize.zero
    
    @State private var animationAmountRed: CGFloat = 1
    @State private var animationAmountBlue: CGFloat = 1
    @State private var animationAmountGreen = 0.0
    
    @State private var isShowingRed = false
    
    var body: some View {
        
        // Animating gestures
        
        HStack(spacing: 0) {
            ForEach(0 ..< letters.count) { num in
                Text(String(self.letters[num]))
                    .padding(5)
                    .font(.title)
                    .background(self.enabled ? Color.blue : Color.red)
                    .offset(self.dragAmount)
                    .animation(Animation.default.delay(Double(num) / 20))
            }
        }
        .gesture(
            DragGesture()
                .onChanged { self.dragAmount = $0.translation }
                .onEnded { _ in
                    self.dragAmount = .zero
                    self.enabled.toggle()
            }
        )
        
        // Showing and hiding views with transitions
        
//        VStack {
//            Button("Tap me") {
//                withAnimation {
//                    self.isShowingRed.toggle()
//                }
//            }
//
//            if isShowingRed {
//                Rectangle()
//                    .fill(Color.red)
//                    .frame(width: 200, height: 200)
//                    .transition(.pivot)
//            }
//        }
        
//        VStack {
//            Button("Red button") {
//                self.animationAmountRed += 1
//            }
//            .padding(50)
//            .background(Color.red)
//            .foregroundColor(.white)
//            .clipShape(Circle())
//            .overlay(
//                Circle()
//                    .stroke(Color.red)
//                    .scaleEffect(animationAmountRed)
//                    .opacity(Double(2 - animationAmountRed))
//                    .animation(
//                        Animation.easeInOut(duration: 1)
//                            .repeatForever(autoreverses: false)
//                )
//            )
//                .onAppear() {
//                    self.animationAmountRed = 2
//            }
//
//            Spacer()
//
//            Button("Green button") {
//                withAnimation(.interpolatingSpring(stiffness: 5, damping: 1)) {
//                    self.animationAmountGreen += 360.0
//                }
//            }
//            .padding(50)
//            .background(Color.green)
//            .foregroundColor(.white)
//            .clipShape(Circle())
//            .rotation3DEffect(.degrees(animationAmountGreen), axis: (x: 0, y: 1, z: 0))
//
//            Spacer()
//
//            Stepper("Scale amount", value: $animationAmountBlue.animation(
//                Animation.easeInOut(duration: 1)
//                    .repeatCount(3, autoreverses: true)
//            ), in: 1 ... 10)
//
//            Spacer()
//
//            Button("Blue button") {
//                self.animationAmountBlue += 1
//            }
//            .padding(40)
//            .background(Color.blue)
//            .foregroundColor(.white)
//            .clipShape(Circle())
//            .scaleEffect(animationAmountBlue)
//        }
//        .padding()
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
