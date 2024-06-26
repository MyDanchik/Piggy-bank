import UIKit

final class ConverterView: UIViewController {
    
    // MARK: - Properties
    
    private var viewModel = ConverterViewModel()
    
    // MARK: - UI Elements
    
    private let converterTitleLabel = UILabel()
    private let firstCurrencyView = UIView()
    private let secondCurrencyView = UIView()
    private let changeCurrencyButton = UIButton()
    private let currentCurrencyButton = UIButton(type: .system)
    private let amountTextField = UITextField()
    private let desiredCurrencyButton = UIButton(type: .system)
    private let conversionResult = UILabel()
    private let littleViewFirst = UIView()
    private let littleViewSecond = UIView()
    
    // MARK: - Lifecycle Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addSubviews()
        configureConstraints()
        configureUI()
        fetchConverterRates()
        setupTap()
    }
    
    // MARK: - Private Methods
    
    private func addSubviews() {
        view.addSubview(converterTitleLabel)
        view.addSubview(firstCurrencyView)
        firstCurrencyView.addSubview(currentCurrencyButton)
        firstCurrencyView.addSubview(amountTextField)
        firstCurrencyView.addSubview(littleViewFirst)
        view.addSubview(changeCurrencyButton)
        view.addSubview(secondCurrencyView)
        secondCurrencyView.addSubview(desiredCurrencyButton)
        secondCurrencyView.addSubview(conversionResult)
        secondCurrencyView.addSubview(littleViewSecond)
    }
    
    private func configureConstraints() {
        converterTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        converterTitleLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 80).isActive = true
        converterTitleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        firstCurrencyView.translatesAutoresizingMaskIntoConstraints = false
        firstCurrencyView.topAnchor.constraint(equalTo: converterTitleLabel.bottomAnchor, constant: 55).isActive = true
        firstCurrencyView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24).isActive = true
        firstCurrencyView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24).isActive = true
        firstCurrencyView.heightAnchor.constraint(equalToConstant: 80).isActive = true
        
        currentCurrencyButton.translatesAutoresizingMaskIntoConstraints = false
        currentCurrencyButton.leadingAnchor.constraint(equalTo: firstCurrencyView.leadingAnchor, constant: 20).isActive = true
        currentCurrencyButton.centerYAnchor.constraint(equalTo: firstCurrencyView.centerYAnchor).isActive = true
        
        amountTextField.translatesAutoresizingMaskIntoConstraints = false
        amountTextField.trailingAnchor.constraint(equalTo: firstCurrencyView.trailingAnchor, constant: -30).isActive = true
        amountTextField.centerYAnchor.constraint(equalTo: firstCurrencyView.centerYAnchor).isActive = true
        amountTextField.widthAnchor.constraint(greaterThanOrEqualToConstant: 60).isActive = true
        
        littleViewFirst.translatesAutoresizingMaskIntoConstraints = false
        littleViewFirst.trailingAnchor.constraint(equalTo: firstCurrencyView.trailingAnchor, constant: -30).isActive = true
        littleViewFirst.topAnchor.constraint(equalTo: amountTextField.bottomAnchor, constant: 2).isActive = true
        littleViewFirst.widthAnchor.constraint(equalTo: amountTextField.widthAnchor).isActive = true
        littleViewFirst.heightAnchor.constraint(equalToConstant: 1).isActive = true
        
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
        
        littleViewSecond.translatesAutoresizingMaskIntoConstraints = false
        littleViewSecond.trailingAnchor.constraint(equalTo: secondCurrencyView.trailingAnchor, constant: -30).isActive = true
        littleViewSecond.topAnchor.constraint(equalTo: conversionResult.bottomAnchor, constant: 2).isActive = true
        littleViewSecond.widthAnchor.constraint(equalTo: conversionResult.widthAnchor).isActive = true
        littleViewSecond.heightAnchor.constraint(equalToConstant: 1).isActive = true
    }
    
    private func configureUI() {
        view.backgroundColor = UIColor(resource: .Colors.backgroundColorMain)
        
        converterTitleLabel.text = NSLocalizedString("App.ConverterView.NavigationItemTitle", comment: "")
        converterTitleLabel.textColor = UIColor(resource: .Colors.colorText)
        converterTitleLabel.font = UIFont.rubik(ofSize: 24, style: .semiBold)
        
        firstCurrencyView.backgroundColor = UIColor(resource: .Colors.backgroundColorCell)
        firstCurrencyView.layer.cornerRadius = 40
        firstCurrencyView.layer.shadowColor = UIColor.black.cgColor
        firstCurrencyView.layer.shadowOffset = CGSize(width: 0, height: 2)
        firstCurrencyView.layer.shadowRadius = 5
        firstCurrencyView.layer.shadowOpacity = 0.20
        
        amountTextField.textAlignment = .center
        conversionResult.textAlignment = .center
        conversionResult.text = " "
        
        littleViewFirst.backgroundColor = UIColor(resource: .Colors.colorText)
        littleViewSecond.backgroundColor = UIColor(resource: .Colors.colorText)
        
        let configurationForChangeCurrencyButton = UIImage.SymbolConfiguration(pointSize: 40)
        let imageForChangeCurrencyButton = UIImage(systemName: "arrow.up.arrow.down", withConfiguration: configurationForChangeCurrencyButton)
        changeCurrencyButton.setImage(imageForChangeCurrencyButton, for: .normal)
        changeCurrencyButton.tintColor = UIColor(resource: .Colors.tintSelectColorTapBar)
        
        secondCurrencyView.backgroundColor = UIColor(resource: .Colors.backgroundColorCell)
        secondCurrencyView.layer.cornerRadius = 40
        secondCurrencyView.layer.shadowColor = UIColor.black.cgColor
        secondCurrencyView.layer.shadowOffset = CGSize(width: 0, height: 2)
        secondCurrencyView.layer.shadowRadius = 5
        secondCurrencyView.layer.shadowOpacity = 0.20
        
        amountTextField.keyboardType = .numberPad
        
        currentCurrencyButton.setTitle("Add", for: .normal)
        currentCurrencyButton.tintColor = UIColor(resource: .Colors.colorText)
        currentCurrencyButton.semanticContentAttribute = .forceRightToLeft
        currentCurrencyButton.setImage(UIImage(systemName: "chevron.down"), for: .normal)
        currentCurrencyButton.titleLabel?.font = UIFont.rubik(ofSize: 20, style: .regular)
        currentCurrencyButton.setTitleColor(UIColor(resource: .Colors.colorText), for: .normal)
        currentCurrencyButton.addTarget(self, action: #selector(currentCurrencyButtonTapped), for: .touchUpInside)
        
        desiredCurrencyButton.setTitle("BYN", for: .normal)
        desiredCurrencyButton.titleLabel?.font = UIFont.rubik(ofSize: 20, style: .regular)
        desiredCurrencyButton.setTitleColor(UIColor(resource: .Colors.colorText), for: .normal)
    }
    
    
    private func fetchConverterRates() {
        viewModel.fetchConverterRates { [weak self] rates in
            if rates != nil {
                self?.desiredCurrencyButton.setTitle("BYN", for: .normal)
            } else {
                
                print("Failed to fetch exchange rates")
            }
        }
        amountTextField.addTarget(self, action: #selector(amountTextFieldDidChange), for: .editingChanged)
    }
    
    private func showCurrencySelectionActionSheet(with rates: [ExchangeRate]) {
        let actionSheet = UIAlertController(title: "Выбор валюты", message: nil, preferredStyle: .actionSheet)
        
        for rate in rates {
            let action = UIAlertAction(title: rate.abbreviation, style: .default) { [weak self] _ in
                self?.currentCurrencyButton.setTitle(rate.abbreviation, for: .normal)
            }
            actionSheet.addAction(action)
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        actionSheet.addAction(cancelAction)
        
        present(actionSheet, animated: true, completion: nil)
        conversionResult.text = " "
        amountTextField.text = ""
    }
    
    private func convertAndDisplayResult(from sourceCurrency: String, to targetCurrency: String, amount: Double) {
        if let convertedAmount = viewModel.convertCurrency(from: sourceCurrency, to: targetCurrency, amount: amount) {
            conversionResult.text = String(format: "%.2f", convertedAmount)
        } else {
            print("Failed to convert currency")
        }
    }
    
    private func setupTap() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(tapDone))
        view.addGestureRecognizer(tap)
    }
    
    // MARK: - Actions
    
    @objc private func tapDone() {
        view.endEditing(true)
    }
    
    @objc private func currentCurrencyButtonTapped() {
        viewModel.fetchConverterRates { [weak self] rates in
            if let rates = rates {
                self?.showCurrencySelectionActionSheet(with: rates)
            } else {
                print("Failed to fetch exchange rates")
            }
        }
    }
    
    @objc private func amountTextFieldDidChange() {
        guard let amountText = amountTextField.text, !amountText.isEmpty else {
            conversionResult.text = " "
            return
        }
        
        guard let amountText = amountTextField.text, let amount = Double(amountText) else {
            print("Invalid amount entered")
            return
        }
        
        guard let sourceCurrency = currentCurrencyButton.title(for: .normal), let targetCurrency = desiredCurrencyButton.title(for: .normal) else {
            print("Currency not selected")
            return
        }
        convertAndDisplayResult(from: sourceCurrency, to: targetCurrency, amount: amount)
    }
}




