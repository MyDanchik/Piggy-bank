import UIKit

final class ExchangeTableViewCell: UITableViewCell {
    // MARK: - UI Elements
    let customView = UIView()
    let nameLabel = UILabel()
    let priceLabel = UILabel()
    
    // MARK: - Initialization
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    // MARK: - UI Setup
    private func setupConstraints() {
        
    }
    private func setupUI() {
        contentView.addSubview(customView)
        customView.addSubview(nameLabel)
        customView.addSubview(priceLabel)
        
        customView.translatesAutoresizingMaskIntoConstraints = false
        customView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10).isActive = true
        customView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 27).isActive = true
        customView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -27).isActive = true
        customView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -15).isActive = true
        
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.centerYAnchor.constraint(equalTo: customView.centerYAnchor).isActive = true
        nameLabel.leadingAnchor.constraint(equalTo: customView.leadingAnchor, constant: 16).isActive = true
        
        priceLabel.translatesAutoresizingMaskIntoConstraints = false
        priceLabel.centerYAnchor.constraint(equalTo: customView.centerYAnchor).isActive = true
        priceLabel.trailingAnchor.constraint(equalTo: customView.trailingAnchor, constant: -16).isActive = true
        
        contentView.layer.masksToBounds = true
        contentView.backgroundColor = .backgroundColorMain
        
        customView.backgroundColor = .card1
        customView.layer.cornerRadius = 30
        customView.layer.shadowColor = UIColor.black.cgColor
        customView.layer.shadowOffset = CGSize(width: 0, height: 5)
        customView.layer.shadowRadius = 5
        customView.layer.shadowOpacity = 0.50
        
        nameLabel.textColor = .white
        nameLabel.font = UIFont(name: "Rubik-Regular", size: 25)
        
        priceLabel.textColor = .white
        priceLabel.font = UIFont(name: "Rubik-Regular", size: 25)
    }
    
    // MARK: - Configuration
    
    func configure(with rate: ExchangeRate) {
        nameLabel.text = rate.abbreviation
        priceLabel.text = String(format: "%.2f" + " BYN", rate.rate)
    }
}
