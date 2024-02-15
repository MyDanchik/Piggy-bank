import UIKit

final class DefaultExchangeView: UIViewController {
    
    private let titleLabel = UILabel()
    private let addButton = UIButton()
    private let tableView = UITableView()
    private var exchangeRates: [ExchangeRate] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .backgroundColorMain
        setupSubviews()
        setupConstraints()
        setupUI()
        setupTableView()
        fetchExchangeRates()
        startLoadingAnimation()
    }
    
    private func setupSubviews() {
        view.addSubview(titleLabel)
        view.addSubview(addButton)
        view.addSubview(tableView)
    }
    
    private func setupTableView() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(ExchangeTableViewCell.self, forCellReuseIdentifier: "ExchangeTableViewCell")
        tableView.rowHeight = 150
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
        
        addButton.translatesAutoresizingMaskIntoConstraints = false
        addButton.centerYAnchor.constraint(equalTo: titleLabel.centerYAnchor).isActive = true
        addButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -26).isActive = true
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10).isActive = true
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }
    
    private func setupUI() {
        titleLabel.text = "Exchange Rate"
        titleLabel.textColor = .black
        titleLabel.font = UIFont(name: "Rubik-Medium", size: 24)
        
        addButton.tintColor = .black
        addButton.setImage(UIImage(systemName: "goforward"), for: .normal)
        let symbolConfiguration = UIImage.SymbolConfiguration(pointSize: 25)
        addButton.setPreferredSymbolConfiguration(symbolConfiguration, forImageIn: .normal)
        addButton.addTarget(self, action: #selector(tapOnAddButton), for: .touchUpInside)
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
