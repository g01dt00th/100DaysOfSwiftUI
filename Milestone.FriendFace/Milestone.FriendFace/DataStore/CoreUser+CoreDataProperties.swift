import Foundation
import CoreData


extension CoreUser {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CoreUser> {
        return NSFetchRequest<CoreUser>(entityName: "CoreUser")
    }

    @NSManaged public var id: String?
    @NSManaged public var isActive: Bool
    @NSManaged public var name: String?
    @NSManaged public var age: Int16
    @NSManaged public var company: String?
    @NSManaged public var email: String?
    @NSManaged public var address: String?
    @NSManaged public var about: String?
    @NSManaged public var registered: String?
    @NSManaged public var friends: CoreFriend?
    
    public var initials: String {
        var initials = ""
        
        for letter in name ?? "$" {
            if ("A"..."Z").contains(letter) {
                initials += String(letter)
            }
        }
        
        return initials
    }
    
    var formatterDate: String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        
        if let date = formatter.date(from: registered ?? "") {
            formatter.dateFormat = "MMMM yyyy"
            let dateLabel = formatter.string(from: date)
            
            return dateLabel
        }
        
        return "Failed date"
    }
}
