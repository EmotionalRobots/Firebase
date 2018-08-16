//
//  LoginViewController.swift
//  Firebase
//
//  Created by Christopher Anderson on 8/14/18.
//  Copyright © 2018 Christopher Anderson. All rights reserved.
//

import UIKit
import FirebaseAuth

class LoginViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        emailField.returnKeyType = .next
        passwordField.returnKeyType = .done
        
    }
    
    //removes keyboard when touched on the screen
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
       self.view.endEditing(true)
    }
    
    //removes keyboard from screen when "return" key is pressed
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return true
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func closePage(_ sender: Any) {
         presentingViewController?.dismiss(animated: true, completion: nil)
    }
    
    func handleSignUp(){
        guard let email = emailField.text else { return }
        guard let password = passwordField.text else { return }
        
        Auth.auth().signIn(withEmail: email, password: password) { user, error in
            if error != nil && user != nil {
                
                self.dismiss(animated: true, completion: nil)
            }
            else{
                print("Error: \(error!.localizedDescription)")
            }
            
        }
    }
    
}
