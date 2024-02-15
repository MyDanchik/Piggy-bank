import UIKit

protocol BanksViewModel {
    func transitionToAddBanksView()
    var transition: ((DefaultAddBanksView) -> Void)? { get set }
}

final class DefaultBanksViewModel {
    
    var transition: ((DefaultAddBanksView) -> Void)?
    
    func transitionToAddBanksView() {
        let addBanksView = DefaultAddBanksView()
        let addBanksViewModel = DefaultAddBanksViewModel()
        addBanksView.viewModel = addBanksViewModel
        transition?(addBanksView)
    }
}
