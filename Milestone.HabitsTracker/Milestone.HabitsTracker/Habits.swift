import Foundation

class Habits: ObservableObject {
    @Published var items: [HabitsItem] {
        didSet {
            let encoder = JSONEncoder()
            
            if let encoded = try? encoder.encode(items) {
                UserDefaults.standard.set(encoded, forKey: "Items")
            }
        }
    }
    
    init() {
        if let items = UserDefaults.standard.data(forKey: "Items") {
            let decoder = JSONDecoder()
            
            if let decoded = try? decoder.decode([HabitsItem].self, from: items) {
                self.items = decoded
                return
            }
        }
        
        self.items = []
    }
}
