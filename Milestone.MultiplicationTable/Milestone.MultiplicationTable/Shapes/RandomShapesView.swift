import SwiftUI

struct RandomShapesView: View {
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
        }
    }
}

struct MyShapeView: View {
    var data: (String, String)
    
    var body: some View {
        ZStack {
            if data.0 == "Circle" {
                Circle()
                    .fill(self.GetColor(color: data.1))
                    .frame(width: 70, height: 70)
            } else {
                Rectangle()
                    .fill(self.GetColor(color: data.1))
                    .frame(width: 70, height: 70)
            }
        }
    }
    
    func GetColor(color: String) -> Color {
        var result: Color
        
        switch color {
            case "green": result = Color(#colorLiteral(red: 0.3490196078, green: 0.7058823529, blue: 0.5647058824, alpha: 1))
            case "blue": result = Color(#colorLiteral(red: 0.3411764706, green: 0.5882352941, blue: 0.8078431373, alpha: 1))
            case "red": result = Color(#colorLiteral(red: 0.8392156863, green: 0.3411764706, blue: 0.2745098039, alpha: 1))
            case "yellow": result = Color(#colorLiteral(red: 0.9411764706, green: 0.7215686275, blue: 0.262745098, alpha: 1))
            default: result = Color.green
        }
        
        return result
    }
}

struct RandomShapesView_Previews: PreviewProvider {
    static var previews: some View {
        RandomShapesView()
    }
}
