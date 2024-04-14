import UIKit

final class ModifyBanksViewModel {
    
    // MARK: - Public Methods
    
    func modifyMyBanks(savedPriceBank: String?, forBankWithName name: String) {
        guard let savedPriceBank = savedPriceBank, !savedPriceBank.isEmpty else {
            return
        }
        
        let result = CoreDataManager.instance.modifyBanks(savedPriceBank: savedPriceBank, forBankWithName: name)
        
        switch result {
        case .success:
            print("Bank saved successfully")
            
        case .failure(let failure):
            print("Failed to save Bank: \(failure)")
        }
    }
}
