import SwiftUI

struct ContentView: View {
    @ObservedObject var user = Order(order: OrderData())
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    Picker("Select your cake type", selection: $user.order.type) {
                        ForEach(0 ..< user.order.types.count, id: \.self) {
                            Text(self.user.order.types[$0])
                        }
                    }
                    
                    Stepper(value: $user.order.quantity, in: 3 ... 20) {
                        Text("Number of cakes: \(self.user.order.quantity)")
                    }
                }
                
                Section {
                    Toggle(isOn: $user.order.specialRequestEnabled.animation()) {
                        Text("Any special requests?")
                    }
                    
                    if user.order.specialRequestEnabled {
                        Toggle(isOn: $user.order.extraFrosting) {
                            Text("Add extra frosting?")
                        }
                        
                        Toggle(isOn: $user.order.addSprinkles) {
                            Text("Add extra sprinkles")
                        }
                    }
                }
                
                Section {
                    NavigationLink(destination: AddressView(user: user)) {
                        Text("Delivery details")
                    }
                }
            }
            .navigationBarTitle("Cupcake Corner")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
