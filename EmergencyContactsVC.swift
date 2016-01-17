//
//  EmergencyContactsVC.swift
//  help-fall-app
//
//  Created by Guillian Balisi on 2016-01-16.
//  Copyright © 2016 Simon Quach. All rights reserved.
//

import UIKit

class EmergencyContactsVC: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    //MARK: Properties
    
    var user = UserSettings()
    
    @IBOutlet weak var tableView: UITableView!
    
    //MARK: Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.tableFooterView = UIView() // get rid of useless separator lines
        tableView.reloadData()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(animated: Bool) {
        // Load saved data
        if let contactData = NSUserDefaults.standardUserDefaults().objectForKey("MyContacts") as? NSData {
            self.user = NSKeyedUnarchiver.unarchiveObjectWithData(contactData) as! UserSettings
        }
        tableView.reloadData()
        print(user.emergencyContactNames)
    }
    
    //    override func viewWillAppear(animated: Bool) {
    //        // Load saved data
    //        if let contactData = NSUserDefaults.standardUserDefaults().objectForKey("MyContacts") as? NSData {
    //            self.user = NSKeyedUnarchiver.unarchiveObjectWithData(contactData) as! UserSettings
    //        }
    //        tableView.reloadData()
    //    }
    
    func saveContacts() {
        let contacts = NSKeyedArchiver.archivedDataWithRootObject(self.user)
        NSUserDefaults.standardUserDefaults().setObject(contacts, forKey: "MyContacts")
        NSUserDefaults.standardUserDefaults().synchronize()
    }
    
    @IBAction func close() {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    //MARK: Table View
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.user.emergencyContactNames.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell: EmergencyContactCell = tableView.dequeueReusableCellWithIdentifier("ContactCell", forIndexPath: indexPath) as! EmergencyContactCell
        
        let name = self.user.emergencyContactNames[indexPath.row]
        let number = self.user.emergencyContactNumbers[indexPath.row]
        
        cell.setCell(name, number: number)
        
        return cell
    }
    
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == UITableViewCellEditingStyle.Delete {
            self.user.emergencyContactNames.removeAtIndex(indexPath.row)
            self.user.emergencyContactNumbers.removeAtIndex(indexPath.row)
            self.saveContacts()
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: UITableViewRowAnimation.Automatic)
        }
    }
    
    // MARK: - Navigation
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "AddContacts" {
            let destViewController: AddContactsVC = segue.destinationViewController as! AddContactsVC
            destViewController.user = user
        }
    }
    
}
