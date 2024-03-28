import UIKit

final class DiscountViewModel {
    
    var transition: ((AddDiscountView) -> Void)?
    var setupDiscounts: (([Discount]) -> Void)?
    
    func transitionToAddDiscountView() {
        let addDiscountView = AddDiscountView()
        let addDiscountViewModel = AddDiscountViewModel()
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

