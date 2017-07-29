//
//  MainVC.swift
//  FirebaseAuthenticationExample
//
//  Created by Luis Manuel Ramirez Vargas on 20/07/17.
//  Copyright © 2017 Luis Manuel Ramirez Vargas. All rights reserved.
//

import UIKit
import FirebaseAuth

class MainVC: UIViewController {

    @IBOutlet weak var userLbl: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        
        guard Auth.auth().currentUser != nil else {
            performSegue(withIdentifier: "SocialLoginVC", sender: nil)
            return
        }
        
        let currentUser = Auth.auth().currentUser
        userLbl.text = "DisplayName: \(currentUser?.displayName ?? "No displayName")\nEmail: \(currentUser?.email ?? "No email")\nPhoneNumber: \(currentUser?.phoneNumber ?? "No phoneNumber")\nPhotoURL: \(currentUser?.photoURL?.absoluteString ?? "No photoURL")\nUID: \(currentUser?.uid ?? "No uid")\n"
    }
    
    @IBAction func signOutPressed(_ sender: Any) {
        do {
            try Auth.auth().signOut()
            performSegue(withIdentifier: "SocialLoginVC", sender: nil)
        } catch {
            
        }
    }

}
