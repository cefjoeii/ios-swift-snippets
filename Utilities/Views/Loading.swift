// Loading.swift
// A utility class that shows a loading overlay on the screen
// Perfect for making the user wait for the server to respond
// You don't have to create it manually on the Storyboard over and over again
// Usage: Loading.shared.show(self.view); Loading.shared.hide()

import UIKit

public class Loading {
    var activityIndicator = UIActivityIndicatorView()
    
    class var shared: Loading {
        struct Static {
            static let instance: Loading = Loading()
        }
        return Static.instance
    }
    
    public func show(_ view: UIView) {
        activityIndicator.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height)
        activityIndicator.activityIndicatorViewStyle = .whiteLarge
        activityIndicator.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.3)
        activityIndicator.center = CGPoint(x: view.bounds.width / 2, y: view.bounds.height / 2)
        view.addSubview(activityIndicator)
        
        activityIndicator.startAnimating()
    }
    
    public func hide() {
        activityIndicator.stopAnimating()
    }
}
