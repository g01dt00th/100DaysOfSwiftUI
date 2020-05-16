import SwiftUI

struct ContentView: View {
    @State private var firstMultiplier = 5
    @State private var secondMultipler = Int.random(in: 1 ... 12)
    @State private var answer = ""
    
    @State private var showingAlert = false
    @State private var selection = 0
    
    @State private var round = 0
    
    let questions = [5, 10, 20, 80]
    
    private var expression: Int {
        firstMultiplier * secondMultipler
    }
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Round: \(round)")
            
            Picker("", selection: $selection) {
                ForEach(0 ..< questions.count) {
                    Text("\(self.questions[$0])")
                }
            }
            .pickerStyle(SegmentedPickerStyle())
            
            Stepper("Up to...", value: $firstMultiplier, in: 1 ... 12)
            Text("\(firstMultiplier) * \(secondMultipler)")
            
            TextField("Answer", text: $answer)
                .keyboardType(.numberPad)
            
            HStack(alignment: .center, spacing: 20) {
                ForEach(1 ..< 5) { num in
                    Button(action: {
                        self.answer += String(num)
                    }) {
                        Text("\(num)")
                    }
                }
            }
            
            HStack(alignment: .center, spacing: 20) {
                ForEach(5 ..< 9) { num in
                    Button(action: {
                        self.answer += String(num)
                    }) {
                        Text("\(num)")
                    }
                }
            }
            
            HStack(alignment: .center, spacing: 20) {
                Button("del") {
                    self.answer.removeLast()
                }
                
                Button(action: {
                    self.answer += "9"
                }) {
                    Text("9")
                }
                
                Button(action: {
                    self.answer += "0"
                }) {
                    Text("0")
                }
                
                Button("sub") {
                    if self.round < self.questions[self.selection] {
                        if self.expression == Int(self.answer) {
                            self.secondMultipler = Int.random(in: 1 ... 12)
                            self.answer = ""
                            self.round += 1
                        } else {
                            self.showingAlert = true
                        }
                    } else {
                        self.showingAlert.toggle()
                    }
                }
            }
            Spacer()
            
        }
        .padding()
        .alert(isPresented: $showingAlert) {
            Alert(title: Text("A"), message: Text("B"), dismissButton: .cancel(Text("Cancel"), action: {
                self.round = 0
                self.answer = ""
                self.firstMultiplier += 1
            }))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
