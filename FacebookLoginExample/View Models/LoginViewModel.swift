//
//  LoginViewModel.swift
//  FacebookLoginExample
//
//  Created by Roxana Mitel on 20/10/2017.
//  Copyright © 2017 roxanamitel. All rights reserved.
//
import FBSDKLoginKit

class LoginViewModel {
    let fbLoginManager = FBSDKLoginManager()
    let permisions = ["public_profile", "email"]
    var onFacebookFinished: ((_user: User?, _ errorString: String?) -> ())?
    
    func facebookLoginWithFirebase(accessToken: FBSDKAccessToken) {
        
    }
}
