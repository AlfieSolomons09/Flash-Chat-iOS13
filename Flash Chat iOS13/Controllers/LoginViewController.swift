//
//  LoginViewController.swift
//  Flash Chat iOS13
//
//  Created by Angela Yu on 21/10/2019.
//  Copyright © 2019 Angela Yu. All rights reserved.
//

import UIKit
import Firebase

class LoginViewController: UIViewController {

    @IBOutlet weak var emailTextfield: UITextField!
    @IBOutlet weak var passwordTextfield: UITextField!
    

    @IBAction func loginPressed(_ sender: UIButton) {
        
        if let email = emailTextfield.text, let password = passwordTextfield.text{
            
            Auth.auth().signIn(withEmail: email, password: password) {authResult, error in
                if let e = error{
                    print(e)
                    // create the alert
                    let alert = UIAlertController(title: "User Not Found", message: "Please Regiseter Before Logging in", preferredStyle: UIAlertController.Style.alert)

                            // add an action (button)
                    alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))

                    // show the alert
                    self.present(alert, animated: true, completion: nil)
//                    navigationController?.popToViewController(RegisterViewController, animated: true)
                }
                else{
                    // Navigate to Login View Controller
                    self.performSegue(withIdentifier: K.loginSegue, sender: self)
                }
            }
        }
        
    }
    
}
