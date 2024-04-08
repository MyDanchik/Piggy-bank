import UIKit

final class AboutView: UIViewController {
    
    // MARK: - Properties
    
    var viewModel: AboutViewModel!

    // MARK: - UI Elements
    
    private let imageView = UIImageView()
    private let piggyImageView = UIImageView()
    private let infoLabel = UILabel()
    private let backButton = UIButton(type: .system)
    
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
    
    // MARK: - Add subviews
    
    private func addSubviews() {
        view.addSubview(imageView)
        view.addSubview(piggyImageView)
        view.addSubview(infoLabel)
        view.addSubview(backButton)
    }
    
    //MARK: - Configure constraintes
    
    private func configureConstraints() {
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        imageView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        imageView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        imageView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        
        piggyImageView.translatesAutoresizingMaskIntoConstraints = false
        piggyImageView.topAnchor.constraint(equalToSystemSpacingBelow: view.topAnchor, multiplier: 8).isActive = true
        piggyImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        infoLabel.translatesAutoresizingMaskIntoConstraints = false
        infoLabel.topAnchor.constraint(equalTo: piggyImageView.bottomAnchor, constant: -30).isActive = true
        infoLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24).isActive = true
        infoLabel.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -24).isActive = true
        
        backButton.translatesAutoresizingMaskIntoConstraints = false
        backButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 55).isActive = true
        backButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15).isActive = true
        backButton.heightAnchor.constraint(equalToConstant: 55).isActive = true
        backButton.widthAnchor.constraint(equalToConstant: 55).isActive = true
    }
    
    //MARK: - Configure UI
    
    private func configureUI() {
        imageView.backgroundColor = .black
        imageView.contentMode = .scaleAspectFill
        imageView.image = UIImage(named: "backgroundImage")
        
        piggyImageView.image = UIImage(named: "PiggyImage")
        piggyImageView.contentMode = .scaleAspectFill
        
        infoLabel.text = NSLocalizedString("App.AboutView.InfoLabel", comment: "")
        infoLabel.textColor = .white
        infoLabel.numberOfLines = 0
        infoLabel.textAlignment = .center
        infoLabel.font = UIFont.rubik(ofSize: 20, style: .light)
        
        let symbolConfiguration = UIImage.SymbolConfiguration(pointSize: 25)
        backButton.tintColor = .white
        backButton.setImage(UIImage(systemName: "chevron.backward"), for: .normal)
        backButton.setPreferredSymbolConfiguration(symbolConfiguration, forImageIn: .normal)
        backButton.addTarget(self, action: #selector(self.goBack), for: .touchUpInside)
        backButton.backgroundColor = .clear
        backButton.layer.cornerRadius = 27.5
    }
    
    //MARK: - Actions
    
    @objc private func goBack() {
        navigationController?.popViewController(animated: true)
    }
}
