import UIKit

final class DefaultModifyBanksView: UIViewController {

    var viewModel: DefaultModifyBanksViewModel!
    var onSave: (() -> Void)?
    
    private let titleLabel = UILabel()
    private let nameLabel = UILabel()
    private let savedLabel = UILabel()
    private let savedTextLabel = UILabel()
    private let leftLabel = UILabel()
    private let leftTextLabel = UILabel()
    private let replenishLabel = UILabel()
    private let replenishTextLabel = UITextField()
    private let createButton = UIButton()
    private let lineReplenishTextFieldLabel = UILabel()
    private let imageView = UIImageView()
    
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
        view.addSubview(nameLabel)
        view.addSubview(createButton)
        view.addSubview(lineReplenishTextFieldLabel)
        view.addSubview(leftTextLabel)
        view.addSubview(leftLabel)
        view.addSubview(savedTextLabel)
        view.addSubview(savedLabel)
        view.addSubview(imageView)
        view.addSubview(replenishLabel)
        view.addSubview(replenishTextLabel)
    }
    
    private func setupConstraints() {
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 80).isActive = true
        titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.bottomAnchor.constraint(equalTo: savedLabel.bottomAnchor, constant: -100).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 106).isActive = true
        imageView.widthAnchor.constraint(equalToConstant: 106).isActive = true
        imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
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
    }
    
    private func setupUI() {
        imageView.contentMode = .scaleAspectFit
        imageView.layer.cornerRadius = 53
        imageView.layer.masksToBounds = true

        titleLabel.textColor = .black
        titleLabel.font = UIFont(name: "Rubik-Medium", size: 24)
        
        savedLabel.text = "Saved"
        savedLabel.textColor = .black
        savedLabel.font = UIFont(name: "Rubik-Medium", size: 24)
        
        savedTextLabel.font = UIFont(name: "Rubik-Light", size: 18)
        savedTextLabel.textColor = .black

        leftLabel.text = "Left"
        leftLabel.textColor = .black
        leftLabel.font = UIFont(name: "Rubik-Medium", size: 24)
        
        leftTextLabel.font = UIFont(name: "Rubik-Light", size: 18)
        leftTextLabel.textColor = .black
 
        replenishLabel.text = "Replenish"
        replenishLabel.textColor = .black
        replenishLabel.font = UIFont(name: "Rubik-Medium", size: 24)
        
        replenishTextLabel.attributedPlaceholder = NSAttributedString(string: "Replenish", attributes: [NSAttributedString.Key.foregroundColor: UIColor.black])
        replenishTextLabel.font = UIFont(name: "Rubik-Light", size: 18)
        replenishTextLabel.textColor = .black
        replenishTextLabel.delegate = self
        replenishTextLabel.keyboardType = .numberPad
        replenishTextLabel.textAlignment = .center
        
        lineReplenishTextFieldLabel.backgroundColor = .black
        
        createButton.setTitle("Ok", for: .normal)
        createButton.titleLabel?.font = UIFont(name: "Rubik-Regular", size: 18)
        createButton.tintColor = .white
        createButton.backgroundColor = UIColor(red: 197/255, green: 119/255, blue: 209/255, alpha: 1.0)
        createButton.layer.cornerRadius = 35
        createButton.addTarget(self, action: #selector(saveButtonTapped), for: .touchUpInside)
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
        titleLabel.text = "Yuor \(banks.nameBank ?? "")"
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
    
    @objc func saveButtonTapped() {
        print("save")
        saveBanks()
    }
    
    @objc func goBack() {
        navigationController?.popViewController(animated: true)
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

extension DefaultModifyBanksView: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let allowedCharacters = CharacterSet.decimalDigits
        let characterSet = CharacterSet(charactersIn: string)
        return allowedCharacters.isSuperset(of: characterSet)
    }
}
