//
//  EmergencyContactsVC.swift
//  help-fall-app
//
//  Created by Guillian Balisi on 2016-01-16.
//  Copyright © 2016 Simon Quach. All rights reserved.
//

import UIKit

class EmergencyContactsVC: UIViewController {
    
    var user = UserSettings()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Load saved data
        if let contactData = NSUserDefaults.standardUserDefaults().objectForKey("MyContacts") as? NSData {
            self.user = NSKeyedUnarchiver.unarchiveObjectWithData(contactData) as! UserSettings
        }
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

}
