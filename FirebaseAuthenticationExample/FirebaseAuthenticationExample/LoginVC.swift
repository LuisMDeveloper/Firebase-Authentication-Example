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
    
    override func viewDidLoad() {
        super.viewDidLoad()
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
    



}
