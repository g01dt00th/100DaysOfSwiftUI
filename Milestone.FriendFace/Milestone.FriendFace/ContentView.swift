import SwiftUI

struct ContentView: View {
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(entity: CoreUser.entity(), sortDescriptors: []) var coreUsers: FetchedResults<CoreUser>
    
//    @State var users = [User]()
    
    var body: some View {
        NavigationView {
            List(coreUsers, id: \.id) { (user: CoreUser) in
                NavigationLink(destination: CoreDetailView(currentUser: user)) {
                    ZStack {
                        Circle()
                            .fill(user.isActive ? Color(red: 89 / 255, green: 180 / 255, blue: 144 / 255) : Color(red: 214 / 255, green: 87 / 255, blue: 70 / 255))
                            .frame(width: 35, height: 35)
                        
                        Text(user.initials)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                    }
                    
                    VStack(alignment: .leading) {
                        Text(user.name ?? "John Doe")
                            .font(.headline)
                        
                        Text(user.company ?? "Microsoft")
                            .font(.subheadline)
                    }
                }
            }
            
            
//            List(users, id: \.id) { item in
//                HStack {
//                    ZStack {
//                        Circle()
//                            .fill(item.isActive ? Color(red: 89 / 255, green: 180 / 255, blue: 144 / 255) : Color(red: 214 / 255, green: 87 / 255, blue: 70 / 255))
//                            .frame(width: 35, height: 35)
//
//                        Text(item.initials)
//                            .fontWeight(.bold)
//                            .foregroundColor(.white)
//                    }
//
//                    VStack(alignment: .leading) {
//                        Text(item.name)
//                            .font(.headline)
//
//                        Text(item.company)
//                            .font(.subheadline)
//                    }
//
//                    NavigationLink("", destination: DetailView(users: self.users, currentUser: item))
//                }
//            }
                
            .onAppear(perform: fetchData)
            .navigationBarTitle("FriendFace")
        }
    }
    
    func fetchData() {
        guard let url = URL(string: "https://www.hackingwithswift.com/samples/friendface.json") else {
            print("Invalid URL")
            return
        }
        
        let request = URLRequest(url: url)
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data1 = data else {
                print("Fetch failed: \(error?.localizedDescription ?? "Unknow error")")
                return
            }
            
            do {
                let decoded = try JSONDecoder().decode([User].self, from: data1)
//                self.users = decoded
                for user in decoded {
                    let coreUser = CoreUser(context: self.moc)
                    coreUser.id = user.id
                    coreUser.isActive = user.isActive
                    coreUser.name = user.name
                    coreUser.age = Int16(user.age)
                    coreUser.company = user.company
                    coreUser.email = user.email
                    coreUser.address = user.address
                    coreUser.about = user.about
                    coreUser.registered = user.registered
                    
                    do {
                        try self.moc.save()
                    } catch {
                        print(error.localizedDescription)
                    }
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
