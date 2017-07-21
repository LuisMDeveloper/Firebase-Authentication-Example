//
//  LoginVC.swift
//  FirebaseAuthenticationExample
//
//  Created by Luis Manuel Ramirez Vargas on 20/07/17.
//  Copyright © 2017 Luis Manuel Ramirez Vargas. All rights reserved.
//

import UIKit

class LoginVC: UIViewController {
    
    var loginMode = false

    @IBOutlet weak var singupBtn: CustomButton!
    @IBOutlet weak var switchLbl: UILabel!
    @IBOutlet weak var accountLbl: UILabel!
    @IBOutlet weak var emailTF: CustomTextField!
    @IBOutlet weak var passwordTF: CustomTextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        emailTF.delegate = self
        passwordTF.delegate = self
    }
    
    @IBAction func SwitchLoginSignUp(_ sender: Any) {
        
        loginMode = !loginMode
        
        if (loginMode) {
            singupBtn.setTitle("Login", for: UIControlState.normal)
            switchLbl.text = "Sing Up"
            accountLbl.text = "Do you not have an account?"
        } else {
            singupBtn.setTitle("Sing Up", for: UIControlState.normal)
            switchLbl.text = "Login"
            accountLbl.text = "Already have an account?"
            
        }
        
    }
    

    @IBAction func SingUpLoginButton(_ sender: Any) {
        if let email = emailTF.text, let password = passwordTF.text, (email.characters.count > 0 && password.characters.count > 0) {
            
        } else {
            let alert = UIAlertController(title: "Email and Password Required", message: "You must enter both email and password", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Ok", style: .cancel, handler: nil))
            present(alert, animated: true, completion: nil)
        }
    }

}

extension LoginVC: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        
        return false
    }
}
