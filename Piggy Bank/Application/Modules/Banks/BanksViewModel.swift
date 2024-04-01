import UIKit

final class BanksViewModel {
    
    // MARK: - Properties
    
    var transition: ((AddBanksView) -> Void)?
    var setupBanks: (([Bank]) -> Void)?
    
    // MARK: - Methods
    
    func transitionToAddBanksView() {
        let addBanksView = AddBanksView()
        let addBanksViewModel = AddBanksViewModel()
        addBanksView.viewModel = addBanksViewModel
        transition?(addBanksView)
    }
    
    func loadBanks() {
        let operationResult = CoreDataManager.instance.getBanks()
        switch operationResult {
        case .success(let banks):
            setupBanks?(banks)
        case .failure(let error):
            print("Failed to load Bank: \(error)")
        }
    }
}
