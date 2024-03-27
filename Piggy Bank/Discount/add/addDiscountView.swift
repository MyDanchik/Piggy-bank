import UIKit
import PhotosUI

final class DefaultAddDiscountView: UIViewController, UINavigationControllerDelegate {
    
    var viewModel: DefaultAddDiscountViewModel!
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .backgroundColorMain
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
        customFrontView.heightAnchor.constraint(equalToConstant: 180).isActive = true
        
        addFrontImageButton.translatesAutoresizingMaskIntoConstraints = false
        addFrontImageButton.bottomAnchor.constraint(equalTo: customBackView.topAnchor, constant: -30).isActive = true
        addFrontImageButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 27).isActive = true
        addFrontImageButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -27).isActive = true
        addFrontImageButton.heightAnchor.constraint(equalToConstant: 180).isActive = true
        
        customBackView.translatesAutoresizingMaskIntoConstraints = false
        customBackView.bottomAnchor.constraint(equalTo: createButton.topAnchor, constant: -40).isActive = true
        customBackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 27).isActive = true
        customBackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -27).isActive = true
        customBackView.heightAnchor.constraint(equalToConstant: 180).isActive = true
        
        addBackImageButton.translatesAutoresizingMaskIntoConstraints = false
        addBackImageButton.bottomAnchor.constraint(equalTo: createButton.topAnchor, constant: -40).isActive = true
        addBackImageButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 27).isActive = true
        addBackImageButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -27).isActive = true
        addBackImageButton.heightAnchor.constraint(equalToConstant: 180).isActive = true
        
        createButton.translatesAutoresizingMaskIntoConstraints = false
        createButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -50).isActive = true
        createButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        createButton.heightAnchor.constraint(equalToConstant: 70).isActive = true
        createButton.widthAnchor.constraint(equalToConstant: 290).isActive = true
    }
    
    private func setupUI() {
        customFrontView.layer.shadowColor = UIColor.black.cgColor
        customFrontView.layer.shadowOffset = CGSize(width: 0, height: 5)
        customFrontView.layer.shadowRadius = 6
        customFrontView.layer.shadowOpacity = 0.20
        customFrontView.layer.borderWidth = 2.0
        customFrontView.layer.borderColor = UIColor.purple.cgColor
        customFrontView.layer.cornerRadius = 30
        customFrontView.backgroundColor = .backgroundColorMain
        customFrontView.layer.masksToBounds = true
        
        addFrontImageButton.backgroundColor = .clear
        addFrontImageButton.setImage(UIImage(named: "addImageBirthdaysView"), for: .normal)
        addFrontImageButton.addTarget(self, action: #selector(tapOnAlertButton), for: .touchUpInside)
        
        customBackView.layer.shadowColor = UIColor.black.cgColor
        customBackView.layer.shadowOffset = CGSize(width: 0, height: 5)
        customBackView.layer.shadowRadius = 6
        customBackView.layer.shadowOpacity = 0.20
        customBackView.layer.borderWidth = 2.0
        customBackView.layer.borderColor = UIColor.purple.cgColor
        customBackView.layer.cornerRadius = 30
        customBackView.backgroundColor = .backgroundColorMain
        customBackView.layer.masksToBounds = true
        
        addBackImageButton.backgroundColor = .clear
        addBackImageButton.setImage(UIImage(named: "addImageBirthdaysView"), for: .normal)
        addBackImageButton.addTarget(self, action: #selector(tapOnAlertButton2), for: .touchUpInside)
        
        titleLabel.text = "Creat discount"
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
        
        createButton.setTitle("Creat", for: .normal)
        createButton.titleLabel?.font = UIFont(name: "Rubik-Regular", size: 18)
        createButton.tintColor = .white
        createButton.backgroundColor = UIColor(red: 197/255, green: 119/255, blue: 209/255, alpha: 1.0)
        createButton.layer.cornerRadius = 35
        createButton.addTarget(self, action: #selector(saveButtonTapped), for: .touchUpInside)
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
              let nameDiscount = nameTextField.text, !nameDiscount.isEmpty
        else {
            return
        }
        viewModel.saveNewDiscount(imageFrontDiscount: imageFrontDiscount,
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

extension DefaultAddDiscountView: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let allowedCharacters = CharacterSet.decimalDigits
        let characterSet = CharacterSet(charactersIn: string)
        return allowedCharacters.isSuperset(of: characterSet)
    }
}

extension DefaultAddDiscountView: PHPickerViewControllerDelegate {
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

extension DefaultAddDiscountView: UIImagePickerControllerDelegate {
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
