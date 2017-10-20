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
    var onLoginFinished: ((_ user: User?, _ errorString: String?) -> ())?
    
    func facebookLoginWithFirebase(accessToken: FBSDKAccessToken) {
        // Get credentials
        let credential =
            FacebookAuthProvider.credential(withAccessToken: accessToken.tokenString)
        
        // Perform login by calling Firebase APIs
        Auth.auth().signIn(with: credential, completion: { (user, error) in
            if let error = error {
                self.onLoginFinished?(nil, error.localizedDescription)
                return
            }
            self.onLoginFinished?(user, nil)
        })
    }
}
