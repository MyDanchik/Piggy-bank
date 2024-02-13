import UIKit

final class DefaultBanksView: UIViewController {
    
    private let titleLabel = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupSubviews()
        setupConstraints()
        setupUI()
    }
    private func setupSubviews() {
        view.addSubview(titleLabel)

    }
    
    private func setupConstraints() {
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 80).isActive = true
        titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
    }
    private func setupUI() {
        titleLabel.text = "Your piggy banks"
        titleLabel.textColor = .black
        titleLabel.font = UIFont(name: "Rubik-Medium", size: 24)
        
    }
}
