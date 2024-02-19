import UIKit

final class ExchangeTableViewCell: UITableViewCell {
    // MARK: - UI Elements
    private let customView = UIView()
    private let nameLabel = UILabel()
    private let priceLabel = UILabel()
    private let imageFlag = UIImageView()
    
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
        customView.addSubview(imageFlag)
        
        customView.translatesAutoresizingMaskIntoConstraints = false
        customView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10).isActive = true
        customView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 27).isActive = true
        customView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -27).isActive = true
        customView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -15).isActive = true
        
        
        imageFlag.translatesAutoresizingMaskIntoConstraints = false
        imageFlag.centerYAnchor.constraint(equalTo: customView.centerYAnchor).isActive = true
        imageFlag.leadingAnchor.constraint(equalTo: customView.leadingAnchor, constant: 25).isActive = true
        
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.centerYAnchor.constraint(equalTo: customView.centerYAnchor).isActive = true
        nameLabel.leadingAnchor.constraint(equalTo: imageFlag.trailingAnchor, constant: 17).isActive = true
        
        priceLabel.translatesAutoresizingMaskIntoConstraints = false
        priceLabel.centerYAnchor.constraint(equalTo: customView.centerYAnchor).isActive = true
        priceLabel.trailingAnchor.constraint(equalTo: customView.trailingAnchor, constant: -25).isActive = true
        
        contentView.layer.masksToBounds = true
        contentView.backgroundColor = .backgroundColorMain
        
        customView.layer.shadowColor = UIColor.black.cgColor
        customView.layer.shadowOffset = CGSize(width: 0, height: 5)
        customView.layer.shadowRadius = 6
        customView.layer.shadowOpacity = 0.20
        customView.layer.borderWidth = 2.0
        customView.layer.borderColor = UIColor.purple.cgColor
        customView.layer.cornerRadius = 30
        customView.backgroundColor = .backgroundColorMain
        
        nameLabel.textColor = .black
        nameLabel.font = UIFont(name: "Rubik-Regular", size: 25)
        
        priceLabel.textColor = .black
        priceLabel.font = UIFont(name: "Rubik-Regular", size: 25)
    }
    
    // MARK: - Configuration
    
    func configure(with rate: ExchangeRate) {
        nameLabel.text = rate.abbreviation
        priceLabel.text = String(format: "%.2f" + " BYN", rate.rate)
        
        if let currencyImage = UIImage(named: rate.abbreviation) {
            imageFlag.image = currencyImage
        } else {
            imageFlag.image = UIImage(named: "USD")
        }
    }
}
