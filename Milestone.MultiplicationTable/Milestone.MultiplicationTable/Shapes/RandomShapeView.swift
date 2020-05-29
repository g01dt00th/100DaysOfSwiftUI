import SwiftUI

struct RandomShapeView: View {
    @ObservedObject var num: NumPad
    
    var body: some View {
        Bool.random() ? AnyView(CircleView()) : AnyView(RectangleView())
    }
}

struct RandomShapeView_Previews: PreviewProvider {
    static var previews: some View {
        RandomShapeView(num: NumPad(num: NumPadData()))
    }
}
