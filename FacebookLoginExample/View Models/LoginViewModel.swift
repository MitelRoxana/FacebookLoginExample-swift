//
//  LoginViewModel.swift
//  FacebookLoginExample
//
//  Created by Roxana Mitel on 20/10/2017.
//  Copyright © 2017 roxanamitel. All rights reserved.
//

import FBSDKLoginKit
import Firebase
import FirebaseAuth

class LoginViewModel {
    let fbLoginManager = FBSDKLoginManager()
    let permisions = ["public_profile", "email"]
    var onLoginFinished: ((_ errorString: String?) -> ())?
    
    func facebookLoginWithFirebase(accessToken: FBSDKAccessToken) {
        // Get credentials
        let credential =
            FacebookAuthProvider.credential(withAccessToken: accessToken.tokenString)
        
        // Perform login by calling Firebase APIs
        Auth.auth().signIn(with: credential, completion: { (user, error) in
            if let error = error {
                self.onLoginFinished?(error.localizedDescription)
                return
            }
            self.onLoginFinished?(nil)
        })
    }
    
    func getFBUserData(){
        guard let token = FBSDKAccessToken.current() else {
            self.onLoginFinished?("Failed login with facebook!")
            return
        }
        
        // Getting user data from facebook account
        FBSDKGraphRequest(graphPath: "me", parameters: ["fields": "email"])
            .start(completionHandler: { [weak self] (connection, result, error) -> Void in
                guard let `self` = self else { return }
                guard error == nil else {
                    self.onLoginFinished?(error?.localizedDescription)
                    return
                }
                
                guard let userDetails = result as? [String:Any], let email = userDetails["email"] as? String else {
                        self.onLoginFinished?("Failed extracting facebook data!")
                        return
                }
                
                //Saving the current session
                var customer = Customer()
                customer.email = email
                CurrentSession.customer = customer
                
                self.facebookLoginWithFirebase(accessToken: token)
            })
    }
}
