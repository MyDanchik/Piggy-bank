import UIKit

protocol BanksViewModel {
    func transitionToAddBanksView()
    func loadBanks()
    var transition: ((DefaultAddBanksView) -> Void)? { get set }
    var setupBanks: (([Bank]) -> Void)? { get set }
}

final class DefaultBanksViewModel {
    
    var transition: ((DefaultAddBanksView) -> Void)?
    var setupBanks: (([Bank]) -> Void)?
    
    func transitionToAddBanksView() {
        let addBanksView = DefaultAddBanksView()
        let addBanksViewModel = DefaultAddBanksViewModel()
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
