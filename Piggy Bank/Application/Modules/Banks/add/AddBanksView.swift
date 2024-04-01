import UIKit

final class AddBanksView: UIViewController {
    
    // MARK: - Properties
    
    var viewModel: AddBanksViewModel!
    var onSave: (() -> Void)?
    
    // MARK: - UI Elements
    
    private let titleLabel = UILabel()
    private let nameLabel = UILabel()
    private let nameTextField = UITextField()
    private let sumLabel = UILabel()
    private let sumTextField = UITextField()
    private let createButton = UIButton(type: .system)
    private let lineSumTextFieldLabel = UILabel()
    private let lineNameTextFieldLabel = UILabel()
    private let iconLabel = UILabel()
    private let imageView = UIImageView()
    private let previousButton = UIButton(type: .system)
    private let nextButton = UIButton(type: .system)
    private var currentImageIndex = 0
    private let backButton = UIButton(type: .system)
    
    // MARK: - Lifecycle Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(resource: .Colors.backgroundColorMain)
        addSubviews()
        configureConstraints()
        configureUI()
        setupKeyboard()
        setupTap()
        
        if !viewModel.images.isEmpty {
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
    
    // MARK: - Private Methods
    
    private func addSubviews() {
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
        view.addSubview(backButton)
    }
    
    private func configureConstraints() {
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
        
        backButton.translatesAutoresizingMaskIntoConstraints = false
        backButton.centerYAnchor.constraint(equalTo: titleLabel.centerYAnchor).isActive = true
        backButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24).isActive = true
        backButton.heightAnchor.constraint(equalToConstant: 55).isActive = true
        backButton.widthAnchor.constraint(equalToConstant: 55).isActive = true
    }
    
