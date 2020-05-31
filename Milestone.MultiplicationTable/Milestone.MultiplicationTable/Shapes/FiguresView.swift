import SwiftUI

struct RandomShapesView: View {
    @Binding var numStr: String
    
    @State private var dragAmount = CGSize.zero
    
    private let colors = [#colorLiteral(red: 0.3490196078, green: 0.7058823529, blue: 0.5647058824, alpha: 1), #colorLiteral(red: 0.3411764706, green: 0.5882352941, blue: 0.8078431373, alpha: 1), #colorLiteral(red: 0.8392156863, green: 0.3411764706, blue: 0.2745098039, alpha: 1), #colorLiteral(red: 0.9411764706, green: 0.7215686275, blue: 0.262745098, alpha: 1)].shuffled()
    private let shape = Bool.random()
    
    var body: some View {
        ZStack {
            if shape {
                Circle()
                    .fill(Color(colors.first ?? .green))
                    .frame(width: 70, height: 70)
            } else {
                Rectangle()
                    .fill(Color(colors.first ?? .green))
                    .frame(width: 70, height: 70)
            }
            
            Button(action: {}) {
                Text(numStr)
            }
        }
        .offset(self.dragAmount)
        .zIndex(dragAmount == .zero ? 0 : 1)
        .gesture(DragGesture(coordinateSpace: .global)
        .onChanged {
            self.dragAmount = CGSize(width: $0.translation.width / 2, height: $0.translation.height / 2)
            
        }
        .onEnded { _ in 
            self.dragAmount = .zero
            }
        )
    }
}

struct RandomShapesView_Previews: PreviewProvider {
    static var previews: some View {
        RandomShapesView(numStr: .constant("+"))
    }
}
