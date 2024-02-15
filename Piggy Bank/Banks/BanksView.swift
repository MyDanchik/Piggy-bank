import UIKit

final class DefaultBanksView: UIViewController {
    
    var viewModel: DefaultBanksViewModel! {
        didSet {
            viewModel.transition = { [weak self] addBanksView in
                self?.navigationController?.pushViewController(addBanksView, animated: true)
                self?.navigationItem.backButtonTitle = ""
            }
        }
    }
    
    private let titleLabel = UILabel()
    private let addButton = UIButton()
    private var tableView = UITableView()
    
    let cardNames = ["Piggy Banks 1", "Piggy Banks 2", "Piggy Banks 3"]
    let cardPrices = ["12.000", "15.000", "18.000"]
    let cardColors: [UIColor] = [.card3, .card2, .card1]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .backgroundColorMain
        setupSubviews()
        setupConstraints()
        setupUI()
        setupTableView()
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        viewModel = DefaultBanksViewModel()
    }
    private func setupSubviews() {
        view.addSubview(titleLabel)
        view.addSubview(addButton)
        view.addSubview(tableView)
        
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
    
    private func setupTableView() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(BanksTableViewCell.self, forCellReuseIdentifier: "BanksTableViewCell")
        tableView.rowHeight = 260
        tableView.separatorStyle = .none
        tableView.backgroundColor = .clear
    }
    
    private func setupUI() {
        
        
        titleLabel.text = "Your piggy banks"
        titleLabel.textColor = .black
        titleLabel.font = UIFont(name: "Rubik-Medium", size: 24)
        
        addButton.tintColor = .black
        addButton.setImage(UIImage(systemName: "plus.circle"), for: .normal)
        let symbolConfiguration = UIImage.SymbolConfiguration(pointSize: 25)
        addButton.setPreferredSymbolConfiguration(symbolConfiguration, forImageIn: .normal)
        addButton.addTarget(self, action: #selector(self.transitionToAddBanksView), for: .touchUpInside)
    }
    
    
    @objc func transitionToAddBanksView() {
        viewModel.transitionToAddBanksView()
        print("add")
    }
    
}

extension DefaultBanksView: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cardNames.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "BanksTableViewCell", for: indexPath) as? BanksTableViewCell else {
            return UITableViewCell()
        }
        guard indexPath.row < cardNames.count && indexPath.row < cardPrices.count && indexPath.row < cardColors.count else {
            return cell
        }
        cell.configure(name: cardNames[indexPath.row], price: cardPrices[indexPath.row], color: cardColors[indexPath.row])
        
        return cell
    }
    
}
