import Foundation

struct Response: Codable {
    var users: [User]
}

struct User: Codable, Identifiable {
    let id: String
    let isActive: Bool
    let name: String
    let age: Int
    let company, email, address, about: String
    let registered: String
    let tags: [String]
    let friends: [Friend]
    
    var initials: String {
        var initials = ""
        
        for letter in name {
            if ("A"..."Z").contains(letter) {
                initials += String(letter)
            }
        }
        
        return initials
    }
    
    var formatterDate: String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        
        if let date = formatter.date(from: registered) {
            formatter.dateFormat = "MMMM yyyy"
            let dateLabel = formatter.string(from: date)
            
            return dateLabel
        }
        
        return "Failed date"
    }
}

struct Friend: Codable, Hashable {
    let id, name: String
    
    var initials: String {
        var initials = ""
        
        for letter in name {
            if ("A"..."Z").contains(letter) {
                initials += String(letter)
            }
        }
        
        return initials
    }
}
