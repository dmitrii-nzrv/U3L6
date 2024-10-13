//
//  ViewController.swift
//  lesson6
//
//  Created by Dmitrii Nazarov on 13.10.2024.
//

import UIKit
import KeychainSwift

class RegistrationViewController: UIViewController {
    // MARK: UI
    lazy var registrationLabel: UILabel = createLabel(text: "Регистрация")
    
    lazy var emailTextField = createTextField(placeholder: "Email", isSecure: false)
    lazy var passwordTextField = createTextField(placeholder: "Password", isSecure: false)
    lazy var nameTextField = createTextField(placeholder: "Name", isSecure: false)
    lazy var surnameTextField = createTextField(placeholder: "Surname", isSecure: false)
    lazy var registerBtn: UIButton = createBtn(title: "Регистрация", BGColor: .black, textColor: .white, target: self, action: #selector(regBtnTapped))
    lazy var accountBtn: UIButton = createBtn(title: "есть аккаунт", BGColor: .white, textColor: .black, target: self, action: #selector(accBtnTapped))
    
    // MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
    
        setupUI()
    }

    @objc func regBtnTapped() {
        
        let email = emailTextField.text ?? ""
        let name = nameTextField.text ?? ""
        let surname = surnameTextField.text ?? ""
        let password = passwordTextField.text ?? ""
        
        if email != "" && name != "" && surname != "" && password != "" {
            UserDefaults.standard.set(email, forKey: "email")
            UserDefaults.standard.set(name, forKey: "name")
            UserDefaults.standard.set(surname, forKey: "surname")
                   
            
            let keychain = KeychainSwift()
            keychain.set(password, forKey: "pw")
           
            UserDefaults.standard.set(true, forKey: "isLogin")
            
            NotificationCenter.default.post(name: NSNotification.Name("SwitchToSecondViewController"), object: nil)
        } else {
            print("error")
        }
        
      
        
      
               
        
        
    }
    
    @objc func accBtnTapped() {
        NotificationCenter.default.post(name: NSNotification.Name("SwitchToAutorisation"), object: nil)
    }
    // MARK: Private methods
    private func setupUI() {
        addSubviews([registrationLabel, emailTextField,passwordTextField, nameTextField, surnameTextField, registerBtn, accountBtn], to: view)
        
        setupConstraints()
    }

    private func setupConstraints() {
        NSLayoutConstraint.activate([
            registrationLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50),
            registrationLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            
            emailTextField.topAnchor.constraint(equalTo: registrationLabel.bottomAnchor, constant: 40),
            emailTextField.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            emailTextField.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            
            passwordTextField.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 15),
            passwordTextField.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            passwordTextField.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            
            nameTextField.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 40),
            nameTextField.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            nameTextField.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            
            surnameTextField.topAnchor.constraint(equalTo: nameTextField.bottomAnchor, constant: 15),
            surnameTextField.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            surnameTextField.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            
            registerBtn.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -150),
            registerBtn.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            registerBtn.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            
            accountBtn.topAnchor.constraint(equalTo: registerBtn.bottomAnchor, constant: 10),
            accountBtn.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            accountBtn.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            ])
    }
}

