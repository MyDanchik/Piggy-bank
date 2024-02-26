import UIKit

final class DefaultDiscountView: UIViewController {
    
    
    var viewModel: DefaultDiscountViewModel! {
        didSet {
            viewModel.transition = { [weak self] addDiscountView in
                self?.navigationController?.pushViewController(addDiscountView, animated: true)
                self?.navigationItem.backButtonTitle = ""
            }
            viewModel.setupDiscounts = { [weak self] discounts in
                self?.discountsList = discounts
            }
        }
    }
    
    var discountsList = [Discount]() {
        didSet {
            tableView.reloadData()
        }
    }
    
    private let titleLabel = UILabel()
    private let addButton = UIButton()
    private var tableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .backgroundColorMain
        setupSubviews()
        setupConstraints()
        setupUI()
        setupTableView()
        tableView.reloadData()
        viewModel = DefaultDiscountViewModel()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        viewModel.loadDiscounts()
        
        
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
        tableView.register(DiscountTableViewCell.self, forCellReuseIdentifier: "DiscountTableViewCell")
        tableView.rowHeight = 260
        tableView.separatorStyle = .none
        tableView.backgroundColor = .clear
    }
    
    private func setupUI() {
        titleLabel.text = "Your discount"
        titleLabel.textColor = .black
        titleLabel.font = UIFont(name: "Rubik-Medium", size: 24)
        
        addButton.tintColor = .black
        addButton.setImage(UIImage(systemName: "plus.circle"), for: .normal)
        let symbolConfiguration = UIImage.SymbolConfiguration(pointSize: 25)
        addButton.setPreferredSymbolConfiguration(symbolConfiguration, forImageIn: .normal)
        addButton.addTarget(self, action: #selector(self.transitionToAddDiscountView), for: .touchUpInside)
    }
    @objc func transitionToAddDiscountView() {
        viewModel.transitionToAddDiscountView()
        print("add")
    }
}


extension DefaultDiscountView: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return discountsList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "DiscountTableViewCell", for: indexPath) as? DiscountTableViewCell else {
            return UITableViewCell()
        }
        let discounts = discountsList[indexPath.row]
        cell.configureEntity(discounts: discounts)
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let discount = discountsList[indexPath.row]
            let alertDelete = UIAlertController(title: NSLocalizedString("mainPage.alertDelete.message", comment: ""), message: "", preferredStyle: .alert)
            alertDelete.addAction(UIAlertAction(title: NSLocalizedString("mainPage.alertDelete.no", comment: ""), style: .default, handler: nil))
            alertDelete.addAction(UIAlertAction(title: NSLocalizedString("mainPage.alertDelete.yes", comment: ""), style: .destructive, handler: { _ in
                _ = CoreDataManager.instance.deleteDiscounts(discount)
                self.discountsList.remove(at: indexPath.row) // Удаляем объект из массива
                tableView.reloadData() // Обновляем таблицу
            }))
            present(alertDelete, animated: true)
        }
    }
    
}
