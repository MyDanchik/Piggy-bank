import UIKit

final class DefaultLogInView: UIViewController {
    
    var viewModel: LogInViewModel!
    // MARK: - UI Elements
    private let imageView = UIImageView()
    private let infoLabel = UILabel()
    private let infoBoldLabel = UILabel()
    private let greetingsLabel = UILabel()
    private let userNameTextField = UITextField()
    private let lineTextFieldLabel = UILabel()
    private let saveNameButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupSubviews()
        setupConstraints()
        setupUI()
        setupKeyboard()
        setupTap()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    private func setupSubviews() {
        view.addSubview(imageView)
        view.addSubview(infoLabel)
        view.addSubview(infoBoldLabel)
        view.addSubview(greetingsLabel)
        view.addSubview(userNameTextField)
        view.addSubview(lineTextFieldLabel)
        view.addSubview(saveNameButton)
    }
    
    private func setupConstraints() {
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        imageView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        imageView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        imageView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        
        infoLabel.translatesAutoresizingMaskIntoConstraints = false
        infoLabel.bottomAnchor.constraint(equalTo: infoBoldLabel.topAnchor, constant: -8).isActive = true
        infoLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
                
        infoBoldLabel.translatesAutoresizingMaskIntoConstraints = false
        infoBoldLabel.bottomAnchor.constraint(equalTo: greetingsLabel.topAnchor, constant: -71).isActive = true
        infoBoldLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        greetingsLabel.translatesAutoresizingMaskIntoConstraints = false
        greetingsLabel.bottomAnchor.constraint(equalTo: userNameTextField.topAnchor, constant: -20).isActive = true
        greetingsLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        userNameTextField.translatesAutoresizingMaskIntoConstraints = false
        userNameTextField.bottomAnchor.constraint(equalTo: lineTextFieldLabel.topAnchor, constant: -5).isActive = true
        userNameTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        userNameTextField.widthAnchor.constraint(equalTo: saveNameButton.widthAnchor, multiplier: 1).isActive = true
        
        lineTextFieldLabel.translatesAutoresizingMaskIntoConstraints = false
        lineTextFieldLabel.bottomAnchor.constraint(equalTo: saveNameButton.topAnchor, constant: -70).isActive = true
        lineTextFieldLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        lineTextFieldLabel.heightAnchor.constraint(equalToConstant: 1).isActive = true
        lineTextFieldLabel.widthAnchor.constraint(equalTo: saveNameButton.widthAnchor, multiplier: 1).isActive = true
        
        saveNameButton.translatesAutoresizingMaskIntoConstraints = false
        saveNameButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -50).isActive = true
        saveNameButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        saveNameButton.heightAnchor.constraint(equalToConstant: 70).isActive = true
        saveNameButton.widthAnchor.constraint(equalToConstant: 290).isActive = true
    }
    
    private func setupUI() {
        imageView.backgroundColor = .black
        imageView.contentMode = .scaleAspectFill
        imageView.image = UIImage(named: "backgroundImage")
        
        infoLabel.text = "The simplest way"
        infoLabel.textColor = .white
        infoLabel.font = UIFont(name: "Rubik-Light", size: 20)
        
        infoBoldLabel.text = "to manage your money"
        infoBoldLabel.textColor = .white
        infoBoldLabel.font = UIFont(name: "Rubik-Medium", size: 20)
        
        greetingsLabel.text = "Hi! What is your name?"
        greetingsLabel.textColor = .white
        greetingsLabel.font = UIFont(name: "Rubik-Regular", size: 18)
        
        userNameTextField.attributedPlaceholder = NSAttributedString(string: "Name", attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
        userNameTextField.font = UIFont(name: "Rubik-Light", size: 18)
        userNameTextField.textColor = .white
        userNameTextField.textAlignment = .center
        
        lineTextFieldLabel.backgroundColor = .white
        
        saveNameButton.setTitle("Start now", for: .normal)
        saveNameButton.titleLabel?.font = UIFont(name: "Rubik-Regular", size: 18)
        saveNameButton.tintColor = .white
        saveNameButton.backgroundColor = UIColor(red: 197/255, green: 119/255, blue: 209/255, alpha: 1.0)
        saveNameButton.layer.cornerRadius = 35
        saveNameButton.addTarget(self, action: #selector(saveNameButtonTapped), for: .touchUpInside)
    }
    
    private func setupTap() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(tapDone))
        view.addGestureRecognizer(tap)
    }
    
    private func setupKeyboard() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    @objc func keyboardShow(notification: Notification) {
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            view.frame.origin.y = -keyboardSize.height
            UIView.animate(withDuration: 0.5) {
                self.view.layoutIfNeeded()
            }
        }
    }
    
    @objc func keyboardHide() {
        view.frame.origin.y = 0
        UIView.animate(withDuration: 0.5) {
            self.view.layoutIfNeeded()
        }
    }
    @objc func tapDone() {
        view.endEditing(true)
    }

    @objc private func saveNameButtonTapped() {
        let nextViewController = CustomTabBarController()
        nextViewController.modalPresentationStyle = .fullScreen
        nextViewController.modalTransitionStyle = .crossDissolve
        present(nextViewController, animated: true, completion: nil)
    }
}
