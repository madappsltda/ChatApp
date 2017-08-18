//
//  SignUpViewController.swift
//  ChatApp
//
//  Created by Maria Angelica Dadalt on 17/08/17.
//  Copyright © 2017 Maria Angelica Dadalt. All rights reserved.
//

import UIKit
import FirebaseStorage
import FirebaseDatabase
import FirebaseAuth
import Firebase

class SignUpViewController: UIViewController {


    @IBOutlet weak var passwordTextField: LeftPaddedTextField!
    @IBOutlet weak var emailTextField: LeftPaddedTextField!
    @IBOutlet weak var nameTextField: LeftPaddedTextField!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        nameTextField.setBottomLine(borderColor: UIColor(r: 74, g: 144, b: 226))
        emailTextField.setBottomLine(borderColor: UIColor(r: 74, g: 144, b: 226))
        passwordTextField.setBottomLine(borderColor: UIColor(r: 74, g: 144, b: 226))

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    @IBAction func getStartedPressed(_ sender: Any) {
        
        if emailTextField.text == "" || nameTextField.text == "" || passwordTextField.text == "" {

            let alertController = UIAlertController(title: "Error", message: "Please enter your name, email and password", preferredStyle: .alert)

            let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            alertController.addAction(defaultAction)

            present(alertController, animated: true, completion: nil)
        } else {
        
        guard let email = emailTextField.text, let password = passwordTextField.text, let name = nameTextField.text else { print("Form not valid!")
            return }
        
        Auth.auth().createUser(withEmail: email, password: password) { (user: User?, error) in
            
            if error != nil {
                print(error!)
                return }

            guard let uid = user?.uid else { return }
            
            let reference = Database.database().reference(fromURL: "https://chatapp-d0782.firebaseio.com/")
            let usersReference = reference.child("users").child(uid)
            let values = ["name": name, "email": email]
            
            usersReference.updateChildValues(values, withCompletionBlock: { (error, reference) in
                
                if error != nil {
                    print(error!)
                    return
                } else {
                    print("registration ok")

                    self.performSegue(withIdentifier: "goToChatFromSignUp", sender: self)
                }
            })
        }
        }
    }


}


