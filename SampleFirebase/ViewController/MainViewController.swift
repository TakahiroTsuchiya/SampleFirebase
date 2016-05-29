//
//  MainViewController.swift
//  SampleFirebase
//
//  Created by Takahiro Tsuchiya on 5/28/16.
//  Copyright © 2016 Takahiro Tsuchiya. All rights reserved.
//

import Firebase
import SwiftyJSON
import UIKit

class MainViewController: UIViewController {

    private var coupons: JSON!

    @IBOutlet weak var inputBarcode: UITextField!

    @IBOutlet weak var couponTableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()

        coupons = JSON("")
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

    @IBAction func executeAction(sender: AnyObject) {

        let ref = FIRDatabase.database().reference().child(self.inputBarcode.text!)

        ref.observeEventType(.Value, withBlock: { (snapshot) in
            self.coupons = JSON(snapshot.value!)
            self.couponTableView.reloadData()
        })
    }
}

extension MainViewController : UITableViewDelegate {
}

extension MainViewController : UITableViewDataSource {

    @available(iOS 2.0, *)
    internal func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return coupons.count
    }
    
    // Row display. Implementers should *always* try to reuse cells by setting each cell's reuseIdentifier and querying for available reusable cells with dequeueReusableCellWithIdentifier:
    // Cell gets various attributes set automatically based on table (separators) and data source (accessory views, editing controls)
    
    @available(iOS 2.0, *)
    internal func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCellWithIdentifier("couponCell")! as UITableViewCell

        cell.textLabel?.text = coupons[indexPath.row]["couponCode"].stringValue
        cell.detailTextLabel?.text = coupons[indexPath.row]["expire"].stringValue

        return cell
    }
}