import SwiftUI
import Combine
import Foundation

class ImageFetcher: ObservableObject {
    var didChange = PassthroughSubject<Data, Never>()
    
    @Published var data: Data = Data() {
        didSet {
            didChange.send(data)
        }
    }
    
    init(urlString: String) {
        guard let url = URL(string: urlString) else {
            print("Invalid URL")
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, _, _ in
            guard let data = data else { return }
            DispatchQueue.main.async { [weak self] in
                self?.data = data
            }
        }.resume()
    }
}

struct LoadableImageView: View {
    @ObservedObject var imageFetcher: ImageFetcher
    
    var stateContent: AnyView {
        if let image = UIImage(data: imageFetcher.data) {
            return AnyView(
                Image(uiImage: image)
                    .resizable()
                    .scaledToFill()
                    .edgesIgnoringSafeArea(.all)
            )
        } else {
            return AnyView(
                Text("Sorry, dude. Loading...")
                    .font(.largeTitle)
                    .fontWeight(.heavy)
            )
        }
    }
    
    init(with urlString: String) {
        imageFetcher = ImageFetcher(urlString: urlString)
    }
    
    var body: some View {
        VStack {
            stateContent
        }
    }
    
}

struct ContentView: View {
    @State private var randomPhotoURL = ""
    @State private var locationTitle = ""
    
    var body: some View {
        ZStack {
            LoadableImageView(with: "\(randomPhotoURL).png")
            
            VStack {
                Spacer()
                
                HStack(alignment: .center) {
                    Text(locationTitle)
                        .font(.title)
                        .fontWeight(.heavy)
                        .foregroundColor(.white)
                        .lineLimit(nil)
                        .padding()
                    
                    Button(action: loadRandomPhoto) {
                        Text("Next")
                    }
                }
                .padding()
            }
        }
        .onAppear(perform: loadRandomPhoto)
    }
    
    func loadRandomPhoto() {
        guard let url = URL(string: "https://api.unsplash.com/photos/random/?client_id=W9jCkP1FqqzBQwGlqBNXRWDeKj9FXsDNT7t35TfRFSQ") else {
            print("Invalid URL")
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data else {
                print("Fetch failed: \(error?.localizedDescription ?? "Unknow error")")
                return
            }
            
            do {
                let decoded = try JSONDecoder().decode(Response.self, from: data)
                DispatchQueue.main.async {
                    self.randomPhotoURL = decoded.urls?.full ?? "Invalid URL"
                    self.locationTitle = decoded.location?.title ?? "Unknown title"
                }
            } catch let decodingError {
                print("Decoding failed: \(decodingError.localizedDescription)")
            }
        }.resume()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
