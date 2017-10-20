//
//  AppDelegate.swift
//  FacebookLoginExample
//
//  Created by Roxana Mitel on 20/10/2017.
//  Copyright © 2017 roxanamitel. All rights reserved.
//

import UIKit
import Firebase
import FBSDKCoreKit
import FBSDKLoginKit
import FirebaseAuth

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        FirebaseApp.configure()
        FBSDKApplicationDelegate.sharedInstance().application(application, didFinishLaunchingWithOptions: launchOptions)
        checkCurrentSession()
        
        return true
    }
    
    func checkCurrentSession() {
        if Auth.auth().currentUser != nil {
            presentHome()
        }
    }
    
    private func presentHome() {
        if let homeViewController = UIStoryboard.main.instantiateViewController(withIdentifier: Identifiers.Main.homeViewController) as? HomeViewController {
            self.window?.rootViewController = homeViewController
            self.window?.makeKeyAndVisible()
        }
    }
}

