import UIKit
import CoreData

internal class CoreDataWrapper: CoreDataWrapperProtocol
{
    var appDelegate: AppDelegate
    {
        get
        {
            return UIApplication.shared.delegate as! AppDelegate
        }
    }
    
    var context: NSManagedObjectContext
    {
        get
        {
            return self.appDelegate.persistentContainer.viewContext
        }
    }
    
    func createEntity(for entityName: String) -> NSEntityDescription?
    {
        return NSEntityDescription.entity(forEntityName: entityName, in: self.context)
    }
    
    func insert(_ object: NSManagedObject)
    {
        self.context.insert(object)
    }
    
    func fetch(entityName: String, withFetchLimit limit: Int? = nil) -> [Any]?
    {
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: entityName)
        
        if let limit = limit
        {
            fetchRequest.fetchLimit = limit
        }
        
        let data = try? self.context.fetch(fetchRequest)
        return data
    }
    
    func saveContext()
    {
        self.appDelegate.saveContext()
    }
}
