import UIKit
import CoreData

internal protocol CoreDataWrapperProtocol
{
    var appDelegate: AppDelegate { get }
    
    var context: NSManagedObjectContext { get }
    
    func createEntity(for entityName: String) -> NSEntityDescription?
    
    func insert(_ object: NSManagedObject)
    
    func saveContext()
}
