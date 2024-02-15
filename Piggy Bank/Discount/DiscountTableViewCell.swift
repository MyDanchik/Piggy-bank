
import UIKit

final class DiscountTableViewCell: UITableViewCell {
    // MARK: - UI Elements
    let customView = UIView()
    let nameLabel = UILabel()
    let priceLabel = UILabel()
    let imageCard = UIImageView()
    
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
        setupConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupConstraints()
        setupUI()
    }
    
    // MARK: - UI Setup
    
    private func setupSubviews() {
        contentView.addSubview(customView)
        customView.addSubview(nameLabel)
        customView.addSubview(priceLabel)
        customView.addSubview(imageCard)
    }
    
    private func setupConstraints() {
        
        setupSubviews()
        
        customView.translatesAutoresizingMaskIntoConstraints = false
        customView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10).isActive = true
        customView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 27).isActive = true
        customView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -27).isActive = true
        customView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -15).isActive = true
        
        imageCard.translatesAutoresizingMaskIntoConstraints = false
        imageCard.bottomAnchor.constraint(equalTo: customView.bottomAnchor, constant: 0).isActive = true
        imageCard.trailingAnchor.constraint(equalTo: customView.trailingAnchor, constant: 0).isActive = true
        
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.topAnchor.constraint(equalTo: customView.topAnchor, constant: 30).isActive = true
        nameLabel.leadingAnchor.constraint(equalTo: customView.leadingAnchor, constant: 40).isActive = true
        
        priceLabel.translatesAutoresizingMaskIntoConstraints = false
        priceLabel.bottomAnchor.constraint(equalTo: customView.bottomAnchor, constant: -30).isActive = true
        priceLabel.leadingAnchor.constraint(equalTo: customView.leadingAnchor, constant: 40).isActive = true
    }
    
    private func setupUI() {
        contentView.layer.masksToBounds = true
        contentView.backgroundColor = .backgroundColorMain
        
        customView.layer.cornerRadius = 30
        customView.layer.shadowColor = UIColor.black.cgColor
        customView.layer.shadowOffset = CGSize(width: 0, height: 5)
        customView.layer.shadowRadius = 5
        customView.layer.shadowOpacity = 0.50
        
        nameLabel.textColor = .white
        nameLabel.font = UIFont(name: "Rubik-Regular", size: 25)
        
        priceLabel.textColor = .white
        priceLabel.font = UIFont(name: "Rubik-Regular", size: 18)
        
        imageCard.contentMode = .scaleAspectFill
        imageCard.clipsToBounds = true
        imageCard.image = UIImage(named: "Group1")
    }
    
    // MARK: - Configuration
    func configure(name: String, price: String, color: UIColor) {
        nameLabel.text = name
        priceLabel.text = price
        customView.backgroundColor = color
    }
}
