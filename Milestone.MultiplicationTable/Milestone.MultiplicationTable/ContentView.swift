import SwiftUI

struct ContentView: View {
    @State private var firstMultiplier = 5
    @State private var secondMultipler = Int.random(in: 1 ... 12)
    @State private var answer = ""
    
    @State private var showingAlert = false
    @State private var selection = 0
    
    @State private var round = 0
    
    let questions = [5, 10, 20, 80]
    
    private let colors = [#colorLiteral(red: 0.3490196078, green: 0.7058823529, blue: 0.5647058824, alpha: 1), #colorLiteral(red: 0.3411764706, green: 0.5882352941, blue: 0.8078431373, alpha: 1), #colorLiteral(red: 0.8392156863, green: 0.3411764706, blue: 0.2745098039, alpha: 1), #colorLiteral(red: 0.9411764706, green: 0.7215686275, blue: 0.262745098, alpha: 1)]
    
    private var expression: Int {
        firstMultiplier * secondMultipler
    }
    
    var body: some View {
        VStack(spacing: 20) {
            Text("round: \(round)")
                    .background(Rectangle()
                        .fill(Color(self.colors.last ?? .green))
                )
            
            Picker("", selection: $selection) {
                ForEach(0 ..< questions.count) {
                    Text("\(self.questions[$0])")
                }
            }
            .pickerStyle(SegmentedPickerStyle())
            
            Stepper("up to...", value: $firstMultiplier, in: 1 ... 12)
                .background(Rectangle()
                    .fill(Color(self.colors[0]))
            )
            Text("\(firstMultiplier) * \(secondMultipler)")
                .background(Rectangle()
                    .fill(Color(self.colors[1]))
            )
            
            Text("answer: \(answer)   ")
                .background(Rectangle()
                    .fill(Color(self.colors[2]))
                )
            
            Spacer()
            
            MyKeyboard()
        }
        .animation(.easeOut)
        .modifier(ButtonsTextStyle())
        .alert(isPresented: $showingAlert) {
            Alert(title: Text("A"), message: Text("B"), dismissButton: .cancel(Text("Cancel"), action: {
                self.round = 0
                self.answer = ""
                self.firstMultiplier += 1
            }))
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
