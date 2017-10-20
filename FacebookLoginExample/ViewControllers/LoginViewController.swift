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
        
        viewModel.onLoginFinished = { (user, response) in
            
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
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
            
            guard let accessToken = FBSDKAccessToken.current() else {
                print("Failed to get access token")
                return
            }
            
            self.viewModel.facebookLoginWithFirebase(accessToken: accessToken)
        }
    }
    
}

