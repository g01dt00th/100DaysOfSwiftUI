import SwiftUI

struct AddressView: View {
    @ObservedObject var user: Order
    
    var body: some View {
        Form {
            Section {
                TextField("Name", text: $user.order.name)
                TextField("Steet Address", text: $user.order.streetAddress)
                TextField("City", text: $user.order.city)
                TextField("Zip", text: $user.order.zip)
            }
            
            Section {
                NavigationLink(destination: CheckoutView(user: user)) {
                    Text("Check out")
                }
            }
            .disabled(user.order.hasValidAddress == false)
        }
        .navigationBarTitle("Delivery details", displayMode: .inline)
    }
}

struct AddressView_Previews: PreviewProvider {
    static var previews: some View {
        AddressView(user: Order(order: OrderData()))
    }
}
