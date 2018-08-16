//
//  SignupViewController.swift
//  Firebase
//
//  Created by Christopher Anderson on 8/14/18.
//  Copyright © 2018 Christopher Anderson. All rights reserved.
//

import UIKit
import Foundation
import Firebase
import FirebaseAuth

class SignupViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet weak var usernameField: UITextField!
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        usernameField.returnKeyType = .next
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
    
    @IBAction func AttemptSignup(_ sender: Any) {
        //TODO: Check if fields are valid
        handleSignUp()
    }
    
    func handleSignUp(){
        guard let username = usernameField.text else { return }
        guard let email = emailField.text else { return }
        guard let password = passwordField.text else { return }
        
        Auth.auth().createUser(withEmail: email, password: password) { user, error in
            if user != nil && error == nil {
                print("User created!")
                
                //add display name in Firebase
                let changeRequest = Auth.auth().currentUser?.createProfileChangeRequest()
                changeRequest?.displayName = username
                
                changeRequest?.commitChanges() { error in
                    if error == nil {
                        print("Display name saved in Firebase")
                    }
                    else {
                        print("Error: \(error!.localizedDescription)")
                    }
                    
                }
                
                
                //close this screen (next call is to viewDidAppear()
                self.dismiss(animated: true, completion: (nil))
                
                
            }
            else{
                print("Error: \(error!.localizedDescription)")
            }
            
        }
    }
}





























