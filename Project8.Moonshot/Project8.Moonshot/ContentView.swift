import SwiftUI

struct CustomText: View {
    var text: String
    
    var body: some View {
        Text(text)
    }
    
    init(_ text: String) {
        print("Creating a CustomText")
        self.text = text
    }
}

struct ContentView: View {
    var body: some View {
        NavigationView {
            ScrollView(.vertical) {
                VStack(spacing: 10) {
                    Image("aldrin")
                    
                    GeometryReader { geo in
                        Image("aldrin")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: geo.size.width)
                    }
                    
                    VStack {
                        ForEach(0 ..< 100) {
                            CustomText("Item \($0)")
                                .font(.title)
                        }
                    }
                    
                    NavigationLink(destination: Text("Detail View")) {
                        Text("Hello, World!")
                    }
                }
                .frame(maxWidth: .infinity)
                .navigationBarTitle("SwiftUI")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
