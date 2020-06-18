import LocalAuthentication
import MapKit
import SwiftUI

struct ContentView: View {
    @State private var isUnlocked = false
    @State private var showingAuthError = false
    @State private var textAuthError = ""
    
    var body: some View {
        ZStack {
            if isUnlocked {
                UnlockView()
            } else {
                Button("Unlock Places") {
                    self.authenticate()
                }
                .padding()
                .background(Color.blue)
                .foregroundColor(.white)
                .clipShape(Capsule())
            }
        }
        .alert(isPresented: $showingAuthError) {
            Alert(title: Text("Authentication Failed"), message: Text(textAuthError), dismissButton: .default(Text("OK")))
        }
    }
    
    func authenticate() {
        let context = LAContext()
        var error: NSError?
        
        if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) {
            let reason = "Please authenticate youself to unlock your places."
            
            context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: reason) { success, authenticationError in
                DispatchQueue.main.async {
                    if success {
                        self.isUnlocked = true
                    } else {
                        self.textAuthError = "\(authenticationError?.localizedDescription ?? "Unknown error")"
                        self.showingAuthError = true
                    }
                }
            }
        } else {
            self.textAuthError = "\(error?.localizedDescription ?? "Unknown biometry error")"
            self.showingAuthError = true
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
