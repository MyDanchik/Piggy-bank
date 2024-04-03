import UIKit
import PhotosUI

final class AddDiscountView: UIViewController, UINavigationControllerDelegate {
    
    // MARK: - Properties
    
    var viewModel: AddDiscountViewModel!
    var onSave: (() -> Void)?
    
    // MARK: - UI Elements
    
    private var isImageSelected = true
    private let titleLabel = UILabel()
    private let nameLabel = UILabel()
    private let nameTextField = UITextField()
    private let createButton = UIButton(type: .system)
    private let lineNameTextFieldLabel = UILabel()
    private let iconLabel = UILabel()
    private let imageView = UIImageView()
    private let customFrontView = UIImageView()
    private let addFrontImageButton = UIButton(type: .system)
    private let customBackView = UIImageView()
    private let addBackImageButton = UIButton(type: .system)
    private let backButton = UIButton(type: .system)
    
    // MARK: - Lifecycle Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(resource: .Colors.backgroundColorMain)
        addSubviews()
        configureConstraints()
        configureUI()
        setupTap()
        setupBindings()
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
        view.addSubview(lineNameTextFieldLabel)
        view.addSubview(nameTextField)
        view.addSubview(nameLabel)
        view.addSubview(iconLabel)
        view.addSubview(imageView)
        addFrontImageButton.addSubview(customFrontView)
        view.addSubview(addFrontImageButton)
        addBackImageButton.addSubview(customBackView)
        view.addSubview(addBackImageButton)
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
        lineNameTextFieldLabel.bottomAnchor.constraint(equalTo: customFrontView.topAnchor, constant: -60).isActive = true
        lineNameTextFieldLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        lineNameTextFieldLabel.heightAnchor.constraint(equalToConstant: 1).isActive = true
        lineNameTextFieldLabel.widthAnchor.constraint(equalTo: createButton.widthAnchor, multiplier: 0.7).isActive = true
        
