import Foundation
import CoreData


extension CoreFriend {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CoreFriend> {
        return NSFetchRequest<CoreFriend>(entityName: "CoreFriend")
    }

    @NSManaged public var id: String?
    @NSManaged public var name: String?
    @NSManaged public var friend: CoreUser?

}
