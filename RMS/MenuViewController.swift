//
//  ViewController.swift
//  RMS
//
//  Created by Kevin Ma on 05.04.18.
//  Copyright © 2018 Kevin Ma. All rights reserved.
//

import UIKit
import Firebase

class MenuViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        if let user = Auth.auth().currentUser {
            self.performSegue(withIdentifier: "homeView", sender: self)
        }
    }
    
}

