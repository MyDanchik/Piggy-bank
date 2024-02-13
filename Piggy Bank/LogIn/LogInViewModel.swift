import UIKit

protocol LogInViewModel {
}

final class DefaultLogInViewModel: LogInViewModel {
}

protocol DefaultLogInViewDelegate: AnyObject {
    func didFinishLoggingIn()
}
