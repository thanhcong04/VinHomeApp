//
//  SceneDelegate.swift
//  VinhomeReportApi
//
//  Created by Công on 12/13/20.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.windowScene = windowScene
        startLogin()
        let token = UserDefaults.standard.string(forKey: "token") ?? ""

        if !token.isEmpty {
            startMain()
        }else{
            startLogin()
        }
        guard let _ = (scene as? UIWindowScene) else { return }
    }

    func startLogin(){
        let loginVC = LoginV2ViewController()
        let navigationController = UINavigationController(rootViewController: loginVC)
        window?.rootViewController = navigationController
        window?.backgroundColor = .yellow
        window?.makeKeyAndVisible()
    }
    
    func startMain(){
        let homeVC = ContainerViewController()
        let navigationController = UINavigationController(rootViewController: homeVC)
        window?.rootViewController = navigationController
        window?.backgroundColor = .purple
        window?.makeKeyAndVisible()
    }
}

