import SwiftUI

struct ContentView: View {
    @State private var countries = [ "Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria", "Poland", "Russia", "Spain", "UK", "US" ]
        .shuffled()
    @State private var correctAnswer = Int.random(in: 0 ... 2)
    
    @State private var showingScore = false
    @State private var scoreTitle = ""
    @State private var currentScore = 0
    
    @State private var rotate = 0.0
    @State private var selection: Int? = nil
    @State private var opacity = 1.0
    
    @State var gradient = [Color.blue, Color.pink, Color.purple, Color.yellow]
    @State var startPoint = UnitPoint(x: 0, y: 0)
    @State var endPoint = UnitPoint(x: 0, y: 2)
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: self.gradient), startPoint: self.startPoint, endPoint: self.endPoint)
                .edgesIgnoringSafeArea(.all)
            
            VStack(spacing: 30) {
                VStack {
                    Text("Tap the flag of")
                        .foregroundColor(.white)
                    
                    Text(countries[correctAnswer])
                        .foregroundColor(.white)
                        .font(.largeTitle)
                        .fontWeight(.black)
                }
                
                ForEach(0 ..< 3) { number in
                    Button(action: {
                        self.flagTapped(number)
                        if number == self.correctAnswer {
                            withAnimation(.easeInOut(duration: 3.0)) {
                                self.startPoint = UnitPoint(x: 0, y: 0)
                                self.endPoint = UnitPoint(x: 0, y: 2)
                            }
                            self.selection = number
                            withAnimation(.interpolatingSpring(stiffness: 20, damping: 5)) {
                                self.rotate += 360
                            }
                        } else {
                            withAnimation(.easeInOut(duration: 3.0)) {
                                self.opacity = 0.2
                                self.startPoint = UnitPoint(x: 1, y: -1)
                                self.endPoint = UnitPoint(x: 0, y: 1)
                            }
                        }
                    }) {
                        withAnimation(.interpolatingSpring(stiffness: 10, damping: 5)) {
                            FlagImage(image: self.countries[number])
                        }
                        
                    }
                    .opacity(number == self.correctAnswer ? 1.0 : self.opacity)
                    .rotation3DEffect(.degrees(self.selection == number ? self.rotate : 0.0), axis: (x: 0, y: 1, z: 0))
                }
                
                Text("Your current score is \(currentScore)")
                    .foregroundColor(.white)
                    .font(.title)
                    .fontWeight(.black)
            }
        }
        .alert(isPresented: $showingScore) {
            Alert(title: Text(scoreTitle), message: Text("That’s the flag of \(countries[correctAnswer])"), dismissButton: .default(Text("Continue")) {
                self.askQuestion()
                })
        }
    }
    
    func flagTapped(_ number: Int) {
        if number == correctAnswer {
            scoreTitle = "Correct"
            currentScore += 10
        } else {
            scoreTitle = "Wrong"
            currentScore -= 10
        }
        
        self.opacity = 1.0
        showingScore = true
    }
    
    func askQuestion() {
        countries.shuffle()
        correctAnswer = Int.random(in: 0 ... 2)
        self.opacity = 1.0
    }
}

struct FlagImage: View {
    var image: String
    var rotate = 0.0
    
    var body: some View {
        Image(image)
            .renderingMode(.original)
            .clipShape(Capsule())
            .overlay(Capsule()
                .stroke(Color.white, lineWidth: 3))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
