//
//  SceneDelegate.swift
//  lesson6
//
//  Created by Dmitrii Nazarov on 13.10.2024.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let _ = (scene as? UIWindowScene) else { return }
        
        self.window = UIWindow(windowScene: scene as! UIWindowScene)
        
        window?.makeKeyAndVisible()
        
        let isLogin = UserDefaults.standard.bool(forKey: "isLogin")
        
        if isLogin {
            window?.rootViewController = FinalViewController()
        } else {
            window?.rootViewController = RegistrationViewController()
        }
              
        NotificationCenter.default.addObserver(self, selector: #selector(switchToSecondViewController), name: NSNotification.Name("SwitchToSecondViewController"), object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(switchBack), name: NSNotification.Name("SwitchBack"), object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(switchToAutorisation), name: NSNotification.Name("SwitchToAutorisation"), object: nil)
    }
   
    @objc func switchToSecondViewController() {
        let finalViewController = FinalViewController()
        
        window?.rootViewController = finalViewController
    }
    
    @objc func switchBack() {
        window?.rootViewController = RegistrationViewController()
    }
    
    @objc func switchToAutorisation() {
        window?.rootViewController = AutorisationViewController()
    }
}




