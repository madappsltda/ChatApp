//
//  ViewController.swift
//  ChatApp
//
//  Created by Maria Angelica Dadalt on 17/08/17.
//  Copyright © 2017 Maria Angelica Dadalt. All rights reserved.
//

import UIKit
import Firebase

class MessagesViewController: UITableViewController {


    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func signOutPressed(_ sender: Any) {
        
        if Auth.auth().currentUser?.uid != nil {
            do {
                try Auth.auth().signOut()
                print("sign out sucessfull")

                performSegue(withIdentifier: "signOut", sender: self)
                //                let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "SignUp")
                //                present(vc, animated: true, completion: nil)
                
            } catch let error as NSError {
                print(error.localizedDescription)
            }
        }
    }
}

