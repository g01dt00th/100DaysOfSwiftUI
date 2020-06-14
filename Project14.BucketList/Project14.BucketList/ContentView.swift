import SwiftUI

struct User: Identifiable, Comparable {
    let id = UUID()
    let firstName: String
    let lastName: String
    
    static func < (lhs: User, rhs: User) -> Bool {
        lhs.lastName < rhs.lastName
    }
}

struct LoadingView: View {
    var body: some View {
        Text("Loading")
    }
}

struct SuccessView: View {
    var body: some View {
        Text("Success!")
    }
}

struct FailedView: View {
    var body: some View {
        Text("Failed.")
    }
}

struct ContentView: View {
    let users = [
        User(firstName: "Arnold", lastName: "Rimmer"),
        User(firstName: "Kristine", lastName: "Kochanski"),
        User(firstName: "David", lastName: "Lister")
        ].sorted()
    
    func getDocumentsDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }
    
    enum LoadingState {
        case loading, success, failed
    }
    
    var loadingState = LoadingState.loading
    
    var body: some View {
        List(users) { user in
            HStack {
                Text("\(user.lastName), \(user.firstName)")
                
                if Bool.random() {
                    Circle()
                } else {
                    Rectangle()
                }
                
                Group {
                    if self.loadingState == .loading {
                        LoadingView()
                    } else if self.loadingState == . success {
                        SuccessView()
                    } else if self.loadingState == .failed {
                        FailedView()
                    }
                }
            }
        }
        .onTapGesture {
            let str = "Test Message"
            let url = self.getDocumentsDirectory().appendingPathComponent("message.txt")
            
            do {
                try str.write(to: url, atomically: true, encoding: .utf8)
                let input = try String(contentsOf: url)
                print(input)
            } catch {
                print(error.localizedDescription)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
