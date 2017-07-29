//
//  SocialLoginVC.swift
//  FirebaseAuthenticationExample
//
//  Created by Luis Manuel Ramirez Vargas on 27/07/17.
//  Copyright © 2017 Luis Manuel Ramirez Vargas. All rights reserved.
//

import UIKit
import Firebase
import FBSDKCoreKit
import FBSDKLoginKit

class SocialLoginVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func facebookLoginBtnPressed(_ sender: Any) {
        let facebookLogin = FBSDKLoginManager()
        
        facebookLogin.logIn(withReadPermissions: ["email"], from: self) { (userResult, error) in
            if error != nil {
                print("Unable to authenticate with facebook - \(String(describing: error).debugDescription)")
                self.alertError("Unable to authenticate with facebook")
            } else if userResult?.isCancelled == true {
                self.alertError("User cancel facebook authentication")
            } else {
                print("Successfully authenticated with facebook")
                let credentials = FacebookAuthProvider.credential(withAccessToken: FBSDKAccessToken.current().tokenString)
                AuthService.instance.login(with: credentials, onComplete: self.onAuthComplete)
            }
            
        }
    }

    func onAuthComplete(_ errMsg: String?, _ data: Any?) -> Void {
        guard errMsg == nil else {
            alertError(errMsg)
            return
        }
        self.dismiss(animated: true, completion: nil)
    }
    
    func alertError(_ errMsg: String?) {
        let authAlert = UIAlertController(title: "Error Authentication", message: errMsg, preferredStyle: .alert)
        authAlert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
        self.present(authAlert, animated: true, completion: nil)
    }

}
