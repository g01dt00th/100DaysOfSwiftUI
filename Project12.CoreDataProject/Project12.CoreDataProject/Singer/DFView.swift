import SwiftUI

struct DFView: View {
    @Environment(\.managedObjectContext) var moc
    @State var lastNameFilter = "A"
    
    private var sort = [NSSortDescriptor(key: "lastName", ascending: true)]
    
    var body: some View {
        VStack {
            FilteredList(predicate: .beginsWith, filterKey: "lastName", filterValue: lastNameFilter, sortDescriptors: sort) { (singer: Singer) in
                Text("\(singer.wrappedFirstName) \(singer.wrappedLastName)")
            }
            
            Button("Add Examples") {
                let taylor = Singer(context: self.moc)
                taylor.firstName = "Taylor"
                taylor.lastName = "Swift"
                
                let ed = Singer(context: self.moc)
                ed.firstName = "Ed"
                ed.lastName = "Sheeran"
                
                let adele = Singer(context: self.moc)
                adele.firstName = "Adele"
                adele.lastName = "Adkins"
                
                try? self.moc.save()
            }
            
            Button("Show A") {
                self.lastNameFilter = "A"
            }
            
            Button("Show S") {
                self.lastNameFilter = "S"
            }
        }
    }
}

struct DFView_Previews: PreviewProvider {
    static var previews: some View {
        DFView()
    }
}
