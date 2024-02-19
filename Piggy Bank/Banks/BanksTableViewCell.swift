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
        customView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 27).isActive = true
        customView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -27).isActive = true
        customView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -15).isActive = true
        
        imageCard.translatesAutoresizingMaskIntoConstraints = false
        imageCard.centerYAnchor.constraint(equalTo: customView.centerYAnchor).isActive = true
        imageCard.centerXAnchor.constraint(equalTo: customView.centerXAnchor).isActive = true
        imageCard.heightAnchor.constraint(equalToConstant: 70).isActive = true
        imageCard.widthAnchor.constraint(equalToConstant: 70).isActive = true
        
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.topAnchor.constraint(equalTo: customView.topAnchor, constant: 30).isActive = true
        nameLabel.centerXAnchor.constraint(equalTo: customView.centerXAnchor).isActive = true
        
        priceLabel.translatesAutoresizingMaskIntoConstraints = false
        priceLabel.bottomAnchor.constraint(equalTo: customView.bottomAnchor, constant: -35).isActive = true
        priceLabel.centerXAnchor.constraint(equalTo: customView.centerXAnchor).isActive = true
    }
    
    private func setupUI() {
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
        priceLabel.font = UIFont(name: "Rubik-Regular", size: 18)
        
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
