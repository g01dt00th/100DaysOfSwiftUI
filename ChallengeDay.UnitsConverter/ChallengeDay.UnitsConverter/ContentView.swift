import SwiftUI
import Alamofire
import SwiftyJSON


struct ContentView: View {
    @State private var unitStart = 2
    @State private var unitFinal = 0
    @State private var startCity = 0
    @State private var amount = ""
    
    let apiKey = "f98c62551004881568eaf8dfbb3bd21f"
    
    let unitsOfTemperature = ["Celsius", "Fahrenheit", "Kelvin"]
    let cities = ["Liverpool", "London", "Leeds", "Manchester", "Nottingham", "Sheffield"]
    
    var celsiusToF: Int {
        let cel = Int(amount) ?? 0
        let far = (cel * 9 / 5) + 32
        
        return far
    }
    
    var celsiusToK: Double {
        let cel = Double(amount) ?? 0
        let kel = cel + 273.15
        
        return kel
    }
    
    var fahrenheitToK: Double {
        let far = Double(amount) ?? 0
        let kel = (far - 32) * 5 / 9 + 273.15
        
        return kel
    }
    
    var kelToCel: Double {
        let kel = Double(amount) ?? 0
        let cel = kel - 273.15
        
        return cel
    }
    
    var kelToF: Double {
        let kel = Double(amount) ?? 0
        let far = (kel - 293.15) * 9 / 5 + 32
        
        return far
    }
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Current degrees")) {
                    Picker("City", selection: $startCity) {
                        ForEach(0 ..< cities.count) {
                            Text("\(self.cities[$0])")
                        }
                    }
                    .onAppear {
                        Alamofire.request("https://api.openweathermap.org/data/2.5/weather?q=\(self.cities[self.startCity])&appid=\(self.apiKey)", method: .get)
                            .responseJSON { responce in
                                if responce.result.isSuccess {
                                    guard let data = responce.result.value as? [String: Any] else { return }
                                    let json = JSON(data)
                                    let temp = json["main"]["temp"].double ?? 0
                                    self.amount = String(temp)
                                    print(data)
                                } else {
                                    print("Bug")
                                }
                        }
                    }
                }
                
                Section {
                    TextField("Celsius, Fahrenheit, Kelvin", text: $amount)
                        .keyboardType(.decimalPad)
                        .lineLimit(2)
                }
                
                Section(header: Text("Start unit")) {
                    Picker("", selection: $unitStart) {
                        ForEach(0 ..< unitsOfTemperature.count) {
                            Text("\(self.unitsOfTemperature[$0])")
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                }
                
                Section(header: Text("Final unit")) {
                    Picker("", selection: $unitFinal) {
                        ForEach(0 ..< unitsOfTemperature.count) {
                            Text("\(self.unitsOfTemperature[$0])")
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                }
                
                Section(header: Text("Result")) {
                    if (unitStart == 0 && unitFinal == 1) || (unitStart == 1 && unitFinal == 0) {
                        Text("\(celsiusToF)")
                    } else if (unitStart == 0 && unitFinal == 2) {
                        Text("\(celsiusToK, specifier: "%.1f")")
                    } else if (unitStart == 1 && unitFinal == 2) {
                        Text("\(fahrenheitToK, specifier: "%.1f")")
                    } else if (unitStart == 2 && unitFinal == 0) {
                        Text("\(kelToCel, specifier: "%.1f")")
                    } else if (unitStart == 2 && unitFinal == 1) {
                        Text("\(kelToF, specifier: "%.1f")")
                    } else if amount == "" {
                        Text("Enter amount")
                    } else {
                        Text("Equal")
                    }
                }
            }
            .navigationBarTitle("Temp Converter")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
