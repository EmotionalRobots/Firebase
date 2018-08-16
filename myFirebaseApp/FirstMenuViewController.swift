//
//  ViewController.swift
//  Firebase
//
//  Created by Christopher Anderson on 8/14/18.
//  Copyright © 2018 Christopher Anderson. All rights reserved.
//

import UIKit
import FirebaseAuth

class FirstMenuViewController: UIViewController {

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
        
        
        //will only be true after signup/signin
        if let user = Auth.auth().currentUser {
            //seque to home screen
            self.performSegue(withIdentifier: "toHomeScreen", sender: self)
        }
    }


}

