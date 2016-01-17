//
//  AlertTimerVC.swift
//  help-fall-app
//
//  Created by Simon Quach on 2016-01-16.
//  Copyright © 2016 Simon Quach. All rights reserved.
//

import UIKit
import CoreLocation

class AlertTimerVC: UIViewController, CLLocationManagerDelegate {
    
    //MARK: Properties
    
    var user = UserSettings()
    
    let manager = CLLocationManager()
    var latitude: String = ""
    var longitude: String = ""
    var locationLink: String = "http://maps.apple.com/?ll="
    
    @IBOutlet weak var circleProgressView: CircleProgressView!

    var seconds = 0.0
    var timer = NSTimer()
    
    @IBOutlet weak var timerLabel: UILabel!
    
    //MARK: Methods

    @IBAction func isOkButtonClicked(sender: AnyObject) {
        timer.invalidate()
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        circleProgressView.trackFillColor = UIColor.blackColor()
        resetTime()
        manager.delegate = self
        manager.desiredAccuracy = kCLLocationAccuracyBest
        manager.requestWhenInUseAuthorization()
        manager.startUpdatingLocation()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func alert() {
        let alert = UIAlertController(
                title: "Emergency contacts have been contacted.",
                message: "Help is on the way.",
                preferredStyle: UIAlertControllerStyle.Alert)
        // change the handler to dismiss the view controller rather than reset the time
        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.Default, handler: {
            action in
            self.dismissViewControllerAnimated(true, completion: nil)
        }))

        presentViewController(alert, animated: true, completion:nil)

    }
        
    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location:CLLocation = locations[0] {
            latitude = String(location.coordinate.latitude)
            longitude = String(location.coordinate.longitude)
        }
    }
    
    func locationManager(manager: CLLocationManager, didFailWithError error: NSError) {
        print("Failed to find user's location: \(error.localizedDescription)")
    }

    func resetTime()  {
        seconds = 10.0
        timerLabel.text = "\(seconds)"
        circleProgressView.progress = Double(seconds)
        circleProgressView.progress = circleProgressView.progress

//        circleProgressView.setProgress(Double(seconds), animated: true)
        
        timer = NSTimer.scheduledTimerWithTimeInterval(1.0, target: self, selector: "subtractTime", userInfo: nil, repeats: true)
    }
    
    func subtractTime() {
        seconds--
        timerLabel.text = "\(seconds)"
        circleProgressView.progress = Double(seconds/10.0)
        print(circleProgressView.progress)
//        circleProgressView.setProgress(Double(seconds), animated: true)

        if seconds == 0.0 {
            timer.invalidate()
            alert()
        }
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
