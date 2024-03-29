import UIKit

final class BanksView: UIViewController {
    
    var viewModel: BanksViewModel! {
        didSet {
            viewModel.transition = { [weak self] addBanksView in
                self?.navigationController?.pushViewController(addBanksView, animated: true)
                self?.navigationItem.backButtonTitle = ""
            }
            viewModel.setupBanks = { [weak self] banks in
                self?.banksList = banks
            }
        }
    }
    
    var banksList = [Bank]() {
        didSet {
            tableView.reloadData()
        }
    }
    
    private let titleLabel = UILabel()
    private let addButton = UIButton()
    private var tableView = UITableView()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(resource: .Colors.backgroundColorMain)
        navigationController?.navigationBar.isHidden = true
        setupSubviews()
        setupConstraints()
        setupUI()
        setupTableView()
        tableView.reloadData()
        viewModel = BanksViewModel()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        viewModel.loadBanks()
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
        addButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24).isActive = true
        addButton.heightAnchor.constraint(equalToConstant: 55).isActive = true
        addButton.widthAnchor.constraint(equalToConstant: 55).isActive = true
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 43).isActive = true
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }
    
    private func setupTableView() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(BanksTableViewCell.self, forCellReuseIdentifier: "BanksTableViewCell")
        tableView.rowHeight = 120
        tableView.separatorStyle = .none
        tableView.backgroundColor = .clear
    }
    
    private func setupUI() {
        titleLabel.text = "Your piggy banks"
        titleLabel.textColor = UIColor(resource: .Colors.colorText)
        titleLabel.font = UIFont(name: "Rubik-Medium", size: 24)
        
        addButton.tintColor = UIColor(resource: .Colors.colorText)
        addButton.setImage(UIImage(systemName: "plus"), for: .normal)
        let symbolConfiguration = UIImage.SymbolConfiguration(pointSize: 25)
        addButton.setPreferredSymbolConfiguration(symbolConfiguration, forImageIn: .normal)
        addButton.addTarget(self, action: #selector(self.transitionToAddBanksView), for: .touchUpInside)
        addButton.backgroundColor = UIColor(resource: .Colors.backgroundColorItem)
        addButton.layer.cornerRadius = 27.5
        addButton.layer.shadowColor = UIColor.black.cgColor
        addButton.layer.shadowOffset = CGSize(width: 0, height: 2)
        addButton.layer.shadowRadius = 5
        addButton.layer.shadowOpacity = 0.20
    }
    
    @objc func transitionToAddBanksView() {
        viewModel.transitionToAddBanksView()
        print("add")
    }
}
extension BanksView: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return banksList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "BanksTableViewCell", for: indexPath) as? BanksTableViewCell else {
            return UITableViewCell()
        }
        let banks = banksList[indexPath.row]
        cell.configureEntity(banks: banks)
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let bank = banksList[indexPath.row]
            let alertDelete = UIAlertController(title: NSLocalizedString("mainPage.alertDelete.message", comment: ""), message: "", preferredStyle: .alert)
            alertDelete.addAction(UIAlertAction(title: NSLocalizedString("mainPage.alertDelete.no", comment: ""), style: .default, handler: nil))
            alertDelete.addAction(UIAlertAction(title: NSLocalizedString("mainPage.alertDelete.yes", comment: ""), style: .destructive, handler: { _ in
                _ = CoreDataManager.instance.deleteBanks(bank)
                self.banksList.remove(at: indexPath.row)
                tableView.reloadData()
            }))
            present(alertDelete, animated: true)
        }
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let fullBanksView = ModifyBanksView()
        let banks = banksList[indexPath.row]
        fullBanksView.configureFullBanks(banks: banks)
        navigationController?.pushViewController(fullBanksView, animated: true)
    }
}
