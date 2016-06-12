//
//  AuthAnonymousViewController.swift
//  SampleFirebase
//
//  Created by Takahiro Tsuchiya on 6/12/16.
//  Copyright © 2016 Takahiro Tsuchiya. All rights reserved.
//

import FirebaseAuth
import SVGKit
import UIKit

class AuthAnonymousViewController: UIViewController {

    @IBOutlet weak var loginButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.

        let svgImage = SVGKImage(named: "auth_service_anonymous.svg")
        self.loginButton.imageView?.image = svgImage.UIImage
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
        authLogin()
    }
    private func authLogin() {

        FIRAuth.auth()?.signInAnonymouslyWithCompletion() {
            (user, error) in
                print("[user]" + "\(user)")
                print("[error]" + "\(error)")
        }
    }
}
