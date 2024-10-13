//
//  FinalViewController.swift
//  lesson6
//
//  Created by Dmitrii Nazarov on 13.10.2024.
//

import UIKit

class FinalViewController: UIViewController {
    lazy var nameLabel: UILabel = createLabel(text: "Имя Фамилия")
    lazy var accountBtn: UIButton = createBtn(title: "Выйти", BGColor: .white, textColor: .red, target: self, action: #selector(accBtnTapped))
    
    // MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
    
        setupUI()
    }
    @objc func accBtnTapped() {
        NotificationCenter.default.post(name: NSNotification.Name("SwitchBack"), object: nil)
    }
    // MARK: Private methods
    private func setupUI() {
        addSubviews([nameLabel, accountBtn], to: view)
        
        setupConstraints()
        
        nameLabel.text = (UserDefaults.standard.string(forKey: "name")!) + " " +  UserDefaults.standard.string(forKey: "surname")!
    }

    private func setupConstraints() {
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 100),
            
            nameLabel.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            
            accountBtn.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -80),
            accountBtn.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            accountBtn.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            
          ])
    }
}
