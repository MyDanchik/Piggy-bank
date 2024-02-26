import UIKit

protocol DiscountViewModel {
    func transitionToAddDiscountView()
    func loadBanks()
    var transition: ((DefaultAddDiscountView) -> Void)? { get set }
    var setupBanks: (([Discount]) -> Void)? { get set }
}

final class DefaultDiscountViewModel {
    
    var transition: ((DefaultAddDiscountView) -> Void)?
    var setupDiscounts: (([Discount]) -> Void)?
    
    func transitionToAddDiscountView() {
        let addDiscountView = DefaultAddDiscountView()
        let addDiscountViewModel = DefaultAddDiscountViewModel()
        addDiscountView.viewModel = addDiscountViewModel
        transition?(addDiscountView)
    }
        
    func loadDiscounts() {
        let operationResult = CoreDataManager.instance.getDiscounts()
        switch operationResult {
        case .success(let discounts):
            setupDiscounts?(discounts)
        case .failure(let error):
            print("Failed to load Bank: \(error)")
        }
    }
}

