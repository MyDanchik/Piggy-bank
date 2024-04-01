import UIKit

final class AddBanksViewModel {
    
    let images: [UIImage] = [UIImage(named: "icon1")!,
                             UIImage(named: "icon2")!,
                             UIImage(named: "icon3")!,
                             UIImage(named: "icon4")!,
                             UIImage(named: "icon5")!,
                             UIImage(named: "icon6")!]
    
    func saveNewBanks(imageBanks: Data?, nameBanks: String?, priceBanks: String?) {
        guard let imageBanks = imageBanks, imageBanks.count > 0,
              let nameBanks = nameBanks, !nameBanks.isEmpty,
              let priceBanks = priceBanks, priceBanks != "-" else {
            let alertEmpty = UIAlertController(title: NSLocalizedString("Bank.alertEmpty", comment: ""), message: "", preferredStyle: .alert)
            alertEmpty.addAction(UIAlertAction(title: NSLocalizedString("Bank.alertOK", comment: ""), style: .destructive, handler: nil))
            return
        }
        
        let result = CoreDataManager.instance.saveBanks(imageBank: imageBanks, nameBank: nameBanks, priceBank: priceBanks)
        
        switch result {
        case .success:
            print("Bank saved successfully")
            
        case .failure(let failure):
            print("Failed to save Bank: \(failure)")
        }
    }
}