        customFrontView.translatesAutoresizingMaskIntoConstraints = false
        customFrontView.bottomAnchor.constraint(equalTo: customBackView.topAnchor, constant: -30).isActive = true
        customFrontView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 27).isActive = true
        customFrontView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -27).isActive = true
        customFrontView.heightAnchor.constraint(equalToConstant: 190).isActive = true
        
        addFrontImageButton.translatesAutoresizingMaskIntoConstraints = false
        addFrontImageButton.bottomAnchor.constraint(equalTo: customBackView.topAnchor, constant: -30).isActive = true
        addFrontImageButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 27).isActive = true
        addFrontImageButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -27).isActive = true
        addFrontImageButton.heightAnchor.constraint(equalToConstant: 190).isActive = true
        
        customBackView.translatesAutoresizingMaskIntoConstraints = false
        customBackView.bottomAnchor.constraint(equalTo: createButton.topAnchor, constant: -40).isActive = true
        customBackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 27).isActive = true
        customBackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -27).isActive = true
        customBackView.heightAnchor.constraint(equalToConstant: 190).isActive = true
        
        addBackImageButton.translatesAutoresizingMaskIntoConstraints = false
        addBackImageButton.bottomAnchor.constraint(equalTo: createButton.topAnchor, constant: -40).isActive = true
        addBackImageButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 27).isActive = true
        addBackImageButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -27).isActive = true
        addBackImageButton.heightAnchor.constraint(equalToConstant: 190).isActive = true
        
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
        customFrontView.layer.cornerRadius = 40
        customFrontView.backgroundColor = .clear
        customFrontView.layer.masksToBounds = true
        customFrontView.contentMode = .scaleAspectFill
        
        let symbolConfigurationSetup = UIImage.SymbolConfiguration(pointSize: 55)
        
        addFrontImageButton.backgroundColor = UIColor(resource: .Colors.backgroundColorCell)
        addFrontImageButton.tintColor = UIColor(resource: .Colors.colorText)
        addFrontImageButton.setImage(UIImage(systemName: "photo.badge.plus"), for: .normal)
        addFrontImageButton.setPreferredSymbolConfiguration(symbolConfigurationSetup, forImageIn: .normal)
        addFrontImageButton.addTarget(self, action: #selector(tapOnAlertButton), for: .touchUpInside)
        addFrontImageButton.layer.cornerRadius = 40
        addFrontImageButton.layer.shadowColor = UIColor.black.cgColor
        addFrontImageButton.layer.shadowOffset = CGSize(width: 0, height: 2)
        addFrontImageButton.layer.shadowRadius = 5
        addFrontImageButton.layer.shadowOpacity = 0.20
        
        customBackView.backgroundColor = .clear
        customBackView.layer.masksToBounds = true
        customBackView.contentMode = .scaleAspectFill
        customBackView.layer.cornerRadius = 40
        
        addBackImageButton.backgroundColor = UIColor(resource: .Colors.backgroundColorCell)
        addBackImageButton.tintColor = UIColor(resource: .Colors.colorText)
        addBackImageButton.setImage(UIImage(systemName: "photo.badge.plus"), for: .normal)
        addBackImageButton.setPreferredSymbolConfiguration(symbolConfigurationSetup, forImageIn: .normal)
        addBackImageButton.addTarget(self, action: #selector(tapOnAlertButton2), for: .touchUpInside)
        addBackImageButton.layer.cornerRadius = 40
        addBackImageButton.layer.shadowColor = UIColor.black.cgColor
        addBackImageButton.layer.shadowOffset = CGSize(width: 0, height: 2)
        addBackImageButton.layer.shadowRadius = 5
        addBackImageButton.layer.shadowOpacity = 0.20

        
        titleLabel.text = NSLocalizedString("App.AddDiscountView.NavigationItemTitle", comment: "")
        titleLabel.textColor = UIColor(resource: .Colors.colorText)
        titleLabel.font = UIFont.rubik(ofSize: 24, style: .semiBold)
        
        nameLabel.text = NSLocalizedString("App.AddDiscountView.NameLabel", comment: "")
        nameLabel.textColor = UIColor(resource: .Colors.colorText)
        nameLabel.font = UIFont.rubik(ofSize: 20, style: .medium)
        
        nameTextField.attributedPlaceholder = NSAttributedString(string: NSLocalizedString("App.AddDiscountView.NameTextField", comment: ""),
                                                                 attributes: [NSAttributedString.Key.foregroundColor: UIColor(resource: .Colors.colorText)])
        nameTextField.font = UIFont.rubik(ofSize: 20, style: .light)
        nameTextField.textColor = UIColor(resource: .Colors.colorText)
        nameTextField.textAlignment = .center
        
        lineNameTextFieldLabel.backgroundColor = UIColor(resource: .Colors.colorText)
        
        createButton.setTitle(NSLocalizedString("App.AddDiscountView.СreateButton", comment: ""), for: .normal)
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
    
    private func setupBindings() {
        viewModel.setupAlert = { [weak self] alert in
            self?.present(alert, animated: true)
        }
        
        viewModel.setupUIImagePicker = { [weak self] picker in
            picker.delegate = self
            self?.present(picker, animated: true)
        }
        
        viewModel.setupUIImagePicker = { [weak self] imagePicker in
            imagePicker.delegate = self
            self?.present(imagePicker, animated: true, completion: nil)
        }
    }
    
    private func saveDiscounts() {
        guard let imageFrontDiscount = customFrontView.image?.jpegData(compressionQuality: 1.0),
              let imageBackDiscount = customBackView.image?.jpegData(compressionQuality: 1.0),
              let nameDiscount = nameTextField.text, !nameDiscount.isEmpty
        else {
            let alert = UIAlertController(title: NSLocalizedString("App.AddDiscountView.TapOnALertButton.Eror", comment: ""), message: NSLocalizedString("App.AddDiscountView.TapOnALertButton.Message", comment: ""), preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            present(alert, animated: true, completion: nil)
            return
        }
        
        viewModel.saveNewDiscount(imageFrontDiscount: imageFrontDiscount, imageBackDiscount: imageBackDiscount, nameDiscount: nameDiscount)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) { [weak self] in
            self?.onSave?()
        }
    }

    private func setupTap() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(tapDone))
        view.addGestureRecognizer(tap)
    }
    
    private func setupImage(image: UIImage?) {
        if let image = image {
            DispatchQueue.main.async {
                if self.isImageSelected {
                    self.customFrontView.image = image
                    self.addFrontImageButton.setImage(UIImage(), for: .normal)
                } else {
                    self.customBackView.image = image
                    self.addBackImageButton.setImage(UIImage(), for: .normal)
                }
            }
        }
    }
    
    // MARK: - Actions
    
    @objc private func saveButtonTapped() {
        saveDiscounts()
        goBack()
    }
    
    @objc private func goBack() {
        navigationController?.popViewController(animated: true)
    }
    
    @objc private func tapDone() {
        view.endEditing(true)
    }
    
    @objc private func tapOnAlertButton() {
        viewModel?.tapOnALertButton()
        isImageSelected = true
    }
    
    @objc private func tapOnAlertButton2() {
        viewModel?.tapOnALertButton()
        isImageSelected = false
    }
    
    @objc private func openGalery() {
        viewModel.openGallery()
    }
    
    @objc private func openCamera() {
        viewModel.openCamera()
    }
}

// MARK: - UITextFieldDelegate

extension AddDiscountView: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let allowedCharacters = CharacterSet.decimalDigits
        let characterSet = CharacterSet(charactersIn: string)
        return allowedCharacters.isSuperset(of: characterSet)
    }
}

// MARK: - UIImagePickerControllerDelegate

extension AddDiscountView: UIImagePickerControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[.editedImage] as? UIImage {
            setupImage(image: image)
        }
        picker.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
}
