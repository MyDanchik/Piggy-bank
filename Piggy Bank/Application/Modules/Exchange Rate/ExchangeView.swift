import UIKit

final class ExchangeView: UIViewController {
    
    private var viewModel = ExchangeViewModel()
    
    private let titleLabel = UILabel()
    private let fetchButton = UIButton()
    private let tableView = UITableView()
    private let lastUpdatedLabel = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(resource: .Colors.backgroundColorMain)
        navigationController?.navigationBar.isHidden = true
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
        titleLabel.text = NSLocalizedString("App.ExchangeView.NavigationItemTitle", comment: "")
        titleLabel.textColor = UIColor(resource: .Colors.colorText)
        titleLabel.font = UIFont.rubik(ofSize: 24, style: .semiBold)
        
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
        lastUpdatedLabel.font = UIFont.rubik(ofSize: 14, style: .light)
    }
    
    private func fetchExchangeRates() {
        viewModel.fetchExchangeRates { [weak self] rates in
            if rates != nil {
                DispatchQueue.main.async {
                    self?.tableView.reloadData()
                    self?.stopLoadingAnimation()
                    let dateFormatter = DateFormatter()
                    dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
                    self?.lastUpdatedLabel.text = "Last updated: \(dateFormatter.string(from: Date()))"
                }
            }
        }
    }
    
    private func startLoadingAnimation() {
        let activityIndicator = UIActivityIndicatorView(style: .large)
        activityIndicator.color = .black
        activityIndicator.center = view.center
        activityIndicator.startAnimating()
        view.addSubview(activityIndicator)
    }
    
    private func stopLoadingAnimation() {
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
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        let alertController = UIAlertController(title: "Обновлено", message: "время \(dateFormatter.string(from: Date()))", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(okAction)
        present(alertController, animated: true, completion: nil)
    }
}

extension ExchangeView: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.exchangeRates.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ExchangeTableViewCell", for: indexPath) as? ExchangeTableViewCell else {
            return UITableViewCell()
        }
        
        let rate = viewModel.exchangeRates[indexPath.row]
        cell.configure(with: rate)
        return cell
    }
}
