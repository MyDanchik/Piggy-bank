import UIKit

final class ExchangeView: UIViewController {
    
    // MARK: - Properties
    
    private var viewModel = ExchangeViewModel()
    
    // MARK: - UI Elements
    
    private let titleLabel = UILabel()
    private let fetchButton = UIButton(type: .system)
    private let tableView = UITableView()
    private let lastUpdatedLabel = UILabel()
    
    // MARK: - Lifecycle Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(resource: .Colors.backgroundColorMain)
        navigationController?.navigationBar.isHidden = true
        addSubviews()
        configureConstraints()
        configureUI()
        setupTableView()
        fetchExchangeRates()
        startLoadingAnimation()
    }
    
    // MARK: - Private Methods
    
    private func addSubviews() {
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
    
    private func configureConstraints() {
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
    
    private func configureUI() {
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
                    dateFormatter.dateFormat = "yyyy-MM-dd HH:mm"
                    self?.lastUpdatedLabel.text = NSLocalizedString("App.ExchangeView.LastUpdatedLabel", comment: "") + "\(dateFormatter.string(from: Date()))"
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
    
    // MARK: - Actions
    
    @objc private func tapOnAddButton() {
        fetchExchangeRates()
        startLoadingAnimation()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        let alertController = UIAlertController(title: NSLocalizedString("App.ExchangeView.TapOnALertButton.Update", comment: ""),
                                                message: NSLocalizedString("App.ExchangeView.TapOnALertButton.Message", comment: "") + "\(dateFormatter.string(from: Date()))", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(okAction)
        present(alertController, animated: true, completion: nil)
    }
}

// MARK: - UITableViewDelegate, UITableViewDataSource

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
