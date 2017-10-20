//
//  ViewController.swift
//  FacebookLoginExample
//
//  Created by Roxana Mitel on 20/10/2017.
//  Copyright © 2017 roxanamitel. All rights reserved.
//

import UIKit
import FBSDKCoreKit
import FBSDKLoginKit

class LoginViewController: UIViewController {
    let viewModel = LoginViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel.onLoginFinished = { error in
            if let error = error {
                self.presentAlertWithTitle(title: "Warning", message: error)
                return
            }
            if let viewController = UIStoryboard.main.instantiateViewController(withIdentifier: Identifiers.Main.homeViewController) as? HomeViewController {
                self.present(viewController, animated: true, completion: nil)
            }
        }
    }

    @IBAction func facebookLogin(_ sender: Any) {
        viewModel.fbLoginManager.logIn(withReadPermissions: viewModel.permisions, from: self) { (result, error) in
            
            guard error == nil, let result = result else {
                self.presentAlertWithTitle(title: "Warning", message: error!.localizedDescription)
                return
            }
            
            if result.isCancelled {
                self.presentAlertWithTitle(title: "Warning", message: "Login was cancelled by the user!")
            }
            
            self.viewModel.getFBUserData()
        }
    }
    
}

