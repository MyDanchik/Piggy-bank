import UIKit

final class InfoDiccountView: UIViewController {
    
    // MARK: - UI Elements
    
    private let titleLabel = UILabel()
    private let customFrontView = UIImageView()
    private let customBackView = UIImageView()
    
    // MARK: - Lifecycle Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addSubviews()
        configureConstraints()
        configureUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tabBarController?.tabBar.isHidden = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        tabBarController?.tabBar.isHidden = false
    }
    
    // MARK: - Private Methods
    
    private func addSubviews() {
        view.addSubview(titleLabel)
        view.addSubview(customFrontView)
        view.addSubview(customBackView)
    }
    
    private func configureConstraints() {
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 40).isActive = true
        titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        customFrontView.translatesAutoresizingMaskIntoConstraints = false
        customFrontView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 50).isActive = true
        customFrontView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 27).isActive = true
        customFrontView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -27).isActive = true
        customFrontView.heightAnchor.constraint(equalToConstant: 210).isActive = true
        
        customBackView.translatesAutoresizingMaskIntoConstraints = false
        customBackView.topAnchor.constraint(equalTo: customFrontView.bottomAnchor, constant: -20).isActive = true
        customBackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 57).isActive = true
        customBackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -57).isActive = true
        customBackView.heightAnchor.constraint(equalToConstant: 160).isActive = true
    }
    
    private func configureUI() {
        view.backgroundColor = UIColor(resource: .Colors.backgroundColorMain)
        
        titleLabel.textColor = UIColor(resource: .Colors.colorText)
        titleLabel.font = UIFont.rubik(ofSize: 24, style: .semiBold)
        
        customFrontView.contentMode = .scaleAspectFill
        customFrontView.layer.shadowColor = UIColor.black.cgColor
        customFrontView.layer.shadowOffset = CGSize(width: 0, height: 5)
        customFrontView.layer.shadowRadius = 6
        customFrontView.layer.shadowOpacity = 0.20
        customFrontView.layer.cornerRadius = 30
        customFrontView.backgroundColor = UIColor(resource: .Colors.backgroundColorMain)
        customFrontView.layer.masksToBounds = true
        
        customBackView.contentMode = .scaleAspectFill
        customBackView.layer.shadowColor = UIColor.black.cgColor
        customBackView.layer.shadowOffset = CGSize(width: 0, height: 5)
        customBackView.layer.shadowRadius = 6
        customBackView.layer.shadowOpacity = 0.20
        customBackView.layer.cornerRadius = 30
        customBackView.backgroundColor = UIColor(resource: .Colors.backgroundColorMain)
        customBackView.layer.masksToBounds = true
    }
    
    // MARK: - Public Methods
    func configureFullBirthdays(discounts: Discount) {
        if let imageData = discounts.imageFrontDiscount, let frontDiscount = UIImage(data: imageData) {
            customFrontView.image = frontDiscount
        } else {
            customFrontView.image = UIImage(named: "default_image")
        }
        if let imageData = discounts.imageBackDiscount, let backDiscount = UIImage(data: imageData) {
            customBackView.image = backDiscount
        } else {
            customBackView.image = UIImage(named: "default_image")
        }
        
        titleLabel.text = discounts.nameDiscount
    }
}
