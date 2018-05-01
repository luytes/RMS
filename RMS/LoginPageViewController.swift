//
//  LoginPageViewController.swift
//  RMS
//
//  Created by Kevin Ma on 26.04.18.
//  Copyright © 2018 Kevin Ma. All rights reserved.
//

import UIKit
import Firebase

class LoginPageViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: ACTION

    @IBAction func loginTapped(_ sender: Any) {
        if let email = emailTextField.text, let password = passwordTextField.text {
            Auth.auth().signIn(withEmail: email, password: password) { user, error in
                if error == nil && user != nil {
                    print("Logged in!")
                }
            }
        }
    }
    
}
