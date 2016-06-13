//
//  AuthEmailPasswordViewController.swift
//  SampleFirebase
//
//  Created by Takahiro Tsuchiya on 6/13/16.
//  Copyright © 2016 Takahiro Tsuchiya. All rights reserved.
//

import Firebase
import FirebaseAuth
import UIKit

class AuthEmailPasswordViewController: UIViewController {

    @IBOutlet weak var inputEmail: UITextField!

    @IBOutlet weak var inputPassword: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

    @IBAction func loginAction(sender: AnyObject) {

        let email = self.inputEmail.text
        if email != nil {
            return
        }
        
        let password = self.inputPassword.text
        if password != nil {
            return
        }

        FIRAuth.auth()?.createUserWithEmail(email!, password: password!, completion: {
            (user, error) in
            print("[user]" + "\(user)")
            print("[error]" + "\(error)")
        })
        
    }
    
    @IBAction func logoutAction(sender: AnyObject) {
        
        try! FIRAuth.auth()?.signOut()
    }
    
}
