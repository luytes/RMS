//
//  SignUpPageViewController.swift
//  RMS
//
//  Created by Kevin Ma on 13.04.18.
//  Copyright © 2018 Kevin Ma. All rights reserved.
//

import UIKit
import FirebaseAuth

class SignUpPageViewController: UIViewController {

    @IBOutlet weak var userEmailTextField: UITextField!
    @IBOutlet weak var userPasswordTextField: UITextField!
    @IBOutlet weak var repeatPasswordTextField: UITextField!
    @IBOutlet weak var userNameTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: ACTION
    @IBAction func signUpButtonTapped(_ sender: Any) {
        if let userEmail = userEmailTextField.text, let userPassword = userPasswordTextField.text, let userName = userNameTextField.text {
            
            Auth.auth().createUser(withEmail: userEmail, password: userPassword) { user, error in
                
                if error == nil && user != nil {
                    print("Successful!")
                    
                    // Create Username
                    let changeRequest = Auth.auth().currentUser?.createProfileChangeRequest()
                    changeRequest?.displayName = userName
                    changeRequest?.commitChanges { error in
                        if error == nil {
                            print("Username changed")
                            self.dismiss(animated: false, completion: nil)
                        }
                    }
                    
                } else {
                    print("Error creating user: \(error!.localizedDescription)")
                }
            }
            
            // Check for empty fields
            
//            if (userEmail.isEmpty) || (userPassword.isEmpty) || (userRepeatPassword.isEmpty) {
//                // Display alert message
//                displayAlertMessage(userMessage: "All fields are required")
//                return
//            }
//            // Check if Password match
//            if userPassword != userRepeatPassword {
//                // Display alert message
//                displayAlertMessage(userMessage: "Passwords do not match")
//                return
//            }
            
        }
    }
}

