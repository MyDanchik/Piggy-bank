import UIKit

final class BanksTableViewCell: UITableViewCell {
    // MARK: - UI Elements
    let customView = UIView()
    let nameLabel = UILabel()
    let priceLabel = UILabel()
    let imageCard = UIImageView()
    
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
    // MARK: - UI Setup
    
    private func setupSubviews() {
        contentView.addSubview(customView)
        customView.addSubview(nameLabel)
        customView.addSubview(priceLabel)
        customView.addSubview(imageCard)
    }
    
    private func setupConstraints() {
        customView.translatesAutoresizingMaskIntoConstraints = false
        customView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10).isActive = true
        customView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 24).isActive = true
        customView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -24).isActive = true
        customView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10).isActive = true
        
        imageCard.translatesAutoresizingMaskIntoConstraints = false
        imageCard.leadingAnchor.constraint(equalTo: customView.leadingAnchor, constant: 20).isActive = true
        imageCard.centerYAnchor.constraint(equalTo: customView.centerYAnchor).isActive = true
        imageCard.heightAnchor.constraint(equalToConstant: 70).isActive = true
        imageCard.widthAnchor.constraint(equalToConstant: 70).isActive = true
        
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.topAnchor.constraint(equalTo: customView.topAnchor, constant: 25).isActive = true
        nameLabel.leadingAnchor.constraint(equalTo: imageCard.trailingAnchor, constant: 15).isActive = true
        
        priceLabel.translatesAutoresizingMaskIntoConstraints = false
        priceLabel.bottomAnchor.constraint(equalTo: customView.bottomAnchor, constant: -25).isActive = true
        priceLabel.leadingAnchor.constraint(equalTo: imageCard.trailingAnchor, constant: 15).isActive = true
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
        nameLabel.font = UIFont(name: "Rubik-Medium", size: 20)
        
        priceLabel.textColor = UIColor(resource: .Colors.colorText)
        priceLabel.font = UIFont(name: "Rubik-Regular", size: 16)
        
        imageCard.layer.cornerRadius = 35
        imageCard.contentMode = .scaleAspectFill
        imageCard.clipsToBounds = true
    }
    
    // MARK: - Configuration
    func configureEntity(banks: Bank) {
        if let imageData = banks.imageBank, let bankImage = UIImage(data: imageData) {
            self.imageCard.image = bankImage
        } else {
            self.imageCard.image = UIImage(named: "default_image")
        }
        
        nameLabel.text = banks.nameBank
        priceLabel.text = "\(banks.priceBank ?? "") $"
    }
}
