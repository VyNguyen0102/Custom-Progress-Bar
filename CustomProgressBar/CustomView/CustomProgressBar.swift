//
//  CustomProgressBar.swift
//  CustomProgressBar
//
//  Created by Vy Nguyen on 5/17/17.
//  Copyright © 2017 VVLab. All rights reserved.
//

import UIKit

class CustomProgressBar: BaseCustomView {
    static let viewNibName = "CustomProgressBar"
    
    @IBOutlet weak var progressConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var rightView: UIView!
    @IBOutlet weak var leftView: UIView!
    @IBOutlet weak var centerView: UIView!
    @IBOutlet weak var coverView: UIView!
    
    @IBOutlet weak var topCover: UIView!
    @IBOutlet weak var bottomCover: UIView!
    
    var greenColor =  UIColor.init(red: 44.0/255.0, green: 242.0/255.0, blue: 238.0/255.0, alpha: 1.0)
    var lightGreenColor =  UIColor.init(red: 64.0/255.0, green: 255.0/255.0, blue: 255.0/255.0, alpha: 1.0)
    //var blueColor = UIColor.init(red: 60.0/255.0, green: 100.0/255.0, blue: 146.0/255.0, alpha: 1.0)
    var blueColor = UIColor.init(red: 58.0/255.0, green: 100.0/255.0, blue: 244.0/255.0, alpha: 0.9)
    var blueColorClear = UIColor.init(red: 50.0/255.0, green: 90.0/255.0, blue: 136.0/255.0, alpha: 1.0)
    
    override func getNibName() -> String {
        return CustomProgressBar.viewNibName
    }
    
    override func layoutSubviews() {
        
        super.layoutSubviews()
        layoutLayer()
    }
    func layoutLayer(){
        clipsToBounds = true
        
        let topGradient = CAGradientLayer()
        topGradient.frame = CGRect.init(origin: CGPoint.zero, size: topCover.bounds.size)
        topGradient.colors = [UIColor.clear.cgColor, blueColorClear.cgColor]
        topCover.layer.insertSublayer(topGradient, at: 0)
        
        let bottomGradient = CAGradientLayer()
        bottomGradient.frame = CGRect.init(origin: CGPoint.zero, size: bottomCover.bounds.size)
        bottomGradient.colors = [blueColorClear.cgColor, UIColor.clear.cgColor]
        bottomCover.layer.insertSublayer(bottomGradient, at: 0)
        
        let leftToRightGradient = CAGradientLayer()
        leftToRightGradient.startPoint = CGPoint.init(x: 0.0, y: 0.5)
        leftToRightGradient.endPoint = CGPoint.init(x: 1.0, y: 0.5)
        leftToRightGradient.frame = leftView.bounds
        print(leftView.bounds)
        leftToRightGradient.colors = [blueColor.cgColor,lightGreenColor.cgColor, greenColor.cgColor]
        
        leftView.layer.insertSublayer(leftToRightGradient, at: 0)
        
        let rightToLeftGradient = CAGradientLayer()
        rightToLeftGradient.startPoint = CGPoint.init(x: 0.0, y: 0.5)
        rightToLeftGradient.endPoint = CGPoint.init(x: 1.0, y: 0.5)
        rightToLeftGradient.frame = rightView.bounds
        rightToLeftGradient.colors = [greenColor.cgColor,lightGreenColor.cgColor, blueColor.cgColor]
        
        rightView.layer.insertSublayer(rightToLeftGradient, at: 0)
    }
    
    override func loadingViewComplete(childView: UIView) {
        
    }

    func setProgress(progress : CGFloat){
        if let progressConstraint = self.progressConstraint {
            UIView.transition(with: self, duration: 0.15, options: UIViewAnimationOptions.layoutSubviews, animations: {
                progressConstraint.constant = progress * self.bounds.size.width
                self.layoutIfNeeded()
            }, completion: nil)
            
        }
    }
}
