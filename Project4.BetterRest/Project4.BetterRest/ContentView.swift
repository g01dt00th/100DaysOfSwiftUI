import SwiftUI
import Combine

struct ContentView: View {
    @State private var sleepAmount = 8.0
    @State private var wakeUp = Date()
    @State private var coffeeAmount = 0
    
    @State private var alertTitle = ""
    @State private var alertMessage = ""
    @State private var showingAlert = false
    
    var bedtimeCalc: String {
        calculateBedtime()
    }
    
    var body: some View {
        NavigationView {
            VStack {
                Section(header: Text("When do you want to wake up?")) {
                    DatePicker("Please enter a time", selection: $wakeUp, displayedComponents: .hourAndMinute)
                        .labelsHidden()
                }
                
                Section(header: Text("Desired amount to sleep")) {
                    Stepper(value: $sleepAmount, in: 4 ... 12, step: 0.25) {
                        Text("\(sleepAmount, specifier: "%g") hours")
                    }
                    .accessibility(value: Text(calculateBedtime()))
                }
                
                Section(header: Text("Daily coffee intake")) {
                    Picker("", selection: $coffeeAmount) {
                        ForEach(1 ..< 21) { cups in
                            if cups == 1 {
                                Text("1 cup")
                            } else {
                                Text("\(0 + cups) cups")
                            }
                        }
                    }
                    .labelsHidden()
                }
                
                Section(header: Text("Your ideal bedtime is…")) {
                    Text(bedtimeCalc)
                        .font(.largeTitle)
                        .fontWeight(.bold)
                }
            }
            .navigationBarTitle("BetterRest")
            .padding([.top, .horizontal])
            .alert(isPresented: $showingAlert) {
                Alert(title: Text(alertTitle), message: Text(alertMessage), dismissButton: .default(Text("Ok")))
            }
        }
    }
    
    func calculateBedtime() -> String {
        let model = SleepCalculator()
        
        let components = Calendar.current.dateComponents([.hour, .minute], from: wakeUp)
        let hour = (components.hour ?? 0) * 60 * 60
        let minute = (components.minute ?? 0) * 60
        
        do {
            let prediction = try model.prediction(wake: Double(hour + minute), estimatedSleep: sleepAmount, coffee: Double(coffeeAmount))
            
            let sleepTime = wakeUp - prediction.actualSleep
            
            let formatter = DateFormatter()
            formatter.timeStyle = .short
            
            return formatter.string(from: sleepTime)
        } catch {
            return "Sorry, there was a problem calculating your bedtime."
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
