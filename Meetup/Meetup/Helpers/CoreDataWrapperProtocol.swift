import UIKit
import CoreData

internal protocol CoreDataWrapperProtocol
{
    var appDelegate: AppDelegate { get }
    
    var context: NSManagedObjectContext { get }
    
    func createEntity(for entityName: String) -> NSEntityDescription?
    
    func insert(_ object: NSManagedObject)
    
    func fetch(entityName: String,
               withFetchLimit limit: Int?,
               withSortDescriptors sortDescriptors: [NSSortDescriptor]?)
    -> [Any]?
    
    func saveContext()
}

extension CoreDataWrapperProtocol
{
    func fetch(entityName: String,
               withFetchLimit limit: Int? = nil,
               withSortDescriptors sortDescriptors: [NSSortDescriptor]? = nil)
        -> [Any]?
    {
        return fetch(entityName: entityName, withFetchLimit: limit, withSortDescriptors: sortDescriptors)
    }
}
