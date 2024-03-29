import UIKit
import PhotosUI

final class AddDiscountView: UIViewController, UINavigationControllerDelegate {
    
    var viewModel: AddDiscountViewModel!
    var onSave: (() -> Void)?
    
    private var isImageSelected = true
    private let titleLabel = UILabel()
    private let nameLabel = UILabel()
    private let nameTextField = UITextField()
    private let createButton = UIButton()
    private let lineNameTextFieldLabel = UILabel()
    private let iconLabel = UILabel()
    private let imageView = UIImageView()
    private let customFrontView = UIImageView()
    private let addFrontImageButton = UIButton()
    private let customBackView = UIImageView()
    private let addBackImageButton = UIButton()
    private let backButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(resource: .Colors.backgroundColorMain)
        setupSubviews()
        setupConstraints()
        setupUI()
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
    
    private func setupSubviews() {
        view.addSubview(titleLabel)
        view.addSubview(createButton)
        view.addSubview(lineNameTextFieldLabel)
        view.addSubview(nameTextField)
        view.addSubview(nameLabel)
        view.addSubview(iconLabel)
        view.addSubview(imageView)
        view.addSubview(customFrontView)
        view.addSubview(addFrontImageButton)
        view.addSubview(customBackView)
        view.addSubview(addBackImageButton)
        view.addSubview(backButton)
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
    
    private func setupUI() {
        customFrontView.layer.cornerRadius = 40
        customFrontView.backgroundColor = UIColor(resource: .Colors.backgroundColorCell)
        customFrontView.layer.masksToBounds = true
        
        let symbolConfigurationSetup = UIImage.SymbolConfiguration(pointSize: 55)
        
        addFrontImageButton.backgroundColor = .clear
        addFrontImageButton.tintColor = UIColor(resource: .Colors.colorText)
        addFrontImageButton.setImage(UIImage(systemName: "photo.badge.plus"), for: .normal)
        addFrontImageButton.setPreferredSymbolConfiguration(symbolConfigurationSetup, forImageIn: .normal)
        addFrontImageButton.addTarget(self, action: #selector(tapOnAlertButton), for: .touchUpInside)
        
        customBackView.layer.cornerRadius = 40
        customBackView.backgroundColor = UIColor(resource: .Colors.backgroundColorCell)
        customBackView.layer.masksToBounds = true
        
        addBackImageButton.backgroundColor = .clear
        addBackImageButton.tintColor = UIColor(resource: .Colors.colorText)
        addBackImageButton.setImage(UIImage(systemName: "photo.badge.plus"), for: .normal)
        addBackImageButton.setPreferredSymbolConfiguration(symbolConfigurationSetup, forImageIn: .normal)
        addBackImageButton.addTarget(self, action: #selector(tapOnAlertButton2), for: .touchUpInside)
        
        titleLabel.text = "Creat discount"
        titleLabel.textColor = UIColor(resource: .Colors.colorText)
        titleLabel.font = UIFont.rubik(ofSize: 24, style: .semiBold)
        
        nameLabel.text = "Name"
        nameLabel.textColor = UIColor(resource: .Colors.colorText)
        nameLabel.font = UIFont.rubik(ofSize: 20, style: .medium)
        
        nameTextField.attributedPlaceholder = NSAttributedString(string: "Name",
                                                                 attributes: [NSAttributedString.Key.foregroundColor: UIColor(resource: .Colors.colorText)])
        nameTextField.font = UIFont.rubik(ofSize: 20, style: .light)
        nameTextField.textColor = UIColor(resource: .Colors.colorText)
        nameTextField.textAlignment = .center
        
        lineNameTextFieldLabel.backgroundColor = UIColor(resource: .Colors.colorText)
        
        createButton.setTitle("Creat", for: .normal)
        createButton.titleLabel?.font = UIFont.rubik(ofSize: 18, style: .regular)
        createButton.tintColor = .white
        createButton.backgroundColor = UIColor(resource: .Colors.colorButton)
        createButton.layer.cornerRadius = 35
        createButton.addTarget(self, action: #selector(saveButtonTapped), for: .touchUpInside)
        
        backButton.tintColor = UIColor(resource: .Colors.colorText)
        backButton.setImage(UIImage(systemName: "chevron.backward"), for: .normal)
        let symbolConfiguration = UIImage.SymbolConfiguration(pointSize: 25)
        backButton.setPreferredSymbolConfiguration(symbolConfiguration, forImageIn: .normal)
        backButton.addTarget(self, action: #selector(self.goBack), for: .touchUpInside)
        backButton.backgroundColor = UIColor(resource: .Colors.backgroundColorItem)
        backButton.layer.cornerRadius = 27.5
    }
    
    private func setupBindings() {
        viewModel.setupAlert = { [weak self] alert in
            self?.present(alert, animated: true)
        }
        
        viewModel.setupPHPicker = { [weak self] picker in
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
            return
        }
        viewModel.saveNewDiscount(imageFrontDiscount: imageFrontDiscount, imageBackDiscount: imageBackDiscount,
                                  nameDiscount: nameDiscount)

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
    
    @objc func saveButtonTapped() {
        print("save")
        saveDiscounts()
        goBack()
    }
    
    @objc func goBack() {
        navigationController?.popViewController(animated: true)
    }
    
    @objc func tapDone() {
        view.endEditing(true)
    }
    
    @objc func tapOnAlertButton() {
        viewModel?.tapOnALertButton()
        isImageSelected = true
        print("im")
    }

    @objc func tapOnAlertButton2() {
        viewModel?.tapOnALertButton()
        isImageSelected = false
        print("im2")
    }

    @objc func openGalery() {
        viewModel.openGalery()
    }
    
    @objc func openCamera() {
        viewModel.openCamera()
    }
}

extension AddDiscountView: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let allowedCharacters = CharacterSet.decimalDigits
        let characterSet = CharacterSet(charactersIn: string)
        return allowedCharacters.isSuperset(of: characterSet)
    }
}

extension AddDiscountView: PHPickerViewControllerDelegate {
    func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
        let itemProvider = results.first?.itemProvider
        if let itemProvider = itemProvider, itemProvider.canLoadObject(ofClass: UIImage.self) {
            itemProvider.loadObject(ofClass: UIImage.self) { image, _ in
                self.setupImage(image: image as? UIImage)
            }
        }
        dismiss(animated: true)
    }
}

extension AddDiscountView: UIImagePickerControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[.originalImage] as? UIImage {
            setupImage(image: image)
        }
        picker.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
}
