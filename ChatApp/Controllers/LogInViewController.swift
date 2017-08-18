//
//  LogInViewController.swift
//  ChatApp
//
//  Created by Maria Angelica Dadalt on 17/08/17.
//  Copyright © 2017 Maria Angelica Dadalt. All rights reserved.
//

import UIKit
import FirebaseAuth
import FirebaseDatabase
import FirebaseStorage
import Firebase

class LogInViewController: UIViewController {

    
    @IBOutlet weak var emailTextField: LeftPaddedTextField!
    
    @IBOutlet weak var passwordTextField: LeftPaddedTextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        emailTextField.setBottomLine(borderColor: .white)
        passwordTextField.setBottomLine(borderColor: .white)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func logInPressed(_ sender: Any) {
        if self.emailTextField.text == "" || self.passwordTextField.text == "" {
            
            //Alert to tell the user that there was an error because they didn't fill anything in the textfields because they didn't fill anything in
            
            let alertController = UIAlertController(title: "Error", message: "Please enter an email and password.", preferredStyle: .alert)
            
            let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            alertController.addAction(defaultAction)
            
            self.present(alertController, animated: true, completion: nil)
            
        } else {
            
            guard let email = emailTextField.text, let password = passwordTextField.text else { print("Form not valid!")
                return }
            
            Auth.auth().signIn(withEmail: email, password: password) { (user, error) in
                
                if error == nil {
                    
                    //Print into the console if successfully logged in
                    print("You have successfully logged in")
                    
                    //Go to the ChatViewController if the login is sucessful
                    self.performSegue(withIdentifier: "goToChatFromLogIn", sender: self)
                    
                } else {
                    
                    //Tells the user that there is an error and then gets firebase to tell them the error
                    let alertController = UIAlertController(title: "Error", message: error?.localizedDescription, preferredStyle: .alert)
                    
                    let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                    alertController.addAction(defaultAction)
                    
                    self.present(alertController, animated: true, completion: nil)
                }
            }
        }
        
    }
    
    @IBAction func singUpPressed(_ sender: Any) {
        
        performSegue(withIdentifier: "goToSignUp", sender: self)
    }
    
    @IBAction func unwindFromSignUpViewController(unwindSegue: UIStoryboardSegue) {
        
    }
    

    
    @IBAction func unwindFromPasswordResetViewController(unwindSegue: UIStoryboardSegue) {
        
    }
}
