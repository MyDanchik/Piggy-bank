import UIKit

final class DefaultAddBanksView: UIViewController {
    
    
    var viewModel: DefaultAddBanksViewModel!
    var onSave: (() -> Void)?
    
    private let titleLabel = UILabel()
    private let nameLabel = UILabel()
    private let nameTextField = UITextField()
    private let sumLabel = UILabel()
    private let sumTextField = UITextField()
    private let createButton = UIButton()
    private let lineSumTextFieldLabel = UILabel()
    private let lineNameTextFieldLabel = UILabel()
    private let iconLabel = UILabel()
    private let imageView = UIImageView()
    private let previousButton = UIButton()
    private let nextButton = UIButton()
    

    private var currentImageIndex = 0
    
    private let images: [UIImage] = [UIImage(named: "icon1")!,
                                     UIImage(named: "icon2")!,
                                     UIImage(named: "icon3")!,
                                     UIImage(named: "icon4")!,
                                     UIImage(named: "icon5")!,
                                     UIImage(named: "icon6")!]
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .backgroundColorMain
        setupSubviews()
        setupConstraints()
        setupUI()
        setupKeyboard()
        setupTap()
        
        if !images.isEmpty {
            updateImageView()
        }
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
        view.addSubview(iconLabel)
        view.addSubview(imageView)
        view.addSubview(previousButton)
        view.addSubview(nextButton)
    }
    private func setupConstraints() {
        
        iconLabel.translatesAutoresizingMaskIntoConstraints = false
        iconLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        iconLabel.bottomAnchor.constraint(equalTo: imageView.topAnchor, constant: -20).isActive = true
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.bottomAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: -100).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 106).isActive = true
        imageView.widthAnchor.constraint(equalToConstant: 106).isActive = true
        imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        previousButton.translatesAutoresizingMaskIntoConstraints = false
        previousButton.centerYAnchor.constraint(equalTo: imageView.centerYAnchor).isActive = true
        previousButton.trailingAnchor.constraint(equalTo: imageView.leadingAnchor, constant: -40).isActive = true
        
        nextButton.translatesAutoresizingMaskIntoConstraints = false
        nextButton.centerYAnchor.constraint(equalTo: imageView.centerYAnchor).isActive = true
        nextButton.leadingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: 40).isActive = true

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
    
    
    
    private func updateImageView() {
        imageView.image = images[currentImageIndex]
    }
    
    @objc private func previousButtonTapped() {
        if currentImageIndex > 0 {
            currentImageIndex -= 1
            updateImageView()
        }
    }
    
    @objc private func nextButtonTapped() {
        if currentImageIndex < images.count - 1 {
            currentImageIndex += 1
            updateImageView()
        }
    }
    
    private func setupUI() {
        
        
        iconLabel.text = "Icon"
        iconLabel.textColor = .black
        iconLabel.font = UIFont(name: "Rubik-Medium", size: 24)
        
        
        imageView.contentMode = .scaleAspectFit
        
        
        let symbolConfiguration = UIImage.SymbolConfiguration(pointSize: 25)
        
        previousButton.tintColor = .black
        previousButton.setImage(UIImage(systemName: "arrow.backward"), for: .normal)
        previousButton.setPreferredSymbolConfiguration(symbolConfiguration, forImageIn: .normal)
        previousButton.setTitleColor(.black, for: .normal)
        previousButton.addTarget(self, action: #selector(previousButtonTapped), for: .touchUpInside)

        
        nextButton.tintColor = .black
        nextButton.setImage(UIImage(systemName: "arrow.right"), for: .normal)
        nextButton.setPreferredSymbolConfiguration(symbolConfiguration, forImageIn: .normal)
        nextButton.setTitleColor(.black, for: .normal)
        nextButton.addTarget(self, action: #selector(nextButtonTapped), for: .touchUpInside)
        
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
        sumTextField.delegate = self // Установка делегата для sumTextField
        sumTextField.keyboardType = .numberPad // Установка типа клавиатуры
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
        saveBanks()
        goBack()
        
    }
    @objc func goBack() {
        navigationController?.popViewController(animated: true)
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
    
    
    
    private func saveBanks() {
        // Get necessary data from UI elements
        guard let imageBanks = imageView.image?.jpegData(compressionQuality: 1.0),
              let nameBanks = nameTextField.text, !nameBanks.isEmpty,
              let priceBanks = sumTextField.text, !priceBanks.isEmpty
        else {
            // Handle invalid input
            return
        }

        // Call method in view model to save data
        viewModel.saveNewBanks(imageBanks: imageBanks,
                                    nameBanks: nameBanks,
                                    priceBanks: priceBanks)

        // After saving, notify the parent view controller
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) { [weak self] in
            self?.onSave?()
        }
    }


    
    
}

extension DefaultAddBanksView: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        // Проверяем, является ли вводимый символ числом
        let allowedCharacters = CharacterSet.decimalDigits
        let characterSet = CharacterSet(charactersIn: string)
        return allowedCharacters.isSuperset(of: characterSet)
    }
}
