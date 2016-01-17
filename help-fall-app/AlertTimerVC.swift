//
//  AlertTimerVC.swift
//  help-fall-app
//
//  Created by Simon Quach on 2016-01-16.
//  Copyright © 2016 Simon Quach. All rights reserved.
//

import UIKit

class AlertTimerVC: UIViewController {
    
    //MARK: Properties
    
    @IBOutlet weak var circleProgressView: CircleProgressView!

    var seconds = 0
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
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func alert() {
        let alert = UIAlertController(
                title: "Emergency contacts will be contacted",
                message: "They will be with you shortly",
                preferredStyle: UIAlertControllerStyle.Alert)
        
        // change the handler to dismiss the view controller rather than reset the time
        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.Default, handler: {
            action in self.resetTime()
        }))
        
        presentViewController(alert, animated: true, completion:nil)

    }
    
    func resetTime()  {
        seconds = 10
        timerLabel.text = "\(seconds)"
        circleProgressView.progress = Double(seconds)
//        circleProgressView.setProgress(Double(seconds), animated: true)
        
        timer = NSTimer.scheduledTimerWithTimeInterval(1.0, target: self, selector: "subtractTime", userInfo: nil, repeats: true)
    }
    
    func subtractTime() {
        seconds--
        timerLabel.text = "\(seconds)"
//        circleProgressView.progress = Double(seconds)
        circleProgressView.setProgress(Double(seconds), animated: true)

        if seconds == 0 {
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
