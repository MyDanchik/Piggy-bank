import UIKit

final class DefaultAddBanksView: UIViewController {
    
    var viewModel: DefaultAddBanksViewModel!
    
    private let titleLabel = UILabel()
    private let nameLabel = UILabel()
    private let nameTextField = UITextField()
    private let sumLabel = UILabel()
    private let sumTextField = UITextField()
    private let createButton = UIButton()
    private let lineSumTextFieldLabel = UILabel()
    private let lineNameTextFieldLabel = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .backgroundColorMain
        setupSubviews()
        setupConstraints()
        setupUI()
        setupKeyboard()
        setupTap()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tabBarController?.tabBar.isHidden = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        tabBarController?.tabBar.isHidden = false
    }
    
    private func setupSubviews() {
        view.addSubview(titleLabel)
        view.addSubview(createButton)
        view.addSubview(lineSumTextFieldLabel)
        view.addSubview(sumTextField)
        view.addSubview(sumLabel)
        view.addSubview(lineNameTextFieldLabel)
        view.addSubview(nameTextField)
        view.addSubview(nameLabel)
        
    }
    private func setupConstraints() {
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 80).isActive = true
        titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.bottomAnchor.constraint(equalTo: lineNameTextFieldLabel.topAnchor, constant: -62).isActive = true
        nameLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        nameTextField.translatesAutoresizingMaskIntoConstraints = false
        nameTextField.bottomAnchor.constraint(equalTo: lineNameTextFieldLabel.topAnchor, constant: -10).isActive = true
        nameTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        nameTextField.widthAnchor.constraint(equalTo: createButton.widthAnchor, multiplier: 0.7).isActive = true
        
        lineNameTextFieldLabel.translatesAutoresizingMaskIntoConstraints = false
        lineNameTextFieldLabel.bottomAnchor.constraint(equalTo: sumLabel.topAnchor, constant: -60).isActive = true
        lineNameTextFieldLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        lineNameTextFieldLabel.heightAnchor.constraint(equalToConstant: 1).isActive = true
        lineNameTextFieldLabel.widthAnchor.constraint(equalTo: createButton.widthAnchor, multiplier: 0.7).isActive = true
        
        sumLabel.translatesAutoresizingMaskIntoConstraints = false
        sumLabel.bottomAnchor.constraint(equalTo: lineSumTextFieldLabel.topAnchor, constant: -62).isActive = true
        sumLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        sumTextField.translatesAutoresizingMaskIntoConstraints = false
        sumTextField.bottomAnchor.constraint(equalTo: lineSumTextFieldLabel.topAnchor, constant: -10).isActive = true
        sumTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        sumTextField.widthAnchor.constraint(equalTo: createButton.widthAnchor, multiplier: 0.7).isActive = true
        
        lineSumTextFieldLabel.translatesAutoresizingMaskIntoConstraints = false
        lineSumTextFieldLabel.bottomAnchor.constraint(equalTo: createButton.topAnchor, constant: -70).isActive = true
        lineSumTextFieldLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        lineSumTextFieldLabel.heightAnchor.constraint(equalToConstant: 1).isActive = true
        lineSumTextFieldLabel.widthAnchor.constraint(equalTo: createButton.widthAnchor, multiplier: 0.7).isActive = true
        
        createButton.translatesAutoresizingMaskIntoConstraints = false
        createButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -50).isActive = true
        createButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        createButton.heightAnchor.constraint(equalToConstant: 70).isActive = true
        createButton.widthAnchor.constraint(equalToConstant: 290).isActive = true
        
    }
    
    private func setupUI() {
        titleLabel.text = "Creat piggy bank"
        titleLabel.textColor = .black
        titleLabel.font = UIFont(name: "Rubik-Medium", size: 24)
        
        nameLabel.text = "Name"
        nameLabel.textColor = .black
        nameLabel.font = UIFont(name: "Rubik-Medium", size: 24)
        
        nameTextField.attributedPlaceholder = NSAttributedString(string: "Name", attributes: [NSAttributedString.Key.foregroundColor: UIColor.black])
        nameTextField.font = UIFont(name: "Rubik-Light", size: 18)
        nameTextField.textColor = .black
        nameTextField.textAlignment = .center
        
        lineNameTextFieldLabel.backgroundColor = .black
        
        sumLabel.text = "Sum"
        sumLabel.textColor = .black
        sumLabel.font = UIFont(name: "Rubik-Medium", size: 24)
        
        sumTextField.attributedPlaceholder = NSAttributedString(string: "Sum", attributes: [NSAttributedString.Key.foregroundColor: UIColor.black])
        sumTextField.font = UIFont(name: "Rubik-Light", size: 18)
        sumTextField.textColor = .black
        sumTextField.textAlignment = .center
        
        lineSumTextFieldLabel.backgroundColor = .black
        
        createButton.setTitle("Creat", for: .normal)
        createButton.titleLabel?.font = UIFont(name: "Rubik-Regular", size: 18)
        createButton.tintColor = .white
        createButton.backgroundColor = UIColor(red: 197/255, green: 119/255, blue: 209/255, alpha: 1.0)
        createButton.layer.cornerRadius = 35
        createButton.addTarget(self, action: #selector(saveButtonTapped), for: .touchUpInside)
    }
    
    @objc func saveButtonTapped() {
        print("save")
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
    
    
}
