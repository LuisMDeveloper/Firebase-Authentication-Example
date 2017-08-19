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
import GoogleSignIn

class SocialLoginVC: UIViewController, GIDSignInUIDelegate {

    enum AuthProvider {
        case authEmail
        case authFacebook
        case authGoogle
    }

    func auth(with provider: AuthProvider) {
        switch provider {
        case .authEmail:
            self.performSegue(withIdentifier: "email", sender: nil)
        case .authFacebook:
            let loginManager = FBSDKLoginManager()
            loginManager.logIn(withReadPermissions: ["email"], from: self, handler: { (result, error) in
                if let error = error {
                    print(error.localizedDescription);
                    self.alertError("Unable to authenticate with facebook")
                } else if result!.isCancelled {
                    self.alertError("User cancel facebook authentication")
                } else {
                    let credential = FacebookAuthProvider.credential(withAccessToken: FBSDKAccessToken.current().tokenString)
                    AuthService.instance.login(with: credential, onComplete: self.onAuthComplete)
                }
            })
        case .authGoogle:
            GIDSignIn.sharedInstance().uiDelegate = self
            GIDSignIn.sharedInstance().signIn()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func facebookLoginBtnPressed(_ sender: Any) {
        self.auth(with: .authFacebook)
    }

    @IBAction func googleLoginBtnPressed(_ sender: Any) {
        self.auth(with: .authGoogle)
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
