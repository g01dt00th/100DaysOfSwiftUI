import SwiftUI
import Alamofire
import SwiftyJSON


struct ContentView: View {
    @State private var value = 0
    @State private var city = 0
    @State private var celsiusAmount = 0.0
    
    private let apiKey = "f98c62551004881568eaf8dfbb3bd21f"
    
    let unitsOfTemperature = ["Fahrenheit", "Kelvin"]
    let cities = ["Liverpool", "London", "Leeds", "Manchester", "Nottingham", "Sheffield", "Delhi"]
    
    var celsiusToFahrenheit: Double {
        let fahrenheit = celsiusAmount * 9 / 5 + 32
        
        return fahrenheit
    }
    
    var celsiusToKelvin: Double {
        let kelvin = celsiusAmount + 273.15
        
        return kelvin
    }
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Change or add a city")) {
                    Picker("City", selection: $city) {
                        ForEach(0 ..< cities.count) {
                            Text("\(self.cities[$0])")
                        }
                    }
                    .onAppear {
                        Alamofire.request("https://api.openweathermap.org/data/2.5/weather?q=\(self.cities[self.city])&appid=\(self.apiKey)")
                            .responseJSON { responce in
                                if responce.result.isSuccess {
                                    guard let data = responce.result.value as? [String: Any] else { return }
                                    self.celsiusAmount = (JSON(data)["main"]["temp"].double ?? 0) - 273.15
                                    print(data)
                                } else {
                                    print("Something wrong")
                                }
                        }
                    }
                }
                
                Section(header: Text("Current degrees")) {
                    Text("\(celsiusAmount, specifier: "%.2f") Cº")
                }
                
                Section(header: Text("Start unit")) {
                    Picker("", selection: $value) {
                        ForEach(0 ..< unitsOfTemperature.count) {
                            Text("\(self.unitsOfTemperature[$0])")
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                }
                
                Section(header: Text("Result")) {
                    if value == 0 {
                        Text("\(celsiusToFahrenheit, specifier: "%.2f") Fº")
                    } else if value == 1 {
                        Text("\(celsiusToKelvin, specifier: "%.2f") Kº")
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
