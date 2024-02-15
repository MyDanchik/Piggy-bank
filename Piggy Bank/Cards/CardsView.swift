import UIKit

final class DefaultCardsView: UIViewController {
    
    private let titleLabel = UILabel()
    private let addButton = UIButton()
    private var tableView = UITableView()
    
    let cardNames = ["Card 1", "Card 2", "Card 3"]
    let cardPrices = ["12.000", "15.000", "18.000"]
    let cardColors: [UIColor] = [.card1, .card2, .card3]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .backgroundColorMain
        setupSubviews()
        setupConstraints()
        setupUI()
        setupTableView()
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
        tableView.register(CardsTableViewCell.self, forCellReuseIdentifier: "CardsTableViewCell")
        tableView.rowHeight = 260
        tableView.separatorStyle = .none
        tableView.backgroundColor = .clear
    }
    private func setupUI() {
        titleLabel.text = "Your cards"
        titleLabel.textColor = .black
        titleLabel.font = UIFont(name: "Rubik-Medium", size: 24)
        
        addButton.tintColor = .black
        addButton.setImage(UIImage(systemName: "plus.circle"), for: .normal)
        let symbolConfiguration = UIImage.SymbolConfiguration(pointSize: 25)
        addButton.setPreferredSymbolConfiguration(symbolConfiguration, forImageIn: .normal)
        addButton.addTarget(self, action: #selector(tapOnAddButton), for: .touchUpInside)
    }
    
    @objc func tapOnAddButton() {
        print("add")
    }
}

extension DefaultCardsView: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cardNames.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "CardsTableViewCell", for: indexPath) as? CardsTableViewCell else {
            return UITableViewCell()
        }
        guard indexPath.row < cardNames.count && indexPath.row < cardPrices.count && indexPath.row < cardColors.count else {
            return cell
        }
        cell.configure(name: cardNames[indexPath.row], price: cardPrices[indexPath.row], color: cardColors[indexPath.row])
        
        return cell
    }
    
}
