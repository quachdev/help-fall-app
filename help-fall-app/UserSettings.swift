//
//  UserSettings.swift
//  help-fall-app
//
//  Created by Guillian Balisi on 2016-01-16.
//  Copyright © 2016 Simon Quach. All rights reserved.
//

import Foundation

class UserSettings: NSObject, NSCoding {
    
    //MARK: Properties
    
//    private var _emergencyContactNames: [String]
//    private var _emergencyContactNumbers: [String]
    
    var emergencyContactNames: [String]
    var emergencyContactNumbers: [String]
    
    //MARK: Methods
    
    override init() {
        self.emergencyContactNames = []
        self.emergencyContactNumbers = []
    }
    
    func addContact(name: String, number: String) {
        self.emergencyContactNames.append(name)
        self.emergencyContactNumbers.append(number)
    }
    
    //MARK: NSCoding
    
    required init?(coder aDecoder: NSCoder) {
        self.emergencyContactNames = aDecoder.decodeObjectForKey("emergencyContactName") as! [String]
        self.emergencyContactNumbers = aDecoder.decodeObjectForKey("emergencyContactNumber") as! [String]
    }
    
    func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(emergencyContactNames, forKey: "emergencyContactName")
        aCoder.encodeObject(emergencyContactNumbers, forKey: "emergencyContactNumber")
    }
    
}