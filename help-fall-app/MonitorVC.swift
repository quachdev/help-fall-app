//
//  MonitorVC.swift
//  help-fall-app
//
//  Created by Guillian Balisi on 2016-01-16.
//  Copyright © 2016 Simon Quach. All rights reserved.
//

import UIKit
import CoreMotion

class MonitorVC: UIViewController {

    //MARK: Properties
    
    var manager = CMMotionManager()
    
    @IBOutlet var monitoringLabel: UILabel?
    @IBOutlet var fallVector: UILabel?
    
    //MARK: Methods
    
    @IBAction func startMonitoring() {
        monitoringLabel?.hidden = false
        manager.accelerometerUpdateInterval = 0.1 // set motion manager properties
        manager.startAccelerometerUpdatesToQueue(NSOperationQueue.mainQueue()) {
            data, error in
            if sqrt(pow((data?.acceleration.x)!,2) + pow((data?.acceleration.y)!,2) + pow((data?.acceleration.z)!,2)) > 3 {
                self.monitoringLabel!.text = String(sqrt(pow((data?.acceleration.x)!,2) + pow((data?.acceleration.y)!,2) + pow((data?.acceleration.z)!,2)))
                self.performSegueWithIdentifier("alertTimerSegue", sender: nil)

            }
        }
    }
    
    @IBAction func stopMonitoring() {
        monitoringLabel?.hidden = true
        manager.stopAccelerometerUpdates()
    }
    
//    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
//        if segue.identifier == "alertTimerSegue" {
//            let destViewController: AlertTimerVC = segue.destinationViewController as! AlertTimerVC
//        }
//    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
