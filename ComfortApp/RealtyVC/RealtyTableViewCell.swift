//
//  RealtyTableViewCell.swift
//  ComfortApp
//
//  Created by Ivan Kopiev on 22.05.2021.
//

import UIKit

class RealtyTableViewCell: UITableViewCell {

    // MARK: - Properties
    
    // Цена
     let priceLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    // Адрес
    private let adressLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 2
        label.lineBreakMode = .byWordWrapping
        label.font = UIFont.systemFont(ofSize: 14)
        label.translatesAutoresizingMaskIntoConstraints = false

        return label
    }()
    // Тип недвижимости
    private let typeRealtyLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .right
        label.font = UIFont.systemFont(ofSize: 14)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    // Тип Аренда/продажа
    private let typeDealLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .right
        label.font = .boldSystemFont(ofSize: 15)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    // Изображение
    private let realtyImageView: UIImageView = {
        let iv = UIImageView()
        iv.clipsToBounds = true
        iv.layer.cornerRadius = 48 / 2
        iv.contentMode = .scaleAspectFill
        iv.backgroundColor = UIColor(red: 1.00, green: 0.42, blue: 0.42, alpha: 1.00)
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()
    
    // MARK: - Lifecycle
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        createUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

     // MARK: - Helpers
    
    func createUI() {
        addSubview(realtyImageView)
        addSubview(priceLabel)
        addSubview(adressLabel)
        addSubview(typeRealtyLabel)
        addSubview(typeDealLabel)
        createConstrains()
      
    }
    
    func configureCell(realty: Realty) {

        priceLabel.text = "\(realty.price) ₽"
        adressLabel.text = realty.adress
        realtyImageView.image = UIImage(named: realty.image)
        typeRealtyLabel.text = realty.typeRealty
        typeDealLabel.text = realty.rent ? "АРЕНДА" : "ПРОДАЖА"
        
    }
        
    func createConstrains() {

        NSLayoutConstraint.activate([
            // Image
            realtyImageView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            realtyImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
            realtyImageView.heightAnchor.constraint(equalToConstant: 80),
            realtyImageView.widthAnchor.constraint(equalToConstant: 80),
            
            // Price label
            priceLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 10),
            priceLabel.leadingAnchor.constraint(equalTo: realtyImageView.trailingAnchor, constant: 10),
            priceLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10),
            priceLabel.heightAnchor.constraint(equalToConstant: 15),
            // Adress label
            adressLabel.topAnchor.constraint(equalTo: priceLabel.bottomAnchor, constant: 10),
            adressLabel.leadingAnchor.constraint(equalTo: priceLabel.leadingAnchor),
            adressLabel.trailingAnchor.constraint(equalTo: priceLabel.trailingAnchor),
            adressLabel.heightAnchor.constraint(lessThanOrEqualToConstant: 40),
            // Type realty label
            typeRealtyLabel.topAnchor.constraint(equalTo: adressLabel.bottomAnchor, constant: 10),
            typeRealtyLabel.leadingAnchor.constraint(equalTo: priceLabel.leadingAnchor),
            typeRealtyLabel.trailingAnchor.constraint(equalTo: priceLabel.trailingAnchor),
            typeRealtyLabel.heightAnchor.constraint(equalToConstant: 15),
            // Type deal label
            typeDealLabel.topAnchor.constraint(equalTo: typeRealtyLabel.bottomAnchor, constant: 10),
            typeDealLabel.leadingAnchor.constraint(equalTo: priceLabel.leadingAnchor),
            typeDealLabel.trailingAnchor.constraint(equalTo: priceLabel.trailingAnchor),
            typeDealLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -10),
            typeDealLabel.heightAnchor.constraint(equalToConstant: 15)

            
        ])
    
    }
}

