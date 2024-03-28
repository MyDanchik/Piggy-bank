import UIKit

class ConverterView: UIViewController {
    
    // MARK: - Publuc Properties
    var viewModel: ConverterViewModel!
    
    // MARK: - UI Properties
    let converterTitleLabel = UILabel()
    let firstCurrencyView = UIView()
    let secondCurrencyView = UIView()
    let changeCurrencyButton = UIButton()
    let currentCurrencyButton = UIButton(type: .system)
    let amountTextFieldForFirstView = UITextField()
    let desiredCurrencyButton = UIButton(type: .system)
    let conversionResult = UILabel()
    let littleView1 = UIView()
    let littleView2 = UIView()

    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addSubviews()
        constraints()
        configureUI()
    }

    // MARK: - Methods
    func addSubviews() {
        view.addSubview(converterTitleLabel)
        view.addSubview(firstCurrencyView)
        firstCurrencyView.addSubview(currentCurrencyButton)
        firstCurrencyView.addSubview(amountTextFieldForFirstView)
        firstCurrencyView.addSubview(littleView1)
        view.addSubview(changeCurrencyButton)
        view.addSubview(secondCurrencyView)
        secondCurrencyView.addSubview(desiredCurrencyButton)
        secondCurrencyView.addSubview(conversionResult)
        secondCurrencyView.addSubview(littleView2)
    }
    
    func constraints() {
        converterTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        converterTitleLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 80).isActive = true
        converterTitleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        converterTitleLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        firstCurrencyView.translatesAutoresizingMaskIntoConstraints = false
        firstCurrencyView.topAnchor.constraint(equalTo: converterTitleLabel.bottomAnchor, constant: 43).isActive = true
        firstCurrencyView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24).isActive = true
        firstCurrencyView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24).isActive = true
        firstCurrencyView.heightAnchor.constraint(equalToConstant: 80).isActive = true
        
        currentCurrencyButton.translatesAutoresizingMaskIntoConstraints = false
        currentCurrencyButton.leadingAnchor.constraint(equalTo: firstCurrencyView.leadingAnchor, constant: 20).isActive = true
        currentCurrencyButton.centerYAnchor.constraint(equalTo: firstCurrencyView.centerYAnchor).isActive = true
        
        amountTextFieldForFirstView.translatesAutoresizingMaskIntoConstraints = false
        amountTextFieldForFirstView.trailingAnchor.constraint(equalTo: firstCurrencyView.trailingAnchor, constant: -30).isActive = true
        amountTextFieldForFirstView.centerYAnchor.constraint(equalTo: firstCurrencyView.centerYAnchor).isActive = true
        amountTextFieldForFirstView.widthAnchor.constraint(greaterThanOrEqualToConstant: 60).isActive = true
        
        littleView1.translatesAutoresizingMaskIntoConstraints = false
        littleView1.trailingAnchor.constraint(equalTo: firstCurrencyView.trailingAnchor, constant: -30).isActive = true
        littleView1.topAnchor.constraint(equalTo: amountTextFieldForFirstView.bottomAnchor, constant: 2).isActive = true
        littleView1.widthAnchor.constraint(equalTo: amountTextFieldForFirstView.widthAnchor).isActive = true
        littleView1.heightAnchor.constraint(equalToConstant: 1).isActive = true
        
        changeCurrencyButton.translatesAutoresizingMaskIntoConstraints = false
        changeCurrencyButton.topAnchor.constraint(equalTo: firstCurrencyView.bottomAnchor, constant: 25).isActive = true
        changeCurrencyButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        changeCurrencyButton.widthAnchor.constraint(equalToConstant: 40).isActive = true
        changeCurrencyButton.heightAnchor.constraint(equalToConstant: 35).isActive = true
        changeCurrencyButton.isEnabled = false

        secondCurrencyView.translatesAutoresizingMaskIntoConstraints = false
        secondCurrencyView.topAnchor.constraint(equalTo: changeCurrencyButton.bottomAnchor, constant: 25).isActive = true
        secondCurrencyView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24).isActive = true
        secondCurrencyView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24).isActive = true
        secondCurrencyView.heightAnchor.constraint(equalToConstant: 80).isActive = true
        
        desiredCurrencyButton.translatesAutoresizingMaskIntoConstraints = false
        desiredCurrencyButton.leadingAnchor.constraint(equalTo: secondCurrencyView.leadingAnchor, constant: 20).isActive = true
        desiredCurrencyButton.centerYAnchor.constraint(equalTo: secondCurrencyView.centerYAnchor).isActive = true
        
        conversionResult.translatesAutoresizingMaskIntoConstraints = false
        conversionResult.trailingAnchor.constraint(equalTo: secondCurrencyView.trailingAnchor, constant: -30).isActive = true
        conversionResult.centerYAnchor.constraint(equalTo: secondCurrencyView.centerYAnchor).isActive = true
        conversionResult.widthAnchor.constraint(greaterThanOrEqualToConstant: 60).isActive = true
        
        littleView2.translatesAutoresizingMaskIntoConstraints = false
        littleView2.trailingAnchor.constraint(equalTo: secondCurrencyView.trailingAnchor, constant: -30).isActive = true
        littleView2.topAnchor.constraint(equalTo: conversionResult.bottomAnchor, constant: 2).isActive = true
        littleView2.widthAnchor.constraint(equalTo: conversionResult.widthAnchor).isActive = true
        littleView2.heightAnchor.constraint(equalToConstant: 1).isActive = true
    }
    
    func configureUI() {
        view.backgroundColor = UIColor(resource: .Colors.backgroundColorMain)
        
        converterTitleLabel.text = "Конвертер"
        converterTitleLabel.textColor = UIColor(resource: .Colors.colorText)
        converterTitleLabel.font = UIFont(name: "Rubik-Medium", size: 24)
        
        firstCurrencyView.backgroundColor = UIColor(resource: .Colors.backgroundColorCell)
        firstCurrencyView.layer.cornerRadius = 40
        firstCurrencyView.layer.shadowColor = UIColor.black.cgColor
        firstCurrencyView.layer.shadowOffset = CGSize(width: 0, height: 2)
        firstCurrencyView.layer.shadowRadius = 5
        firstCurrencyView.layer.shadowOpacity = 0.20
        
        amountTextFieldForFirstView.textAlignment = .center
        conversionResult.textAlignment = .center
        conversionResult.text = " "
        
        littleView1.backgroundColor = UIColor(resource: .Colors.colorText)
        littleView2.backgroundColor = UIColor(resource: .Colors.colorText)
        
        let configurationForChangeCurrencyButton = UIImage.SymbolConfiguration(pointSize: 40)
        let imageForChangeCurrencyButton = UIImage(systemName: "arrow.up.arrow.down", withConfiguration: configurationForChangeCurrencyButton)
        changeCurrencyButton.setImage(imageForChangeCurrencyButton, for: .normal)
        changeCurrencyButton.tintColor = UIColor(resource: .Colors.tintSelectColorTapBar)
        changeCurrencyButton.addTarget(self, action: #selector(changeCurrencyButtonTapped), for: .touchUpInside)
        
        secondCurrencyView.backgroundColor = UIColor(resource: .Colors.backgroundColorCell)
        secondCurrencyView.layer.cornerRadius = 40
        secondCurrencyView.layer.shadowColor = UIColor.black.cgColor
        secondCurrencyView.layer.shadowOffset = CGSize(width: 0, height: 2)
        secondCurrencyView.layer.shadowRadius = 5
        secondCurrencyView.layer.shadowOpacity = 0.20
        
        amountTextFieldForFirstView.keyboardType = .numberPad
        
        currentCurrencyButton.setTitle("USD", for: .normal)
        currentCurrencyButton.tintColor = UIColor(resource: .Colors.colorText)
        currentCurrencyButton.semanticContentAttribute = .forceRightToLeft
        currentCurrencyButton.setImage(UIImage(systemName: "chevron.down"), for: .normal)
        currentCurrencyButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        currentCurrencyButton.setTitleColor(UIColor(resource: .Colors.colorText), for: .normal)
        currentCurrencyButton.addTarget(self, action: #selector(currentCurrencySelectionTapped), for: .touchUpInside)
        
        desiredCurrencyButton.setTitle("BYN", for: .normal)
        desiredCurrencyButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        desiredCurrencyButton.setTitleColor(UIColor(resource: .Colors.colorText), for: .normal)
    }
    
    @objc func editingChanged() {

    }
    
    @objc func currentCurrencySelectionTapped() {

    }
    
    @objc func changeCurrencyButtonTapped() {

    }
}



