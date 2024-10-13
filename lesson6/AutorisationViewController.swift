//
//  Autorisation.swift
//  lesson6
//
//  Created by Dmitrii Nazarov on 13.10.2024.
//

import UIKit
import KeychainSwift
class AutorisationViewController: UIViewController {
    
    lazy var autorisationLabel: UILabel = createLabel(text: "Авторизация")
    lazy var emailTextField = createTextField(placeholder: "Email", isSecure: false)
    lazy var passwordTextField = createTextField(placeholder: "Password", isSecure: true)
    
    lazy var registerBtn: UIButton = createBtn(title: "Войти", BGColor: .black, textColor: .white, target: self, action: #selector(regBtnTapped))
    lazy var accountBtn: UIButton = createBtn(title: "нет аккаунта", BGColor: .white, textColor: .black, target: self, action: #selector(accBtnTapped))
    
    // MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
    
        setupUI()
    }
    
    @objc func regBtnTapped() {
        let email = emailTextField.text ?? ""
        let password = passwordTextField.text ?? ""
        let keychain = KeychainSwift()
        //keychain.set(password, forKey: "pw")
        if email == UserDefaults.standard.string(forKey: "email") && password == keychain.get("pw") {
            NotificationCenter.default.post(name: NSNotification.Name("SwitchToSecondViewController"), object: nil)
        } else {
            print("wrong password or email")
        }
    }
    
    @objc func accBtnTapped() {
        NotificationCenter.default.post(name: NSNotification.Name("SwitchBack"), object: nil)
    }

    // MARK: Private methods
    private func setupUI() {
        addSubviews([autorisationLabel, emailTextField,passwordTextField, registerBtn, accountBtn], to: view)
        
        setupConstraints()
    }

    private func setupConstraints() {
        NSLayoutConstraint.activate([
            autorisationLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 60),
            autorisationLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            
            emailTextField.topAnchor.constraint(equalTo: autorisationLabel.bottomAnchor, constant: 40),
            emailTextField.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            emailTextField.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            
            passwordTextField.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 15),
            passwordTextField.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            passwordTextField.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            
            registerBtn.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -150),
            registerBtn.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            registerBtn.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            
            accountBtn.topAnchor.constraint(equalTo: registerBtn.bottomAnchor, constant: 10),
            accountBtn.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            accountBtn.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            ])
    }
}
