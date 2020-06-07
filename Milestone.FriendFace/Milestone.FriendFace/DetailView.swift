import SwiftUI

struct DetailView: View {
    var users: [User]
    let currentUser: User
    
    var body: some View {
        VStack {
            ZStack {
                Circle()
                    .fill(currentUser.isActive ? Color(red: 89 / 255, green: 180 / 255, blue: 144 / 255) : Color(red: 214 / 255, green: 87 / 255, blue: 70 / 255))
                    .frame(width: 70, height: 70)
                
                Text(currentUser.initials)
                    .fontWeight(.bold)
                    .font(.system(size: 35))
                    .foregroundColor(.white)
            }
            
            Text(currentUser.name)
                .font(.headline)
            
            Text(currentUser.formatterDate)
            
            Form {
                Section(header: Text("Contacts")) {
                    Text("Email: \(self.currentUser.email)")
                    
                    Text("Company: \(self.currentUser.company)")
                    
                    Text("Address: \(self.currentUser.address)")
                }
                
                Section(header: Text("About")) {
                    Text("Age: \(self.currentUser.age)")
                    
                    Text(self.currentUser.about)
                    
                    Text(self.currentUser.id)
                }
                
                Section(header: Text("Friends")) {
                    List(self.currentUser.friends, id: \.id) { friend in
                        ForEach(self.users) { user in
                            if friend.id == user.id {
                                NavigationLink(destination: DetailView(users: self.users, currentUser: user)) {
                                    HStack {
                                        ZStack {
                                            Circle()
                                                .fill(user.isActive ? Color(red: 89 / 255, green: 180 / 255, blue: 144 / 255) : Color(red: 214 / 255, green: 87 / 255, blue: 70 / 255))
                                                .frame(width: 35, height: 35)
                                            
                                            Text(user.initials)
                                                .fontWeight(.bold)
                                                .foregroundColor(.white)
                                        }
                                        
                                        VStack(alignment: .leading) {
                                            Text(user.name)
                                                .font(.headline)
                                            
                                            Text(user.id)
                                                .font(.subheadline)
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
    }
}

struct DetailView_Previews: PreviewProvider {
    static let user = User(id: "1", isActive: false, name: "Joe Bloggs", age: 20, company: "Company", email: "Email", address: "address", about: "about", registered: "", tags: [], friends: [])
    
    static var previews: some View {
        DetailView(users: [user], currentUser: user)
    }
}
