import SwiftUI

struct ContentView: View {
    @ObservedObject var habits = Habits()
    @State private var showingAddHabit = false
    
    var body: some View {
        NavigationView {
            List {
                ForEach(habits.items) { item in
                    HStack {
                        VStack(alignment: .leading) {
                            Text(item.title)
                                .font(.headline)
                            
                            Text(item.description)
                            
                            Text(item.habit)
                            
                            Text("Completed \(item.amount) times.")
                        }
                    }
                }
                .onDelete(perform: removeItems)
            }
            .navigationBarTitle("Habits Tracker")
            .navigationBarItems(leading: EditButton(),
                                trailing:
                Button(action: {
                    self.showingAddHabit = true
                }) {
                    Image(systemName: "plus")
                }
            )
                .sheet(isPresented: $showingAddHabit) {
                    AddHabitView(habits: Habits())
            }
        }
    }
    
    func removeItems(at offsets: IndexSet) {
        habits.items.remove(atOffsets: offsets)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
