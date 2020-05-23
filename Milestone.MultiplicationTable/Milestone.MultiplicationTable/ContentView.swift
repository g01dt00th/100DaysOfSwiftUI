import SwiftUI

struct ContentView: View {
    @State private var firstMultiplier = 2
    @State private var secondMultipler = Int.random(in: 1 ... 12)
    
    @State private var showingAlert = false
    @State private var selection = 0
    
    @State private var round = 0
    
    @State private var str = ""
    
    @State private var questions = [5, 10, 20, 80]
    
    var expression: Int {
        firstMultiplier * secondMultipler
    }
    
    var body: some View {
        VStack(spacing: 20) {
            Spacer()
            
            Text("round: \(round)   ")
                .foregroundColor(Color(#colorLiteral(red: 0.3411764706, green: 0.5882352941, blue: 0.8078431373, alpha: 1)))
            
            Picker("", selection: $selection) {
                ForEach(0 ..< questions.count) {
                    Text("\(self.questions[$0])")
                }
            }
            .pickerStyle(SegmentedPickerStyle())
            
            Stepper("up to...", value: $firstMultiplier, in: 1 ... 12)
                .foregroundColor(Color(#colorLiteral(red: 0.3411764706, green: 0.5882352941, blue: 0.8078431373, alpha: 1)))
            
            Text("\(firstMultiplier) * \(secondMultipler)   ")
                .foregroundColor(Color(#colorLiteral(red: 0.3411764706, green: 0.5882352941, blue: 0.8078431373, alpha: 1)))
            
            Text("answer: \(str)   ")
                .foregroundColor(Color(#colorLiteral(red: 0.3411764706, green: 0.5882352941, blue: 0.8078431373, alpha: 1)))
            
            Spacer()
            
            MyKeyboard(str: $str, firstMultiplier: $firstMultiplier, secondMultipler: $secondMultipler, showingAlert: $showingAlert, selection: $selection, round: $round, questions: $questions)
                .padding()
        }
        .animation(.easeOut)
        .modifier(ButtonsTextStyle())
        .alert(isPresented: $showingAlert) {
            Alert(title: Text("Same shit, dude"), message: Text("Try it again, try that again, try this again, i'll try again, try again later."), dismissButton: .cancel(Text("Cancel"), action: {
                if self.round == self.questions[self.selection] {
                    self.round = 0
                    self.str = ""
                    self.firstMultiplier += 1
                }
            }))
        }
        .padding()
        .background(Color(red: 254 / 255, green: 252 / 255, blue: 226 / 255))
        .edgesIgnoringSafeArea(.all)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
