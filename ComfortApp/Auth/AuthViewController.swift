//
//  AuthViewController.swift
//  ComfortApp
//
//  Created by Ivan Kopiev on 22.05.2021.
//

import UIKit

class AuthViewController: UIViewController {
    
    // MARK: - Properties
    
    lazy var loginTextfield: UITextField = {
        let textfield = UITextField()
        textfield.font = .systemFont(ofSize: 16)
        textfield.clearButtonMode = .whileEditing
        textfield.placeholder = "Логин или почта"
        textfield.translatesAutoresizingMaskIntoConstraints = false
        textfield.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 5, height: 20))
        textfield.leftViewMode = .always
        textfield.accessibilityIdentifier = "Login"
        textfield.backgroundColor = .white
        textfield.layer.cornerRadius = 10
        textfield.autocorrectionType = .no
        textfield.keyboardType = .emailAddress
        textfield.returnKeyType = .next
        return textfield
    }()
    
    lazy var passTextfield: UITextField = {
        let textfield = UITextField()
        textfield.font = .systemFont(ofSize: 16)
        textfield.placeholder = "Пароль"
        textfield.clearButtonMode = .whileEditing
        textfield.translatesAutoresizingMaskIntoConstraints = false
        textfield.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 5, height: 20))
        textfield.leftViewMode = .always
        textfield.accessibilityIdentifier = "Password"
        textfield.returnKeyType = .done
        textfield.layer.cornerRadius = 10
        textfield.isSecureTextEntry = true
        textfield.autocorrectionType = .no
        textfield.backgroundColor = .white

        return textfield
    }()
    
    lazy var sighInButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = #colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1)
        button.layer.cornerRadius = 15
        button.setTitleColor(.white, for: .normal)
        button.setTitleColor(.lightGray, for: .highlighted)
        button.titleLabel?.font = .boldSystemFont(ofSize: 15)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Войти", for: .normal)
        button.addTarget(self, action: #selector(sighIn), for: .touchUpInside)
        return button
    }()
    
     let mainLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 30)
        label.text = "Авторизация\nКомфорт"
        label.textAlignment = .center
        label.numberOfLines = 2
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUp()
    }
    
    
    func setUp() {
        view.addSubview(loginTextfield)
        view.addSubview(passTextfield)
        view.addSubview(sighInButton)
        view.addSubview(mainLabel)
        createConstrains()
        view.backgroundColor = #colorLiteral(red: 0.1411764771, green: 0.3960784376, blue: 0.5647059083, alpha: 1)
        loginTextfield.becomeFirstResponder()
        let keyboardDismissTapGesture = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard(sender:)))
        keyboardDismissTapGesture.cancelsTouchesInView = false
        view.addGestureRecognizer(keyboardDismissTapGesture)
    }
    
    
    func createConstrains(){
        NSLayoutConstraint.activate([
            mainLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 40),
            mainLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            mainLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40),
            mainLabel.heightAnchor.constraint(lessThanOrEqualToConstant: 100),
            
            loginTextfield.topAnchor.constraint(equalTo: mainLabel.bottomAnchor, constant: 40),
            loginTextfield.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            loginTextfield.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40),
            loginTextfield.heightAnchor.constraint(equalToConstant: 35),
            
            passTextfield.topAnchor.constraint(equalTo: loginTextfield.bottomAnchor, constant: 40),
            passTextfield.leadingAnchor.constraint(equalTo: loginTextfield.leadingAnchor),
            passTextfield.trailingAnchor.constraint(equalTo: loginTextfield.trailingAnchor),
            passTextfield.heightAnchor.constraint(equalTo: loginTextfield.heightAnchor),
            
            sighInButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -60),
            sighInButton.leadingAnchor.constraint(equalTo: loginTextfield.leadingAnchor),
            sighInButton.trailingAnchor.constraint(equalTo: loginTextfield.trailingAnchor),
            sighInButton.heightAnchor.constraint(equalToConstant: 60)
        ])
    }
    private func animateView(_ viewToAnimate: UIView) {
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.2, initialSpringVelocity: 0.5, options: .curveEaseIn) {
            viewToAnimate.transform = CGAffineTransform(scaleX: 0.8, y: 0.8)
        }
        UIView.animate(withDuration: 0.3, delay: 0, usingSpringWithDamping: 0.4, initialSpringVelocity: 1, options: .curveEaseIn) {
            viewToAnimate.transform = .identity
            
        }
    }
    
    @objc func dismissKeyboard(sender: UITapGestureRecognizer) {
        view.endEditing(true)
    }
    
    fileprivate func goToApp() {
        let realtyViewController = RealtyViewController()
        let clientViewController = ClientsViewController()
        
        //nav
        let realtyNavigation = UINavigationController(rootViewController: realtyViewController)
        let clientNavigation = UINavigationController(rootViewController: clientViewController)
        clientViewController.tabBarItem = UITabBarItem(title: "Клиенты", image: UIImage(systemName: "rectangle.stack.person.crop.fill"), tag: 1)
        realtyViewController.tabBarItem = UITabBarItem(title: "Недвижимость", image: UIImage(systemName: "house.fill"), tag: 0)
        
        let tabBar = UITabBarController()
        tabBar.setViewControllers([realtyNavigation,clientNavigation], animated: true)
        tabBar.modalPresentationStyle = .fullScreen
        present(tabBar, animated: true)
    }
    
    @objc func sighIn(){
        let firebase = Firebase()
        if loginTextfield.text?.count != 0 && passTextfield.text?.count != 0 {
            guard let login = loginTextfield.text,
                  let pass = passTextfield.text else {return}
            if firebase.auth(login: login, password: pass) {
                goToApp() // Переходим на главный экран
            } else {
                animateView(mainLabel)
                mainLabel.text = "Введите верные данные"
            }
        } else {
            animateView(mainLabel)
            mainLabel.text = "Заполните все поля"
        }
    }
}



