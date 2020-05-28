import SwiftUI

struct CheckoutView: View {
    @ObservedObject var user = Order(order: OrderData())
    @State private var confirmationMessage = ""
    @State private var titleMessage = ""
    @State private var showingConformation = false
    
    var body: some View {
        GeometryReader { geo in
            ScrollView {
                VStack {
                    Image("cupcakes")
                        .resizable()
                        .scaledToFit()
                        .frame(width: geo.size.width)
                    
                    Text("Your total is $\(self.user.order.cost, specifier: "%.2f")")
                        .font(.title)
                    
                    Button("Place order") {
                        self.placeOrder()
                    }
                    .padding()
                }
            }
        }
        .navigationBarTitle("Check out", displayMode: .inline)
        .alert(isPresented: $showingConformation) {
            Alert(title: Text(titleMessage), message: Text(confirmationMessage), dismissButton: .default(Text("OK")))
        }
    }
    
    func placeOrder() {
        guard let encoded = try? JSONEncoder().encode(OrderData()) else {
            print("Failed to encode order")
            return
        }
        
        guard let url = URL(string: "https://reqres.in/api/cupcakes") else {
            print("Failed to receiving order")
            return
        }
        
        var request = URLRequest(url: url)
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpMethod = "POST"
        request.httpBody = encoded
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data else {
                self.titleMessage = "Oops!"
                self.confirmationMessage = "No data in response: \n \(error?.localizedDescription ?? "Unknow error")"
                self.showingConformation = true
                return
            }
            
            if let decoderOrder = try? JSONDecoder().decode(OrderData.self, from: data) {
                self.titleMessage = "Thank you!"
                self.confirmationMessage = "Your order for \(decoderOrder.quantity)x \(self.user.order.types [decoderOrder.type].lowercased()) cupcakes is on its way."
                self.showingConformation = true
            } else {
                print("Invalid response from server.")
            }
        }.resume()
    }
}

struct CheckoutView_Previews: PreviewProvider {
    static var previews: some View {
        CheckoutView(user: Order(order: OrderData()))
    }
}
