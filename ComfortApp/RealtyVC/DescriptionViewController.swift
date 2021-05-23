//
//  DescriptionViewController.swift
//  ComfortApp
//
//  Created by Ivan Kopiev on 22.05.2021.
//

import UIKit

class DescriptionViewController: UIViewController {

    // MARK: - Properties
        
    // Цена
     let priceLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 25)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center

        return label
    }()
    
    // Адрес
    private let adressLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.numberOfLines = 2
        label.lineBreakMode = .byWordWrapping
        label.font = UIFont.systemFont(ofSize: 14)
        label.translatesAutoresizingMaskIntoConstraints = false

        return label
    }()
    
    // Тип недвижимости
    private let typeRealtyLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 14)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    // Тип Аренда/продажа
    private let typeDealLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 14)
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
    private let descriptionTextView: UITextView = {
        let textView = UITextView()
        textView.backgroundColor = .clear
        textView.font = .systemFont(ofSize: 16)
        textView.isScrollEnabled = true
        textView.isEditable = false
        textView.text = "Test teste test"
        textView.textColor = .black
        textView.translatesAutoresizingMaskIntoConstraints = false
        return textView
    }()


    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(realtyImageView)
        view.addSubview(priceLabel)
        view.addSubview(adressLabel)
        view.addSubview(typeDealLabel)
        view.addSubview(typeRealtyLabel)
        view.addSubview(descriptionTextView)
        createConstrains()
//        configure(realty: Realty(price: 28000, numberOfRooms: 1, square: 35, image: "rent", adress: "Москва, Бескудниковский б-р, 48к4", rent: true, typeRealty: "Квартира", description: "Он добавил, что по площади город Starbase будет значительно превышать населённый пункт Бока-Чика, где располагается частный космодром компании SpaceX. Также он ответил, что добавил, что к собакам в городе будет очень хорошее отношение."))
        
    }
    
    func configure(realty: Realty) {
        priceLabel.text = "\(realty.price) ₽"
        adressLabel.text = realty.adress
        realtyImageView.image = UIImage(named: realty.image)
        typeRealtyLabel.text = realty.typeRealty
        typeDealLabel.text = realty.rent ? "АРЕНДА" : "ПРОДАЖА"
        descriptionTextView.text = realty.description ?? "Без описания"
    }
    
    func createConstrains() {

        NSLayoutConstraint.activate([
            // Image
            realtyImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 50),
            realtyImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            realtyImageView.heightAnchor.constraint(equalToConstant: view.frame.width - 100),
            realtyImageView.widthAnchor.constraint(equalTo: realtyImageView.heightAnchor),
            
            // Type realty label
            typeRealtyLabel.topAnchor.constraint(equalTo: realtyImageView.bottomAnchor, constant: 10),
            typeRealtyLabel.leadingAnchor.constraint(equalTo: realtyImageView.leadingAnchor),
            typeRealtyLabel.trailingAnchor.constraint(equalTo: realtyImageView.trailingAnchor),
            typeRealtyLabel.heightAnchor.constraint(equalToConstant: 20),
            
            // Price label
            priceLabel.topAnchor.constraint(equalTo: typeRealtyLabel.bottomAnchor, constant: 10),
            priceLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            priceLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            priceLabel.heightAnchor.constraint(equalToConstant: 20),
            // Adress label
            adressLabel.topAnchor.constraint(equalTo: priceLabel.bottomAnchor, constant: 10),
            adressLabel.leadingAnchor.constraint(equalTo: priceLabel.leadingAnchor),
            adressLabel.trailingAnchor.constraint(equalTo: priceLabel.trailingAnchor),
            adressLabel.heightAnchor.constraint(lessThanOrEqualToConstant: 40),
            // Type deal label
            typeDealLabel.topAnchor.constraint(equalTo: adressLabel.bottomAnchor, constant: 10),
            typeDealLabel.leadingAnchor.constraint(equalTo: priceLabel.leadingAnchor),
            typeDealLabel.trailingAnchor.constraint(equalTo: priceLabel.trailingAnchor),
            typeDealLabel.heightAnchor.constraint(equalToConstant: 20),

            
            descriptionTextView.topAnchor.constraint(equalTo: typeDealLabel.bottomAnchor, constant: 10),
            descriptionTextView.leadingAnchor.constraint(equalTo: priceLabel.leadingAnchor),
            descriptionTextView.trailingAnchor.constraint(equalTo: priceLabel.trailingAnchor),
            descriptionTextView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -10),

            
        ])
    
    }
}
