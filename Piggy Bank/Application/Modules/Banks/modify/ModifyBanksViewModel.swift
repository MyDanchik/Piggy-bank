import UIKit

final class ModifyBanksViewModel {
    
    func modifyMyBanks(savedPriceBank: String?, forBankWithName name: String) {
        guard let savedPriceBank = savedPriceBank, !savedPriceBank.isEmpty else {
            let alertEmpty = UIAlertController(title: NSLocalizedString("Bank.alertEmpty", comment: ""), message: "", preferredStyle: .alert)
            alertEmpty.addAction(UIAlertAction(title: NSLocalizedString("Bank.alertOK", comment: ""), style: .destructive, handler: nil))
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
