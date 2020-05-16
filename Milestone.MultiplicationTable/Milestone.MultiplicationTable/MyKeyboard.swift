import SwiftUI

struct ButtonsTextStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.custom("AlfaSlabOne-Regular", size: 24))
            .foregroundColor(.white)
    }
}

struct RectangleView: View {
    private let colors = [#colorLiteral(red: 0.3490196078, green: 0.7058823529, blue: 0.5647058824, alpha: 1), #colorLiteral(red: 0.3411764706, green: 0.5882352941, blue: 0.8078431373, alpha: 1), #colorLiteral(red: 0.8392156863, green: 0.3411764706, blue: 0.2745098039, alpha: 1), #colorLiteral(red: 0.9411764706, green: 0.7215686275, blue: 0.262745098, alpha: 1)]
    
    var body: some View {
        Rectangle()
            .fill(Color(colors.randomElement() ?? .green))
            .frame(width: 60, height: 60)
    }
}

struct CircleView: View {
    private let colors = [#colorLiteral(red: 0.3490196078, green: 0.7058823529, blue: 0.5647058824, alpha: 1), #colorLiteral(red: 0.3411764706, green: 0.5882352941, blue: 0.8078431373, alpha: 1), #colorLiteral(red: 0.8392156863, green: 0.3411764706, blue: 0.2745098039, alpha: 1), #colorLiteral(red: 0.9411764706, green: 0.7215686275, blue: 0.262745098, alpha: 1)]
    
    var body: some View {
        Circle()
            .fill(Color(colors.randomElement() ?? .green))
            .frame(width: 60, height: 60)
    }
}

struct RandomShapeView: View {
    var body: some View {
        if Bool.random() {
            return AnyView(CircleView())
        } else {
            return AnyView(RectangleView())
        }
        
    }
}

struct MyKeyboard: View {
    let array = ["1", "2", "3", "4", "5", "6", "7", "8", "del", "9", "0", "sub"]
    
    var body: some View {
        VStack(spacing: 30) {
            ForEach(0 ..< 3) { row in
                HStack(spacing: 30) {
                    ForEach(0 ..< 4) { item in
                        RandomShapeView()
                    }
                }
            }
        }
    }
}


struct MyKeyboard_Previews: PreviewProvider {
    static var previews: some View {
        MyKeyboard()
    }
}


