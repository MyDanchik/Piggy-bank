import UIKit

final class DefaultExchangeView: UIViewController {
    
    private let titleLabel = UILabel()
    private let fetchButton = UIButton()
    private let tableView = UITableView()
    private var exchangeRates: [ExchangeRate] = []
    private let lastUpdatedLabel = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(resource: .Colors.backgroundColorMain)
        setupSubviews()
        setupConstraints()
        setupUI()
        setupTableView()
        fetchExchangeRates()
        startLoadingAnimation()
    }
    
    private func setupSubviews() {
        view.addSubview(titleLabel)
        view.addSubview(fetchButton)
        view.addSubview(tableView)
        view.addSubview(lastUpdatedLabel)
    }
    
    private func setupTableView() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(ExchangeTableViewCell.self, forCellReuseIdentifier: "ExchangeTableViewCell")
        tableView.rowHeight = 100
        tableView.separatorStyle = .none
        tableView.backgroundColor = .clear
    }
    
    private func fetchExchangeRates() {
        NetworkManager.shared.fetchExchangeRates { [weak self] rates in
            if let rates = rates {
                // Фильтруем курсы, оставляем только доллар и евро
                let filteredRates = rates.filter { $0.abbreviation == "USD" || $0.abbreviation == "EUR" || $0.abbreviation == "RUB" || $0.abbreviation == "PLN" || $0.abbreviation == "CNY"}
                DispatchQueue.main.async {
                    self?.exchangeRates = filteredRates
                    self?.tableView.reloadData()
                    
                    // Обновляем текст метки с временем последней загрузки
                    let dateFormatter = DateFormatter()
                    dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
                    self?.lastUpdatedLabel.text = "Last updated: \(dateFormatter.string(from: Date())) NBRB.BY"
                    
                    self?.stopLoadingAnimation()
                }
            } else {
                print("Failed to fetch exchange rates")
            }
        }
    }

    private func setupConstraints() {
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 80).isActive = true
        titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        fetchButton.translatesAutoresizingMaskIntoConstraints = false
        fetchButton.centerYAnchor.constraint(equalTo: titleLabel.centerYAnchor).isActive = true
        fetchButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24).isActive = true
        fetchButton.heightAnchor.constraint(equalToConstant: 55).isActive = true
        fetchButton.widthAnchor.constraint(equalToConstant: 55).isActive = true
        
        lastUpdatedLabel.translatesAutoresizingMaskIntoConstraints = false
        lastUpdatedLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 23).isActive = true
        lastUpdatedLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: lastUpdatedLabel.bottomAnchor, constant: 5).isActive = true
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }
    
    private func setupUI() {
        titleLabel.text = "Exchange Rate"
        titleLabel.textColor = UIColor(resource: .Colors.colorText)
        titleLabel.font = UIFont(name: "Rubik-Medium", size: 24)
        
        fetchButton.tintColor = UIColor(resource: .Colors.colorText)
        fetchButton.setImage(UIImage(systemName: "goforward"), for: .normal)
        let symbolConfiguration = UIImage.SymbolConfiguration(pointSize: 25)
        fetchButton.setPreferredSymbolConfiguration(symbolConfiguration, forImageIn: .normal)
        fetchButton.addTarget(self, action: #selector(tapOnAddButton), for: .touchUpInside)
        fetchButton.backgroundColor = UIColor(resource: .Colors.backgroundColorItem)
        fetchButton.layer.cornerRadius = 27.5
        fetchButton.layer.shadowColor = UIColor.black.cgColor
        fetchButton.layer.shadowOffset = CGSize(width: 0, height: 2)
        fetchButton.layer.shadowRadius = 5
        fetchButton.layer.shadowOpacity = 0.20
        
        lastUpdatedLabel.textColor = .gray
        lastUpdatedLabel.font = UIFont(name: "Rubik-Light", size: 14)
    }
    
    private func startLoadingAnimation() {
        // Создаем и добавляем индикатор загрузки на вашу вью
        let activityIndicator = UIActivityIndicatorView(style: .large)
        activityIndicator.color = .black
        activityIndicator.center = view.center
        activityIndicator.startAnimating()
        view.addSubview(activityIndicator)
    }
    
    private func stopLoadingAnimation() {
        // Удаляем индикатор загрузки из вашей вью
        for subview in view.subviews {
            if let activityIndicator = subview as? UIActivityIndicatorView {
                activityIndicator.stopAnimating()
                activityIndicator.removeFromSuperview()
                break
            }
        }
    }
    
    @objc func tapOnAddButton() {
        fetchExchangeRates()
        startLoadingAnimation()
        print("update")
    }
}

extension DefaultExchangeView: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return exchangeRates.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ExchangeTableViewCell", for: indexPath) as? ExchangeTableViewCell else {
            return UITableViewCell()
        }
        
        let rate = exchangeRates[indexPath.row]
        cell.configure(with: rate)
        return cell
    }
}
