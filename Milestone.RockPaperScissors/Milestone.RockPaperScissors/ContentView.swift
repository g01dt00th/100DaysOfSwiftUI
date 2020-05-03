import SwiftUI

struct ContentView: View {
    @State private var beats = ["🗿", "✂️", "🧻"]
    @State private var enemyBeat = "🐦"
    @State private var myBeat = ""
    @State private var battleResult = "🐦"
    
    @State private var enemyScore = 0
    @State private var myScore = 0
    
    @State private var round = 0
    
    @State private var showingAlert = false
    
    var result: String {
        var str = ""
        if enemyScore > myScore {
            str = "Enemy won with \(enemyScore) points"
        } else if enemyScore < myScore {
            str = "Beat enemy with \(myScore) points"
        } else {
            str = "Draw! I will destroy you next time."
        }
        return str
    }
    
    var body: some View {
        NavigationView {
            VStack {
                Section(header: Text("Your turn:")) {
                    HStack {
                        ForEach(0 ..< beats.count) { emoji in
                            Button(action: {
                                self.enemyBeat = self.beats.randomElement() ?? "🐦"
                                self.myBeat = self.beats[emoji]
                                self.round += 1
                                
                                if self.round < 10 {
                                    if self.enemyBeat == "🗿" && self.myBeat == "✂️" || self.enemyBeat == "✂️" && self.myBeat == "🧻" || self.enemyBeat == "🧻" && self.myBeat == "🗿" {
                                        self.battleResult = "👎"
                                        self.enemyScore += 10
                                    } else if self.enemyBeat == self.myBeat {
                                        self.battleResult = "🖖"
                                        self.enemyScore += 5
                                        self.myScore += 5
                                    } else {
                                        self.battleResult = "👍"
                                        self.myScore += 10
                                    }
                                } else {
                                    self.showingAlert.toggle()
                                }
                            }) {
                                Text(self.beats[emoji])
                                    .font(.system(size: 35))
                                    .padding(10)
                            }
                            .alert(isPresented: self.$showingAlert) {
                                Alert(title: Text("Really?"), message: Text("\(self.result)"), dismissButton: .default(Text("Restart"), action: {
                                    self.enemyBeat = "🐦"
                                    self.battleResult = "🐦"
                                    self.enemyScore = 0
                                    self.myScore = 0
                                    self.round = 0
                                }))
                            }
                        }
                    }
                    Text("My score: \(myScore)")
                }
                Spacer()
                
                Section(header: Text("Enemy turn:")) {
                    Text("\(enemyBeat)")
                        .font(.system(size: 35))
                        .padding(10)
                    
                    Text("Enemy score: \(enemyScore)")
                }
                Spacer()
                
                Section(header: Text("Battle result:")) {
                    HStack {
                        Text("\(battleResult)")
                            .font(.system(size: 35))
                            .padding(10)
                        
                        Text("\(round)")
                            .font(.system(size: 30))
                            .padding(10)
                    }
                }
            }
            .navigationBarTitle("Rock, Paper & Scissors", displayMode: .inline)
            .padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
