
import UIKit

final class DiscountTableViewCell: UITableViewCell {
    
    // MARK: - UI Elements
    
    let customView = UIView()
    let nameLabel = UILabel()
    let imageCard = UIImageView()
    
    // MARK: - Initializers
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
        setupSubviews()
        setupConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupUI()
        setupSubviews()
        setupConstraints()
    }
    
    // MARK: - Private Methods
    
    private func setupSubviews() {
        contentView.addSubview(customView)
        customView.addSubview(nameLabel)
        customView.addSubview(imageCard)
    }
    
    private func setupConstraints() {
        customView.translatesAutoresizingMaskIntoConstraints = false
        customView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10).isActive = true
        customView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 27).isActive = true
        customView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -27).isActive = true
        customView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10).isActive = true
        
        imageCard.translatesAutoresizingMaskIntoConstraints = false
        imageCard.centerYAnchor.constraint(equalTo: customView.centerYAnchor).isActive = true
        imageCard.trailingAnchor.constraint(equalTo: customView.trailingAnchor, constant: -30).isActive = true
        
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.centerYAnchor.constraint(equalTo: customView.centerYAnchor).isActive = true
        nameLabel.leadingAnchor.constraint(equalTo: customView.leadingAnchor, constant: 30).isActive = true
    }
    
    private func setupUI() {
        contentView.layer.masksToBounds = true
        contentView.backgroundColor = UIColor(resource: .Colors.backgroundColorMain)
        
        customView.layer.shadowColor = UIColor.black.cgColor
        customView.layer.shadowOffset = CGSize(width: 0, height: 2)
        customView.layer.shadowRadius = 5
        customView.layer.shadowOpacity = 0.20
        customView.layer.cornerRadius = 50
        customView.backgroundColor = UIColor(resource: .Colors.backgroundColorCell)
        
        nameLabel.textColor = UIColor(resource: .Colors.colorText)
        nameLabel.font = UIFont.rubik(ofSize: 20, style: .medium)
        
        imageCard.contentMode = .scaleAspectFill
        imageCard.clipsToBounds = true
        imageCard.image = UIImage(named: "DiscountStart")
    }
    
    // MARK: - Configuration
    
    func configureEntity(discounts: Discount) {
        nameLabel.text = discounts.nameDiscount
    }
}
