import SwiftUI

struct ButtonsTextStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.custom("AlfaSlabOne-Regular", size: 24))
            .foregroundColor(.white)
    }
}

struct MyKeyboard: View {
    @State private var colors = [#colorLiteral(red: 0.3490196078, green: 0.7058823529, blue: 0.5647058824, alpha: 1), #colorLiteral(red: 0.3411764706, green: 0.5882352941, blue: 0.8078431373, alpha: 1), #colorLiteral(red: 0.8392156863, green: 0.3411764706, blue: 0.2745098039, alpha: 1), #colorLiteral(red: 0.9411764706, green: 0.7215686275, blue: 0.262745098, alpha: 1)]
    
    var body: some View {
        VStack(alignment: .center, spacing: 25) {
            Spacer()
            
            HStack {
                ForEach(1 ..< 5) {
                    Text("\($0)")
                        .background(Rectangle()
                            .fill(Color(self.colors[$0]))
                            .frame(width: 70, height: 72.21, alignment: .center)
                    )
                }
                .padding(40)
            }
            
            HStack(alignment: .center, spacing: 25) {
                Rectangle()
                    .fill(Color(#colorLiteral(red: 0.3490196078, green: 0.7058823529, blue: 0.5647058824, alpha: 1)))
                    .frame(width: 70, height: 72.21, alignment: .center)
                
                Circle()
                    .fill(Color(#colorLiteral(red: 0.3411764706, green: 0.5882352941, blue: 0.8078431373, alpha: 1)))
                    .frame(width: 70, height: 70.71, alignment: .center)
                
                Circle()
                    .fill(Color(#colorLiteral(red: 0.8392156863, green: 0.3411764706, blue: 0.2745098039, alpha: 1)))
                    .frame(width: 70, height: 70.71, alignment: .center)
                
                Rectangle()
                    .fill(Color(#colorLiteral(red: 0.9411764706, green: 0.7215686275, blue: 0.262745098, alpha: 1)))
                    .frame(width: 70, height: 72.21, alignment: .center)
            }
            
            HStack(alignment: .center, spacing: 25) {
                Group {
                    Circle()
                        .fill(Color(#colorLiteral(red: 0.9411764706, green: 0.7215686275, blue: 0.262745098, alpha: 1)))
                        .frame(width: 70, height: 70.71, alignment: .center)
                    
                    
                    Rectangle()
                        .fill(Color(#colorLiteral(red: 0.3490196078, green: 0.7058823529, blue: 0.5647058824, alpha: 1)))
                        .frame(width: 70, height: 72.21, alignment: .center)
                    
                    Circle()
                        .fill(Color(#colorLiteral(red: 0.3411764706, green: 0.5882352941, blue: 0.8078431373, alpha: 1)))
                        .frame(width: 70, height: 70.71, alignment: .center)
                    
                    Rectangle()
                        .fill(Color(#colorLiteral(red: 0.8392156863, green: 0.3411764706, blue: 0.2745098039, alpha: 1)))
                        .frame(width: 70, height: 72.21, alignment: .center)
                }
            }
            
            HStack(alignment: .center, spacing: 25) {
                Group {
                    Circle()
                        .fill(Color(#colorLiteral(red: 0.8392156863, green: 0.3411764706, blue: 0.2745098039, alpha: 1)))
                        .frame(width: 70, height: 70.71, alignment: .center)
                    
                    Circle()
                        .fill(Color(#colorLiteral(red: 0.9411764706, green: 0.7215686275, blue: 0.262745098, alpha: 1)))
                        .frame(width: 70, height: 70.71, alignment: .center)
                    
                    Rectangle()
                        .fill(Color(#colorLiteral(red: 0.3411764706, green: 0.5882352941, blue: 0.8078431373, alpha: 1)))
                        .frame(width: 70, height: 72.21, alignment: .center)
                    
                    Rectangle()
                        .fill(Color(#colorLiteral(red: 0.3490196078, green: 0.7058823529, blue: 0.5647058824, alpha: 1)))
                        .frame(width: 70, height: 72.21, alignment: .center)
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
