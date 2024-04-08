import UIKit

final class InfoDiccountView: UIViewController {
    
    // MARK: - UI Elements
    
    private let titleLabel = UILabel()
    private let infoLabel = UILabel()
    private let customFrontView = UIImageView()
    private let frontView = UIView()
    private let customBackView = UIImageView()
    private let backView = UIView()
    
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
        view.addSubview(infoLabel)
        frontView.addSubview(customFrontView)
        view.addSubview(frontView)
        backView.addSubview(customBackView)
        view.addSubview(backView)
        
    }
    
    //MARK: - Configure constraintes
    
    private func configureConstraints() {
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 40).isActive = true
        titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        infoLabel.translatesAutoresizingMaskIntoConstraints = false
        infoLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        infoLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 90).isActive = true
        
        customFrontView.translatesAutoresizingMaskIntoConstraints = false
        customFrontView.topAnchor.constraint(equalTo: infoLabel.bottomAnchor, constant: 15).isActive = true
        customFrontView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 27).isActive = true
        customFrontView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -27).isActive = true
        customFrontView.heightAnchor.constraint(equalToConstant: 210).isActive = true
        
        frontView.translatesAutoresizingMaskIntoConstraints = false
        frontView.topAnchor.constraint(equalTo: infoLabel.bottomAnchor, constant: 15).isActive = true
        frontView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 27).isActive = true
        frontView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -27).isActive = true
        frontView.heightAnchor.constraint(equalToConstant: 210).isActive = true
        
        customBackView.translatesAutoresizingMaskIntoConstraints = false
        customBackView.topAnchor.constraint(equalTo: customFrontView.bottomAnchor, constant: -20).isActive = true
        customBackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 57).isActive = true
        customBackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -57).isActive = true
        customBackView.heightAnchor.constraint(equalToConstant: 160).isActive = true
        
        backView.translatesAutoresizingMaskIntoConstraints = false
        backView.topAnchor.constraint(equalTo: customFrontView.bottomAnchor, constant: -20).isActive = true
        backView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 57).isActive = true
        backView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -57).isActive = true
        backView.heightAnchor.constraint(equalToConstant: 160).isActive = true
    }
    
    //MARK: - Configure UI
    
    private func configureUI() {
        view.backgroundColor = UIColor(resource: .Colors.backgroundColorMain)
        
        titleLabel.textColor = UIColor(resource: .Colors.colorText)
        titleLabel.font = UIFont.rubik(ofSize: 24, style: .semiBold)
        
        infoLabel.textColor = UIColor(resource: .Colors.colorText)
        infoLabel.font = UIFont.rubik(ofSize: 20, style: .light)
        infoLabel.text = NSLocalizedString("App.AddDiscountView.InfoLabel", comment: "")
        
        customFrontView.contentMode = .scaleAspectFill
        customFrontView.layer.cornerRadius = 30
        customFrontView.layer.masksToBounds = true
        
        frontView.backgroundColor = UIColor(resource: .Colors.backgroundColorMain)
        frontView.layer.shadowColor = UIColor.black.cgColor
        frontView.layer.shadowOffset = CGSize(width: 0, height: 5)
        frontView.layer.shadowRadius = 6
        frontView.layer.shadowOpacity = 0.20
        frontView.layer.cornerRadius = 30
        
        customBackView.contentMode = .scaleAspectFill
        customBackView.layer.cornerRadius = 30
        customBackView.layer.masksToBounds = true
        
        backView.backgroundColor = UIColor(resource: .Colors.backgroundColorMain)
        backView.layer.shadowColor = UIColor.black.cgColor
        backView.layer.shadowOffset = CGSize(width: 0, height: 5)
        backView.layer.shadowRadius = 6
        backView.layer.shadowOpacity = 0.20
        backView.layer.cornerRadius = 30
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
