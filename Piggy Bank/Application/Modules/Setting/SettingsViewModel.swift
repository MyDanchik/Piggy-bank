import UIKit

final class SettingsViewModel {
    
    var transition: ((AboutView) -> Void)?
    
    func transitionToAboutView() {
        let aboutView = AboutView()
        let aboutViewModel = AboutViewModel()
        aboutView.viewModel = aboutViewModel
        transition?(aboutView)
    }
    
}
