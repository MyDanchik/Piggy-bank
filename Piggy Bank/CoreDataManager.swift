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

    func saveDiscounts(imageFrontDiscount: Data, imageBackDiscount: Data, nameDiscount: String) -> Result<Void, CoreDataError> {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return .failure(.error("AppDelegate not found"))
        }

        let managedContext = appDelegate.persistentContainer.viewContext

        let entity = NSEntityDescription.entity(forEntityName: "Discount", in: managedContext)!

        let discounts = NSManagedObject(entity: entity, insertInto: managedContext)

        discounts.setValue(imageFrontDiscount, forKey: "imageFrontDiscount")
        discounts.setValue(imageBackDiscount, forKey: "imageBackDiscount")
        discounts.setValue(nameDiscount, forKey: "nameDiscount")

        do {
            try managedContext.save()
            return .success(())
        } catch {
            return .failure(.error("Could not save. \(error)"))
        }
    }
    
    func getDiscounts() -> Result<[Discount], CoreDataError> {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return .failure(.error("AppDelegate not found"))
        }

        let managedContext = appDelegate.persistentContainer.viewContext

        let fetchRequest = NSFetchRequest<Discount>(entityName: "Discount")

        do {
            let objects = try managedContext.fetch(fetchRequest)
            return .success(objects)
        } catch {
            return .failure(.error("Could not fetch \(error)"))
        }
    }
    
    func deleteDiscounts(_ discounts: Discount) -> Result<Void, CoreDataError> {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return .failure(.error("AppDelegate not found"))
        }

        let managedContext = appDelegate.persistentContainer.viewContext

        do {
            managedContext.delete(discounts)
            try managedContext.save()
            return .success(())
        } catch {
            return .failure(.error("Error deleting Banks: \(error)"))
        }
    }
    
    func saveBanks(imageBank: Data, nameBank: String, priceBank: String) -> Result<Void, CoreDataError> {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return .failure(.error("AppDelegate not found"))
        }

        let managedContext = appDelegate.persistentContainer.viewContext

        let entity = NSEntityDescription.entity(forEntityName: "Bank", in: managedContext)!

        let banks = NSManagedObject(entity: entity, insertInto: managedContext)

        banks.setValue("0", forKey: "savedPriceBank")

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

    
    func modifyBanks(savedPriceBank: String, forBankWithName name: String) -> Result<Void, CoreDataError> {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return .failure(.error("AppDelegate not found"))
        }

        let managedContext = appDelegate.persistentContainer.viewContext

        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Bank")
        fetchRequest.predicate = NSPredicate(format: "nameBank == %@", name)

        do {
            let banks = try managedContext.fetch(fetchRequest)
            if let bankToUpdate = banks.first as? NSManagedObject {
                bankToUpdate.setValue(savedPriceBank, forKey: "savedPriceBank")
                try managedContext.save()
                return .success(())
            } else {
                return .failure(.error("Bank with name \(name) not found"))
            }
        } catch {
            return .failure(.error("Could not modify bank: \(error)"))
        }
    }
    
    func getCurrentBank(withName name: String) -> Bank? {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            print("AppDelegate not found")
            return nil
        }

        let managedContext = appDelegate.persistentContainer.viewContext

        let fetchRequest = NSFetchRequest<Bank>(entityName: "Bank")
        fetchRequest.predicate = NSPredicate(format: "nameBank == %@", name)

        do {
            let banks = try managedContext.fetch(fetchRequest)
            return banks.first
        } catch {
            print("Error fetching bank: \(error)")
            return nil
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
