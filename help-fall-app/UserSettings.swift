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
    
    private var _emergencyContactNames: [String]
    private var _emergencyContactNumbers: [String]
    
    var emergencyContactNames: [String] {
        return _emergencyContactNames
    }
    var emergencyContactNumbers: [String] {
        return _emergencyContactNumbers
    }
    
    //MARK: Methods
    
    override init() {
        self._emergencyContactNames = []
        self._emergencyContactNumbers = []
    }
    
    func addContact(name: String, number: String) {
        self._emergencyContactNames.append(name)
        self._emergencyContactNumbers.append(number)
    }
    
    //MARK: NSCoding
    
    required init?(coder aDecoder: NSCoder) {
        self._emergencyContactNames = aDecoder.decodeObjectForKey("emergencyContactName") as! [String]
        self._emergencyContactNumbers = aDecoder.decodeObjectForKey("emergencyContactNumber") as! [String]
    }
    
    func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(emergencyContactNames, forKey: "emergencyContactName")
        aCoder.encodeObject(emergencyContactNumbers, forKey: "emergencyContactNumber")
    }
    
}