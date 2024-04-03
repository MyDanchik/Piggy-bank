import UIKit

final class ModifyBanksView: UIViewController {
    
    // MARK: - Properties
    
    var viewModel: ModifyBanksViewModel!
    var onSave: (() -> Void)?
    
    // MARK: - UI Elements
    
    private let titleLabel = UILabel()
    private let nameLabel = UILabel()
    private let savedLabel = UILabel()
    private let savedTextLabel = UILabel()
    private let leftLabel = UILabel()
    private let leftTextLabel = UILabel()
    private let replenishLabel = UILabel()
    private let replenishTextLabel = UITextField()
    private let createButton = UIButton(type: .system)
    private let lineReplenishTextFieldLabel = UILabel()
    private let imageView = UIImageView()
    private let backView = UIView()
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
        view.addSubview(nameLabel)
        view.addSubview(createButton)
        view.addSubview(lineReplenishTextFieldLabel)
        view.addSubview(leftTextLabel)
        view.addSubview(leftLabel)
        view.addSubview(savedTextLabel)
        view.addSubview(savedLabel)
        backView.addSubview(imageView)
        view.addSubview(backView)
        view.addSubview(replenishLabel)
        view.addSubview(replenishTextLabel)
        view.addSubview(backButton)
    }
    
    private func configureConstraints() {
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 80).isActive = true
        titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.bottomAnchor.constraint(equalTo: savedLabel.bottomAnchor, constant: -100).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 106).isActive = true
        imageView.widthAnchor.constraint(equalToConstant: 106).isActive = true
        imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        backView.translatesAutoresizingMaskIntoConstraints = false
        backView.bottomAnchor.constraint(equalTo: savedLabel.bottomAnchor, constant: -100).isActive = true
        backView.heightAnchor.constraint(equalToConstant: 106).isActive = true
        backView.widthAnchor.constraint(equalToConstant: 106).isActive = true
        backView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        savedLabel.translatesAutoresizingMaskIntoConstraints = false
        savedLabel.bottomAnchor.constraint(equalTo: savedTextLabel.topAnchor, constant: -10).isActive = true
        savedLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        savedTextLabel.translatesAutoresizingMaskIntoConstraints = false
        savedTextLabel.bottomAnchor.constraint(equalTo: leftLabel.topAnchor, constant: -45).isActive = true
        savedTextLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        leftLabel.translatesAutoresizingMaskIntoConstraints = false
        leftLabel.bottomAnchor.constraint(equalTo: leftTextLabel.topAnchor, constant: -10).isActive = true
        leftLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        leftTextLabel.translatesAutoresizingMaskIntoConstraints = false
        leftTextLabel.bottomAnchor.constraint(equalTo: replenishLabel.topAnchor, constant: -50).isActive = true
        leftTextLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        replenishLabel.translatesAutoresizingMaskIntoConstraints = false
        replenishLabel.bottomAnchor.constraint(equalTo: replenishTextLabel.topAnchor, constant: -10).isActive = true
        replenishLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        replenishTextLabel.translatesAutoresizingMaskIntoConstraints = false
        replenishTextLabel.bottomAnchor.constraint(equalTo: lineReplenishTextFieldLabel.topAnchor, constant: -10).isActive = true
        replenishTextLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        replenishTextLabel.widthAnchor.constraint(equalTo: createButton.widthAnchor, multiplier: 0.7).isActive = true
        
        lineReplenishTextFieldLabel.translatesAutoresizingMaskIntoConstraints = false
        lineReplenishTextFieldLabel.bottomAnchor.constraint(equalTo: createButton.topAnchor, constant: -70).isActive = true
        lineReplenishTextFieldLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        lineReplenishTextFieldLabel.heightAnchor.constraint(equalToConstant: 1).isActive = true
        lineReplenishTextFieldLabel.widthAnchor.constraint(equalTo: createButton.widthAnchor, multiplier: 0.7).isActive = true
        
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
        imageView.contentMode = .scaleAspectFit
        imageView.layer.cornerRadius = 53
        imageView.layer.masksToBounds = true
        
        backView.layer.cornerRadius = 53
        backView.layer.shadowColor = UIColor.black.cgColor
        backView.layer.shadowOffset = CGSize(width: 0, height: 2)
        backView.layer.shadowRadius = 5
        backView.layer.shadowOpacity = 0.20
        
        titleLabel.textColor = UIColor(resource: .Colors.colorText)
        titleLabel.font = UIFont.rubik(ofSize: 24, style: .semiBold)
        
        savedLabel.text = NSLocalizedString("App.ModifyBanksView.SavedLabel", comment: "")
        savedLabel.textColor = UIColor(resource: .Colors.colorText)
        savedLabel.font = UIFont.rubik(ofSize: 24, style: .semiBold)
        
        savedTextLabel.font = UIFont.rubik(ofSize: 20, style: .light)
        savedTextLabel.textColor = UIColor(resource: .Colors.colorText)
        
        leftLabel.text = NSLocalizedString("App.ModifyBanksView.LeftLabel", comment: "")
        leftLabel.textColor = UIColor(resource: .Colors.colorText)
        leftLabel.font = UIFont.rubik(ofSize: 24, style: .semiBold)
        
        leftTextLabel.font = UIFont.rubik(ofSize: 20, style: .light)
        leftTextLabel.textColor = UIColor(resource: .Colors.colorText)
        
        replenishLabel.text = NSLocalizedString("App.ModifyBanksView.ReplenishLabel", comment: "")
        replenishLabel.textColor = UIColor(resource: .Colors.colorText)
        replenishLabel.font = UIFont.rubik(ofSize: 24, style: .semiBold)
        
        replenishTextLabel.attributedPlaceholder = NSAttributedString(string: NSLocalizedString("App.ModifyBanksView.ReplenishTextLabel", comment: ""),
                                                                      attributes: [NSAttributedString.Key.foregroundColor: UIColor(resource: .Colors.colorText)])
        replenishTextLabel.font = UIFont.rubik(ofSize: 20, style: .light)
        replenishTextLabel.textColor = UIColor(resource: .Colors.colorText)
        replenishTextLabel.delegate = self
        replenishTextLabel.keyboardType = .numberPad
        replenishTextLabel.textAlignment = .center
        
        lineReplenishTextFieldLabel.backgroundColor = UIColor(resource: .Colors.colorText)
        
        createButton.setTitle(NSLocalizedString("App.ModifyBanksView.CreateButton", comment: ""), for: .normal)
        createButton.titleLabel?.font = UIFont.rubik(ofSize: 18, style: .regular)
        createButton.tintColor = .white
        createButton.backgroundColor = UIColor(resource: .Colors.colorButton)
        createButton.layer.cornerRadius = 35
        createButton.addTarget(self, action: #selector(saveButtonTapped), for: .touchUpInside)
        createButton.layer.shadowColor = UIColor.black.cgColor
        createButton.layer.shadowOffset = CGSize(width: 0, height: 2)
        createButton.layer.shadowRadius = 5
        createButton.layer.shadowOpacity = 0.20
        
        backButton.tintColor = UIColor(resource: .Colors.colorText)
        backButton.setImage(UIImage(systemName: "chevron.backward"), for: .normal)
        let symbolConfiguration = UIImage.SymbolConfiguration(pointSize: 25)
        backButton.setPreferredSymbolConfiguration(symbolConfiguration, forImageIn: .normal)
        backButton.addTarget(self, action: #selector(self.goBack), for: .touchUpInside)
        backButton.backgroundColor = UIColor(resource: .Colors.backgroundColorItem)
        backButton.layer.cornerRadius = 27.5
        backButton.layer.shadowColor = UIColor.black.cgColor
        backButton.layer.shadowOffset = CGSize(width: 0, height: 2)
        backButton.layer.shadowRadius = 5
        backButton.layer.shadowOpacity = 0.20
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
        guard let replenishText = replenishTextLabel.text, !replenishText.isEmpty else {
            return
        }
        
        guard let currentBankName = nameLabel.text else {
            return
        }
        
        guard let currentBank = CoreDataManager.instance.getCurrentBank(withName: currentBankName) else {
            return
        }
        
        guard var currentSavedPriceBank = Double(currentBank.savedPriceBank ?? "") else {
            return
        }
        
        if let replenishValue = Double(replenishText) {
            currentSavedPriceBank += replenishValue
        } else {
            return
        }
        
        let updatedSavedPriceBank = String(currentSavedPriceBank)
        
        let result = CoreDataManager.instance.modifyBanks(savedPriceBank: updatedSavedPriceBank, forBankWithName: currentBankName)
        
        switch result {
        case .success:
            print("Data saved successfully")
            onSave?()
            configureFullBanks(banks: currentBank)
        case .failure(let error):
            print("Error saving data: \(error)")
        }
    }
    
    func configureFullBanks(banks: Bank) {
        if let imageData = banks.imageBank, let bankImage = UIImage(data: imageData) {
            self.imageView.image = bankImage
        } else {
            self.imageView.image = UIImage(named: "default_image")
        }
        titleLabel.text = "\(banks.nameBank ?? "")"
        nameLabel.text = banks.nameBank
        savedTextLabel.text = "\(String(format: "%g", Double(banks.savedPriceBank ?? "0") ?? 0)) $"
        if let priceBankString = banks.priceBank, let savedPriceBankString = banks.savedPriceBank,
           let priceBank = Double(priceBankString), let savedPriceBank = Double(savedPriceBankString) {
            let leftAmount = priceBank - savedPriceBank
            leftTextLabel.text = "\(String(format: "%.f", leftAmount)) $"
        } else {
            leftTextLabel.text = "N/A"
        }
    }
    
    // MARK: - Actions
    
    @objc private func saveButtonTapped() {
        saveBanks()
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

extension ModifyBanksView: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let allowedCharacters = CharacterSet.decimalDigits
        let characterSet = CharacterSet(charactersIn: string)
        return allowedCharacters.isSuperset(of: characterSet)
    }
}
