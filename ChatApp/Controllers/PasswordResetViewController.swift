//
//  PasswordResetViewController.swift
//  ChatApp
//
//  Created by Maria Angelica Dadalt on 18/08/17.
//  Copyright © 2017 Maria Angelica Dadalt. All rights reserved.
//

import UIKit
import FirebaseAuth
import Firebase

class PasswordResetViewController: UIViewController {

    @IBOutlet weak var emailTextField: LeftPaddedTextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        emailTextField.setBottomLine(borderColor: .white)

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func resetPressed(_ sender: Any) {
        
        if emailTextField.text == "" {
            let alertController = UIAlertController(title: "Oops!", message: "Please enter an email.", preferredStyle: .alert)
            
            let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            alertController.addAction(defaultAction)
            
            present(alertController, animated: true, completion: nil)
            
        } else {
            
            guard let email = emailTextField.text else { return }
            
            Auth.auth().sendPasswordReset(withEmail: email, completion: { (error) in
                
                var title = ""
                var message = ""
                
                if error != nil {
                    title = "Error!"
                    message = (error?.localizedDescription)!
                } else {
                    title = "Success!"
                    message = "Password reset email sent."
                    self.emailTextField.text = ""
                }
                
                let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
                
                let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                alertController.addAction(defaultAction)
                
                self.present(alertController, animated: true, completion: {
                    
                })
                
            })
        }
        
    }
    
}
