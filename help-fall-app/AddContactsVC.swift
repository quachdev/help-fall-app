//
//  AddContactsVC.swift
//  help-fall-app
//
//  Created by Guillian Balisi on 2016-01-16.
//  Copyright © 2016 Simon Quach. All rights reserved.
//

import UIKit

class AddContactsVC: UIViewController {
    
    //MARK: Properties
    
    var user = UserSettings()
    @IBOutlet var nameTextField: UITextField!
    @IBOutlet var numberTextField: UITextField!
    
    //MARK: Methods
    
    func refreshGradeWeightTextFields() {
        nameTextField!.text = ""
        numberTextField!.text = ""
    }
    
    @IBAction func add() {
        user.addContact(String(nameTextField), number: String(numberTextField))
        // Save to NSUserDefaults
        let contactData = NSKeyedArchiver.archivedDataWithRootObject(user)
        NSUserDefaults.standardUserDefaults().setObject(contactData, forKey: "MyContacts")
        NSUserDefaults.standardUserDefaults().synchronize()
        refreshGradeWeightTextFields()
        self.resignFirstResponder()
    }
    
    @IBAction func done() {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBAction func viewTapped() {
        nameTextField.resignFirstResponder()
        numberTextField.resignFirstResponder()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //self.nameTextField?.autocapitalizationType = .Words
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
