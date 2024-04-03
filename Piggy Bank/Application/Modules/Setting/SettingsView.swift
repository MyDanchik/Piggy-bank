import UIKit

//MARK: - Final class SettingsViewController

final class SettingsViewController: UIViewController {
    
    // MARK: - Public Properties    
    private var viewModel: SettingsViewModel!
    
    private let titleLabel = UILabel()
    private let aboutOfUseView = UIView()
    private let privacyPolicyView = UIView()
    private let iconAboutImageView = UIImageView()
    private let iconPrivacyImageView = UIImageView()
    private let aboutLabel = UILabel()
    private let privacyLabel = UILabel()
    private let aboutNextArrowImageView = UIImageView()
    private let privacyNextArrowImageView = UIImageView()
    private let aboutOfUseButton = UIButton(type: .system)
    private let privacyPolicyButton = UIButton(type: .system)
    
    // MARK: - LyfeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel = SettingsViewModel()
        addSubviews()
        configureConstraints()
        configureUI()
        navigationCont()
    }
        
    // MARK: - Add subviews
    
    private func addSubviews() {
        view.addSubview(titleLabel)
        view.addSubview(aboutOfUseView)
        view.addSubview(privacyPolicyView)
        aboutOfUseView.addSubview(aboutOfUseButton)
        privacyPolicyView.addSubview(privacyPolicyButton)
        aboutOfUseButton.addSubview(aboutLabel)
        aboutOfUseButton.addSubview(aboutNextArrowImageView)
        aboutOfUseButton.addSubview(iconAboutImageView)
        privacyPolicyButton.addSubview(privacyLabel)
        privacyPolicyButton.addSubview(privacyNextArrowImageView)
        privacyPolicyButton.addSubview(iconPrivacyImageView)
    }
    
    //MARK: - Configure constraintes
    
    private func configureConstraints() {
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 80).isActive = true
        titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
                
        aboutOfUseView.translatesAutoresizingMaskIntoConstraints = false
        aboutOfUseView.topAnchor.constraint(equalTo: titleLabel.safeAreaLayoutGuide.bottomAnchor, constant: 55).isActive = true
        aboutOfUseView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24).isActive = true
        aboutOfUseView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24).isActive = true
        aboutOfUseView.heightAnchor.constraint(equalToConstant: 60).isActive = true
        
        iconAboutImageView.translatesAutoresizingMaskIntoConstraints = false
        iconAboutImageView.centerYAnchor.constraint(equalTo: aboutOfUseView.centerYAnchor).isActive = true
        iconAboutImageView.leadingAnchor.constraint(equalTo: aboutOfUseView.leadingAnchor, constant: 15).isActive = true
        iconAboutImageView.widthAnchor.constraint(equalToConstant: 25).isActive = true
        
        aboutNextArrowImageView.translatesAutoresizingMaskIntoConstraints = false
        aboutNextArrowImageView.centerYAnchor.constraint(equalTo: aboutOfUseView.centerYAnchor).isActive = true
        aboutNextArrowImageView.trailingAnchor.constraint(equalTo: aboutOfUseView.trailingAnchor, constant: -11).isActive = true
        aboutNextArrowImageView.widthAnchor.constraint(equalToConstant: 28).isActive = true
        
        aboutLabel.translatesAutoresizingMaskIntoConstraints = false
        aboutLabel.centerYAnchor.constraint(equalTo: aboutOfUseView.centerYAnchor).isActive = true
        aboutLabel.leadingAnchor.constraint(equalTo: iconAboutImageView.trailingAnchor, constant: 10).isActive = true
        aboutLabel.widthAnchor.constraint(greaterThanOrEqualToConstant: 125).isActive = true
        
        aboutOfUseButton.translatesAutoresizingMaskIntoConstraints = false
        aboutOfUseButton.topAnchor.constraint(equalTo: aboutOfUseView.topAnchor).isActive = true
        aboutOfUseButton.leadingAnchor.constraint(equalTo: aboutOfUseView.leadingAnchor).isActive = true
        aboutOfUseButton.trailingAnchor.constraint(equalTo: aboutOfUseView.trailingAnchor).isActive = true
        aboutOfUseButton.bottomAnchor.constraint(equalTo: aboutOfUseView.bottomAnchor).isActive = true
        
        privacyPolicyView.translatesAutoresizingMaskIntoConstraints = false
        privacyPolicyView.topAnchor.constraint(equalTo: aboutOfUseView.bottomAnchor, constant: 20).isActive = true
        privacyPolicyView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24).isActive = true
        privacyPolicyView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24).isActive = true
        privacyPolicyView.heightAnchor.constraint(equalToConstant: 60).isActive = true

        iconPrivacyImageView.translatesAutoresizingMaskIntoConstraints = false
        iconPrivacyImageView.centerYAnchor.constraint(equalTo: privacyPolicyView.centerYAnchor).isActive = true
        iconPrivacyImageView.leadingAnchor.constraint(equalTo: privacyPolicyView.leadingAnchor, constant: 15).isActive = true
        iconPrivacyImageView.widthAnchor.constraint(equalToConstant: 25).isActive = true
        
        privacyNextArrowImageView.translatesAutoresizingMaskIntoConstraints = false
        privacyNextArrowImageView.centerYAnchor.constraint(equalTo: privacyPolicyView.centerYAnchor).isActive = true
        privacyNextArrowImageView.trailingAnchor.constraint(equalTo: privacyPolicyView.trailingAnchor, constant: -11).isActive = true
        privacyNextArrowImageView.widthAnchor.constraint(equalToConstant: 28).isActive = true
        
        privacyLabel.translatesAutoresizingMaskIntoConstraints = false
        privacyLabel.centerYAnchor.constraint(equalTo: privacyPolicyView.centerYAnchor).isActive = true
        privacyLabel.leadingAnchor.constraint(equalTo: iconPrivacyImageView.trailingAnchor, constant: 10).isActive = true
        privacyLabel.widthAnchor.constraint(greaterThanOrEqualToConstant: 125).isActive = true
        
        privacyPolicyButton.translatesAutoresizingMaskIntoConstraints = false
        privacyPolicyButton.topAnchor.constraint(equalTo: privacyPolicyView.topAnchor).isActive = true
        privacyPolicyButton.leadingAnchor.constraint(equalTo: privacyPolicyView.leadingAnchor).isActive = true
        privacyPolicyButton.trailingAnchor.constraint(equalTo: privacyPolicyView.trailingAnchor).isActive = true
        privacyPolicyButton.bottomAnchor.constraint(equalTo: privacyPolicyView.bottomAnchor).isActive = true
    }
    
    //MARK: - Configure UI
    
    private func configureUI() {
        view.backgroundColor = UIColor(resource: .Colors.backgroundColorMain)

        titleLabel.text = "Настройки"
        titleLabel.textColor = UIColor(resource: .Colors.colorText)
        titleLabel.font = UIFont.rubik(ofSize: 24, style: .bold)
                
        iconAboutImageView.image = UIImage(named: "roundedTerms")?.withRenderingMode(.alwaysTemplate)
        iconAboutImageView.tintColor = UIColor(resource: .Colors.colorText)
        iconAboutImageView.contentMode = .scaleAspectFit

        aboutNextArrowImageView.tintColor = UIColor(resource: .Colors.colorText)
        aboutNextArrowImageView.image = UIImage(systemName: "chevron.forward")
        aboutNextArrowImageView.contentMode = .scaleAspectFit
        
        aboutLabel.textAlignment = .left
        aboutLabel.font = UIFont.rubik(ofSize: 15, style: .light)
        aboutLabel.text = "About us"
        
        iconPrivacyImageView.image = UIImage(named: "roundedPrivacy")?.withRenderingMode(.alwaysTemplate)
        iconPrivacyImageView.tintColor = UIColor(resource: .Colors.colorText)
        iconPrivacyImageView.contentMode = .scaleAspectFit
        
        privacyNextArrowImageView.image = UIImage(systemName: "chevron.forward")
        privacyNextArrowImageView.tintColor = UIColor(resource: .Colors.colorText)
        privacyNextArrowImageView.contentMode = .scaleAspectFit
        
        privacyLabel.textAlignment = .left
        privacyLabel.font = UIFont.rubik(ofSize: 15, style: .light)
        privacyLabel.text = "Privacy policy"
        
        aboutOfUseButton.backgroundColor = UIColor(resource: .Colors.backgroundColorCell)
        aboutOfUseButton.addTarget(self, action: #selector(aboutOfUseButtonTapped), for: .touchUpInside)
        aboutOfUseButton.layer.cornerRadius = 30
        aboutOfUseButton.layer.shadowColor = UIColor.black.cgColor
        aboutOfUseButton.layer.shadowOffset = CGSize(width: 0, height: 2)
        aboutOfUseButton.layer.shadowRadius = 5
        aboutOfUseButton.layer.shadowOpacity = 0.20
        
        privacyPolicyButton.backgroundColor = UIColor(resource: .Colors.backgroundColorCell)
        privacyPolicyButton.addTarget(self, action: #selector(privacyPolicyButtonTapped), for: .touchUpInside)
        privacyPolicyButton.layer.cornerRadius = 30
        privacyPolicyButton.layer.shadowColor = UIColor.black.cgColor
        privacyPolicyButton.layer.shadowOffset = CGSize(width: 0, height: 2)
        privacyPolicyButton.layer.shadowRadius = 5
        privacyPolicyButton.layer.shadowOpacity = 0.20
    }
    
    func navigationCont() {
        navigationController?.navigationBar.isHidden = true
        viewModel.transition = { [weak self] AboutView in
            self?.navigationController?.pushViewController(AboutView, animated: true)
        }
    }
    
    //MARK: - Actions
    
    @objc private func aboutOfUseButtonTapped() {
        viewModel.transitionToAboutView()
    }
    
    @objc private func privacyPolicyButtonTapped() {
        print("Privacy policy")
    }
}
