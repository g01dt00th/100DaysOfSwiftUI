import SwiftUI

struct DetailView: View {
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
            
            List {
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
                    ForEach(self.currentUser.friends, id: \.id) { item in
                        NavigationLink(destination: DetailView(currentUser: self.currentUser)) {
                                HStack {
                                    ZStack {
                                        Circle()
                                            .fill(Color(red: 240 / 255, green: 184 / 255, blue: 67 / 255))
                                            .frame(width: 35, height: 35)
                                        
                                        Text(item.initials)
                                            .fontWeight(.bold)
                                            .foregroundColor(.white)
                                    }
                                    
                                    VStack(alignment: .leading) {
                                        Text(item.name)
                                            .font(.headline)
                                        
                                        Text(item.id)
                                            .font(.subheadline)
                                    }
                                }
                        }
                    }
                }
            }
            .listStyle(GroupedListStyle())
        }
    }
}

struct DetailView_Previews: PreviewProvider {
    static let user = User(id: "1", isActive: false, name: "Joe Bloggs", age: 20, company: "Company", email: "Email", address: "address", about: "about", registered: "", tags: [], friends: [])
    
    static var previews: some View {
        DetailView(currentUser: user)
    }
}
