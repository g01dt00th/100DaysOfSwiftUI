import SwiftUI

struct RectangleView: View {
    @State private var dragAmount = CGSize.zero
    private let colors = [#colorLiteral(red: 0.3490196078, green: 0.7058823529, blue: 0.5647058824, alpha: 1), #colorLiteral(red: 0.3411764706, green: 0.5882352941, blue: 0.8078431373, alpha: 1), #colorLiteral(red: 0.8392156863, green: 0.3411764706, blue: 0.2745098039, alpha: 1), #colorLiteral(red: 0.9411764706, green: 0.7215686275, blue: 0.262745098, alpha: 1)].shuffled()
    
    var body: some View {
        ZStack {
            Rectangle()
                .fill(Color(colors.first ?? .green))
                .frame(width: 70, height: 70)
        }
        .offset(self.dragAmount)
        .gesture(DragGesture(coordinateSpace: .global)
        .onChanged {
            self.dragAmount = CGSize(width: $0.translation.width, height: $0.translation.height)
        }
        .onEnded { _ in
            self.dragAmount = .zero
            }
        )
    }
}

struct RectangleView_Previews: PreviewProvider {
    static var previews: some View {
        RectangleView()
    }
}
