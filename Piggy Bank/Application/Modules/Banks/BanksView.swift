import UIKit

final class BanksView: UIViewController {
    
    // MARK: - Properties
    
    var viewModel: BanksViewModel! {
        didSet {
            viewModel.transition = { [weak self] addBanksView in
                self?.navigationController?.pushViewController(addBanksView, animated: true)
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
    
    // MARK: - UI Elements
    
    private let titleLabel = UILabel()
    private let addButton = UIButton(type: .system)
    private var tableView = UITableView()
    
    // MARK: - Lifecycle Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(resource: .Colors.backgroundColorMain)
        navigationController?.navigationBar.isHidden = true
        addSubviews()
        configureConstraints()
        configureUI()
        setupTableView()
        tableView.reloadData()
        viewModel = BanksViewModel()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        viewModel.loadBanks()
    }
    
    // MARK: - Private Methods
    
    private func addSubviews() {
        view.addSubview(titleLabel)
        view.addSubview(addButton)
        view.addSubview(tableView)
    }
    
    private func configureConstraints() {
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 80).isActive = true
        titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        addButton.translatesAutoresizingMaskIntoConstraints = false
        addButton.centerYAnchor.constraint(equalTo: titleLabel.centerYAnchor).isActive = true
        addButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24).isActive = true
        addButton.heightAnchor.constraint(equalToConstant: 55).isActive = true
        addButton.widthAnchor.constraint(equalToConstant: 55).isActive = true
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 45).isActive = true
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
    
    private func configureUI() {
        titleLabel.text = NSLocalizedString("App.BanksView.NavigationItemTitle", comment: "")
        titleLabel.textColor = UIColor(resource: .Colors.colorText)
        titleLabel.font = UIFont.rubik(ofSize: 24, style: .semiBold)
        
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
    
    // MARK: - Actions
    
    @objc private func transitionToAddBanksView() {
        viewModel.transitionToAddBanksView()
        print("add")
    }
}

    // MARK: - UITableViewDelegate, UITableViewDataSource

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
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let deleteAction = UIContextualAction(style: .destructive, title: "") { (_, _, completion) in
            let discount = self.banksList[indexPath.row]
            
            let alertDelete = UIAlertController(title: NSLocalizedString("App.BanksView.AlertDelete.Message", comment: ""), message: "", preferredStyle: .alert)
            alertDelete.addAction(UIAlertAction(title: NSLocalizedString("App.BanksView.AlertDelete.No", comment: ""), style: .default, handler: nil))
            alertDelete.addAction(UIAlertAction(title: NSLocalizedString("App.BanksView.AlertDelete.Yes", comment: ""), style: .destructive, handler: { _ in
                _ = CoreDataManager.instance.deleteBanks(discount)
                self.banksList.remove(at: indexPath.row)
                tableView.reloadData()
            }))
            self.present(alertDelete, animated: true)
            
            completion(true)
        }
        
        let originalImage = UIImage(resource: .Images.trash)
        let scaledImage = originalImage.resized(to: CGSize(width: 65, height: 65))
        
        deleteAction.backgroundColor = UIColor(resource: .Colors.backgroundColorMain)
        deleteAction.image = scaledImage
        
        let configuration = UISwipeActionsConfiguration(actions: [deleteAction])
        
        return configuration
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let fullBanksView = ModifyBanksView()
        let banks = banksList[indexPath.row]
        fullBanksView.configureFullBanks(banks: banks)
        navigationController?.pushViewController(fullBanksView, animated: true)
    }
}
