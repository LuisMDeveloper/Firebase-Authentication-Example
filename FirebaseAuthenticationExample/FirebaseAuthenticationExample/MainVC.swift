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
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var userNameLbl: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)


        guard Auth.auth().currentUser != nil else {
            performSegue(withIdentifier: "SocialLoginVC", sender: nil)
            return
        }

        if let user = Auth.auth().currentUser {
            if let photoURL = user.photoURL  {
                DispatchQueue.global(qos: .default).async {
                    let data = try? Data.init(contentsOf: photoURL)
                    if let data = data {
                        let image = UIImage.init(data: data)
                        DispatchQueue.main.async(execute: {
                            self.profileImage?.image = image
                        })
                    }
                }
            }

            if let username = user.displayName {
                self.userNameLbl.text = username
            }

            userLbl.text = "Email: \(user.email ?? "No email")\nPhoneNumber: \(user.phoneNumber ?? "No phoneNumber")\nUID: \(user.uid ?? "No uid")\n"

        }

    }

    @IBAction func signOutPressed(_ sender: Any) {
        do {
            try Auth.auth().signOut()
            performSegue(withIdentifier: "SocialLoginVC", sender: nil)
        } catch {

        }
    }

}
