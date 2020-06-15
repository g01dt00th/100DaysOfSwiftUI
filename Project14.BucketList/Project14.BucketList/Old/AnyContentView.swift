import SwiftUI
import LocalAuthentication

struct AnyContentView: View {
    @State private var isUnlocked = false
    
    var body: some View {
        VStack {
            if self.isUnlocked {
                MapKitView()
                    .edgesIgnoringSafeArea(.all)
            } else {
                Text("Locked Face ID")
            }
        }
        .onAppear(perform: authenticate)
    }
    
    func authenticate() {
        let context = LAContext()
        var error: NSError?
        
        if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) {
            let reason = "We need to unlock your data."
            
            context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: reason) {
                success, authenticationError in
                DispatchQueue.main.async {
                    if success {
                        self.isUnlocked = true
                    } else {
                        // there was a problem
                    }
                }
            }
        } else {
            // no biometrics
        }
    }
}

struct AnyContentView_Previews: PreviewProvider {
    static var previews: some View {
        AnyContentView()
    }
}
