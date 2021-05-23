//
//  ClientCell.swift
//  ComfortApp
//
//  Created by Ivan Kopiev on 22.05.2021.
//

import UIKit

class ClientCell: UITableViewCell {

  
    // MARK: - Properties
    
    // ФИО
     let nameLabel: UILabel = {
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
        label.font = UIFont.systemFont(ofSize: 14)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    // Тип Аренда/продажа
    private let phoneLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: 14)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
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
        addSubview(nameLabel)
        addSubview(adressLabel)
        addSubview(typeRealtyLabel)
        addSubview(typeDealLabel)
        addSubview(phoneLabel)
        createConstrains()
      
    }
    
    func configureCell(client: Client) {
        
        
        nameLabel.text = client.name
        adressLabel.text = client.adress
        typeRealtyLabel.text = client.realtyType
        typeDealLabel.text = client.dealType
        phoneLabel.text = client.phone
        
    }
        
    func createConstrains() {

        NSLayoutConstraint.activate([
            
            // Name label
            nameLabel.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            nameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            nameLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            nameLabel.heightAnchor.constraint(equalToConstant: 15),
            // Adress label
            adressLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 10),
            adressLabel.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor),
            adressLabel.trailingAnchor.constraint(equalTo: nameLabel.trailingAnchor),
            adressLabel.heightAnchor.constraint(lessThanOrEqualToConstant: 40),
            // Type realty label
            typeRealtyLabel.topAnchor.constraint(equalTo: nameLabel.topAnchor),
            typeRealtyLabel.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor),
            typeRealtyLabel.trailingAnchor.constraint(equalTo: nameLabel.trailingAnchor),
            typeRealtyLabel.heightAnchor.constraint(equalToConstant: 15),
            // Type deal label
            typeDealLabel.topAnchor.constraint(equalTo: phoneLabel.topAnchor),
            typeDealLabel.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor),
            typeDealLabel.trailingAnchor.constraint(equalTo: nameLabel.trailingAnchor),
            typeDealLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10),
            typeDealLabel.heightAnchor.constraint(equalToConstant: 15),
            // Type deal label
            phoneLabel.topAnchor.constraint(equalTo: adressLabel.bottomAnchor, constant: 10),
            phoneLabel.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor),
            phoneLabel.trailingAnchor.constraint(equalTo: nameLabel.trailingAnchor),
            phoneLabel.heightAnchor.constraint(equalToConstant: 15)
            
        ])
    
    }
}

