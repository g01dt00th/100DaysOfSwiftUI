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
            .frame(width: 70, height: 70)
    }
}

struct CircleView: View {
    private let colors = [#colorLiteral(red: 0.3490196078, green: 0.7058823529, blue: 0.5647058824, alpha: 1), #colorLiteral(red: 0.3411764706, green: 0.5882352941, blue: 0.8078431373, alpha: 1), #colorLiteral(red: 0.8392156863, green: 0.3411764706, blue: 0.2745098039, alpha: 1), #colorLiteral(red: 0.9411764706, green: 0.7215686275, blue: 0.262745098, alpha: 1)]
    
    var body: some View {
        Circle()
            .fill(Color(colors.randomElement() ?? .green))
            .frame(width: 70, height: 70)
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
    @Binding var str: String
    
    @Binding var firstMultiplier: Int
    @Binding var secondMultipler: Int
    
    @Binding var showingAlert: Bool
    @Binding var selection: Int
    
    @Binding var round: Int
    
    @Binding var questions: [Int]
    
    let arrayOfPad = [
        ["1", "2", "3", "4"],
        ["5", "6", "7", "8"],
        ["del", "9", "0", "sub"]
    ]
    
    var body: some View {
        VStack(spacing: 20) {
            ForEach(0 ..< 3) { row in
                HStack(spacing: 20) {
                    ForEach(0 ..< 4) { item in
                        RandomShapeView()
                            .overlay(
                                Button(action: {
                                    if let pad = Int(self.arrayOfPad[row][item]) {
                                        self.str += String(pad)
                                        print(pad)
                                    } else if self.arrayOfPad[row][item] == "del" {
                                        self.str.removeLast()
                                        print("Delete")
                                    } else if self.arrayOfPad[row][item] == "sub" {
                                        if self.round < self.questions[self.selection] {
                                            if self.firstMultiplier * self.secondMultipler == Int(self.str) {
                                                self.secondMultipler = Int.random(in: 1 ... 12)
                                                self.str = ""
                                                self.round += 1
                                            } else {
                                                self.showingAlert = true
                                                self.round += 1
                                                self.str = ""
                                            }
                                        } else {
                                            self.showingAlert.toggle()
                                        }
                                    }
                                }) {
                                    Text("\(self.arrayOfPad[row][item])")
                                }
                        )
                    }
                }
            }
        }
    }
}


struct MyKeyboard_Previews: PreviewProvider {
    static var previews: some View {
        MyKeyboard(str: .constant(""), firstMultiplier: .constant(0), secondMultipler: .constant(0), showingAlert: .constant(false), selection: .constant(0), round: .constant(0), questions: .constant([0]))
    }
}


