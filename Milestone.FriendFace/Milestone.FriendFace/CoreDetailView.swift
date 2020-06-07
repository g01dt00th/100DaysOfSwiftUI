import SwiftUI
import CoreData

struct CoreDetailView: View {
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(entity: CoreUser.entity(), sortDescriptors: []) var coreUsers: FetchedResults<CoreUser>
    
    let currentUser: CoreUser
    
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
            
            Text(currentUser.name ?? "Whats my name?")
                .font(.headline)
            
            Text(currentUser.formatterDate)
            
            Form {
                Section(header: Text("Contacts")) {
                    Text("Email: \(self.currentUser.email ?? "Wrong email")")
                    
                    Text("Company: \(self.currentUser.company ?? "Microsoft")")
                    
                    Text("Address: \(self.currentUser.address ?? "Wrong address")")
                }
                
                Section(header: Text("About")) {
                    Text("Age: \(self.currentUser.age)")
                    
                    Text(self.currentUser.about ?? "What?")
                    
                    Text(self.currentUser.id ?? "Wrong id")
                }
            }
        }
    }
}

struct CoreDetailView_Previews: PreviewProvider {
    static var currentUser: CoreUser {
        let newUser = CoreUser()
        newUser.name = "K"
        
        return newUser
    }
    
    static var previews: some View {
        CoreDetailView(currentUser: currentUser)
    }
}