    private func configureUI() {
        iconLabel.text = NSLocalizedString("App.AddBanksView.IconLabel", comment: "")
        iconLabel.textColor = UIColor(resource: .Colors.colorText)
        iconLabel.font = UIFont.rubik(ofSize: 24, style: .semiBold)
        
        imageView.contentMode = .scaleAspectFit
        
        let symbolConfiguration = UIImage.SymbolConfiguration(pointSize: 25)
        
        previousButton.tintColor = UIColor(resource: .Colors.colorText)
        previousButton.setImage(UIImage(systemName: "arrow.backward"), for: .normal)
        previousButton.setPreferredSymbolConfiguration(symbolConfiguration, forImageIn: .normal)
        previousButton.addTarget(self, action: #selector(previousButtonTapped), for: .touchUpInside)
        
        nextButton.tintColor = UIColor(resource: .Colors.colorText)
        nextButton.setImage(UIImage(systemName: "arrow.right"), for: .normal)
        nextButton.setPreferredSymbolConfiguration(symbolConfiguration, forImageIn: .normal)
        nextButton.addTarget(self, action: #selector(nextButtonTapped), for: .touchUpInside)
        
        titleLabel.text = NSLocalizedString("App.AddBanksView.NavigationItemTitle", comment: "")
        titleLabel.textColor = UIColor(resource: .Colors.colorText)
        titleLabel.font = UIFont.rubik(ofSize: 24, style: .semiBold)
        
        nameLabel.text = NSLocalizedString("App.AddBanksView.NameLabel" , comment: "")
        nameLabel.textColor = UIColor(resource: .Colors.colorText)
        nameLabel.font = UIFont.rubik(ofSize: 24, style: .semiBold)
        
        nameTextField.attributedPlaceholder = NSAttributedString(string: NSLocalizedString("App.AddBanksView.NameTextField", comment: ""),
                                                                 attributes: [NSAttributedString.Key.foregroundColor: UIColor(resource: .Colors.colorText)])
        nameTextField.font = UIFont.rubik(ofSize: 20, style: .light)
        nameTextField.textColor = UIColor(resource: .Colors.colorText)
        nameTextField.textAlignment = .center
        
        lineNameTextFieldLabel.backgroundColor = UIColor(resource: .Colors.colorText)
        
        sumLabel.text = NSLocalizedString("App.AddBanksView.SumLabel", comment: "")
        sumLabel.textColor = UIColor(resource: .Colors.colorText)
        sumLabel.font = UIFont.rubik(ofSize: 24, style: .semiBold)
        
        sumTextField.attributedPlaceholder = NSAttributedString(string: NSLocalizedString("App.AddBanksView.SumTextField", comment: ""),
                                                                attributes: [NSAttributedString.Key.foregroundColor: UIColor(resource: .Colors.colorText)])
        sumTextField.font = UIFont.rubik(ofSize: 20, style: .light)
        sumTextField.textColor = UIColor(resource: .Colors.colorText)
        sumTextField.delegate = self
        sumTextField.keyboardType = .numberPad
        sumTextField.textAlignment = .center
        
        lineSumTextFieldLabel.backgroundColor = UIColor(resource: .Colors.colorText)
        
        createButton.setTitle(NSLocalizedString("App.AddBanksView.CreateButton", comment: ""), for: .normal)
        createButton.titleLabel?.font = UIFont.rubik(ofSize: 18, style: .regular)
        createButton.tintColor = .white
        createButton.backgroundColor = UIColor(resource: .Colors.colorButton)
        createButton.layer.cornerRadius = 35
        createButton.addTarget(self, action: #selector(saveButtonTapped), for: .touchUpInside)
        
        backButton.tintColor = UIColor(resource: .Colors.colorText)
        backButton.setImage(UIImage(systemName: "chevron.backward"), for: .normal)
        backButton.setPreferredSymbolConfiguration(symbolConfiguration, forImageIn: .normal)
        backButton.addTarget(self, action: #selector(self.goBack), for: .touchUpInside)
        backButton.backgroundColor = UIColor(resource: .Colors.backgroundColorItem)
        backButton.layer.cornerRadius = 27.5
    }
    
    private func setupTap() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(tapDone))
        view.addGestureRecognizer(tap)
    }
    
    private func setupKeyboard() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    private func saveBanks() {
        guard let imageBanks = imageView.image?.jpegData(compressionQuality: 1.0),
              let nameBanks = nameTextField.text, !nameBanks.isEmpty,
              let priceBanks = sumTextField.text, !priceBanks.isEmpty
        else {
            let alert = UIAlertController(title: NSLocalizedString("App.AddBanksView.TapOnALertButton.Eror", comment: ""), message: NSLocalizedString("App.AddBanksView.TapOnALertButton.Message", comment: ""), preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            present(alert, animated: true, completion: nil)
            return
        }
        viewModel.saveNewBanks(imageBanks: imageBanks,
                               nameBanks: nameBanks,
                               priceBanks: priceBanks)
        
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) { [weak self] in
            self?.onSave?()
        }
    }
    
    private func updateImageView() {
        imageView.image = viewModel.images[currentImageIndex]
    }
    
    // MARK: - Actions
    
    @objc private func previousButtonTapped() {
        if currentImageIndex > 0 {
            currentImageIndex -= 1
            updateImageView()
        }
    }
    
    @objc private func nextButtonTapped() {
        if currentImageIndex < viewModel.images.count - 1 {
            currentImageIndex += 1
            updateImageView()
        }
    }

    
    @objc private func saveButtonTapped() {
        saveBanks()
        goBack()
        
    }
    @objc private func goBack() {
        navigationController?.popViewController(animated: true)
    }
    
    @objc private func keyboardShow(notification: Notification) {
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            view.frame.origin.y = -keyboardSize.height
            UIView.animate(withDuration: 0.5) {
                self.view.layoutIfNeeded()
            }
        }
    }
    
    @objc private func keyboardHide() {
        view.frame.origin.y = 0
        UIView.animate(withDuration: 0.5) {
            self.view.layoutIfNeeded()
        }
    }
    @objc private func tapDone() {
        view.endEditing(true)
    }
}

    // MARK: - UITextFieldDelegate

extension AddBanksView: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let allowedCharacters = CharacterSet.decimalDigits
        let characterSet = CharacterSet(charactersIn: string)
        return allowedCharacters.isSuperset(of: characterSet)
    }
}
