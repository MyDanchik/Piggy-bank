import CoreData
import UIKit

// MARK: - CoreDataError

enum CoreDataError: Error {
    case error(String)
}

// MARK: - CoreDataManager

final class CoreDataManager {
    static let instance = CoreDataManager()
    private init() {}

    func saveBanks(imageBank: Data, nameBank: String, priceBank: String) -> Result<Void, CoreDataError> {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return .failure(.error("AppDelegate not found"))
        }

        let managedContext = appDelegate.persistentContainer.viewContext

        let entity = NSEntityDescription.entity(forEntityName: "Bank", in: managedContext)!

        let banks = NSManagedObject(entity: entity, insertInto: managedContext)

        banks.setValue(imageBank, forKey: "imageBank")
        banks.setValue(nameBank, forKey: "nameBank")
        banks.setValue(priceBank, forKey: "priceBank")

        do {
            try managedContext.save()
            return .success(())
        } catch {
            return .failure(.error("Could not save. \(error)"))
        }
    }
    
    func getBanks() -> Result<[Bank], CoreDataError> {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return .failure(.error("AppDelegate not found"))
        }

        let managedContext = appDelegate.persistentContainer.viewContext

        let fetchRequest = NSFetchRequest<Bank>(entityName: "Bank")

        do {
            let objects = try managedContext.fetch(fetchRequest)
            return .success(objects)
        } catch {
            return .failure(.error("Could not fetch \(error)"))
        }
    }
    
    func deleteBanks(_ banks: Bank) -> Result<Void, CoreDataError> {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return .failure(.error("AppDelegate not found"))
        }

        let managedContext = appDelegate.persistentContainer.viewContext

        do {
            managedContext.delete(banks)
            try managedContext.save()
            return .success(())
        } catch {
            return .failure(.error("Error deleting Banks: \(error)"))
        }
    }
}
