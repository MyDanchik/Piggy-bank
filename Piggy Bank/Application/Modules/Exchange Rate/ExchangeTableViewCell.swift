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
        addSubviews()
        setupConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupUI()
        addSubviews()
        setupConstraints()
    }
    
    func addSubviews() {
        contentView.addSubview(customView)
        customView.addSubview(nameLabel)
        customView.addSubview(priceLabel)
        customView.addSubview(imageFlag)
    }
    // MARK: - UI Setup
    private func setupConstraints() {
        customView.translatesAutoresizingMaskIntoConstraints = false
        customView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10).isActive = true
        customView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 24).isActive = true
        customView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -24).isActive = true
        customView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10).isActive = true
        
        imageFlag.translatesAutoresizingMaskIntoConstraints = false
        imageFlag.centerYAnchor.constraint(equalTo: customView.centerYAnchor).isActive = true
        imageFlag.leadingAnchor.constraint(equalTo: customView.leadingAnchor, constant: 15).isActive = true
        
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.centerYAnchor.constraint(equalTo: customView.centerYAnchor).isActive = true
        nameLabel.leadingAnchor.constraint(equalTo: imageFlag.trailingAnchor, constant: 17).isActive = true
        
        priceLabel.translatesAutoresizingMaskIntoConstraints = false
        priceLabel.centerYAnchor.constraint(equalTo: customView.centerYAnchor).isActive = true
        priceLabel.trailingAnchor.constraint(equalTo: customView.trailingAnchor, constant: -25).isActive = true
    }
    
    private func setupUI() {
        contentView.layer.masksToBounds = true
        contentView.backgroundColor = UIColor(resource: .Colors.backgroundColorMain)
        
        customView.layer.shadowColor = UIColor.black.cgColor
        customView.layer.shadowOffset = CGSize(width: 0, height: 2)
        customView.layer.shadowRadius = 5
        customView.layer.shadowOpacity = 0.20
        customView.layer.cornerRadius = 40
        customView.backgroundColor = UIColor(resource: .Colors.backgroundColorCell)
        
        nameLabel.textColor = UIColor(resource: .Colors.colorText)
        nameLabel.font = UIFont.rubik(ofSize: 20, style: .regular)
        
        priceLabel.textColor = UIColor(resource: .Colors.colorText)
        priceLabel.font = UIFont.rubik(ofSize: 20, style: .regular)
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
