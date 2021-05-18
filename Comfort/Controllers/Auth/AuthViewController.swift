//
//  ViewController.swift
//  Comfort
//
//  Created by Ivan Kopiev on 07.05.2021.
//

import UIKit

class AuthViewController: UIViewController {

    @IBOutlet weak var mailTextfield: UITextField!
    @IBOutlet weak var passwordTextfield: UITextField!
    @IBOutlet weak var titleLabel: UILabel!
    let firebase = Firebase()
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Комфорт"
    }

    @IBAction func signIn(_ sender: Any) {
        if mailTextfield.text?.count != 0 && passwordTextfield.text?.count != 0 {
            guard let login = mailTextfield.text,
                  let pass = passwordTextfield.text else {return}
            if firebase.auth(login: login, password: pass) {
                performSegue(withIdentifier: "signIn", sender: self)
            } else {
                titleLabel.text = "Введите верные данные"
            }
        } else {
            titleLabel.text = "Заполните все поля"
        }
    }
    
    func animate(view: UIView) {
        
    }
    
}
