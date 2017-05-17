//
//  BaseCustomView.swift
//  CustomProgressBar
//
//  Created by Vy Nguyen on 4/27/17.
//  Copyright © 2017 VVLab. All rights reserved.
//

import Foundation
import UIKit

// In almost all cases we can use View Controller instead of Custom View.
// But in this project i still need to do it.
// You can add it to View controller xib file :)

class BaseCustomView : UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        load()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        load()
    }
    
    func getNibName() -> String {
        fatalError("getNibName(): You should override this shit ! ")
        //Don't forget set file owner in xib file
    }
    
    func load() {
        let bundle = Bundle.init(for:BaseCustomView.self)
        let nib = UINib(nibName: getNibName(), bundle: bundle)
        let views = nib.instantiate(withOwner: self, options: nil)
        let childView = views[0] as! UIView
        
        addConstrainOverlay(childView: childView, toView: self)
        loadingViewComplete(childView: childView)
        
    }
    
    func loadingViewComplete(childView : UIView){
        
    }
    
    func addConstrainOverlay(childView: UIView, toView parentView :UIView){
        childView.bounds = parentView.bounds // use for non auto layout project.
        parentView.addSubview(childView)
        childView.translatesAutoresizingMaskIntoConstraints = false
        
        let topConstraint = NSLayoutConstraint(item: childView,
                                               attribute: NSLayoutAttribute.top,
                                               relatedBy: NSLayoutRelation.equal,
                                               toItem: parentView,
                                               attribute: NSLayoutAttribute.top,
                                               multiplier: 1, constant: 0)
        let leftConstraint = NSLayoutConstraint(item: childView,
                                                attribute: NSLayoutAttribute.left,
                                                relatedBy: NSLayoutRelation.equal,
                                                toItem: parentView,
                                                attribute: NSLayoutAttribute.left,
                                                multiplier: 1, constant: 0)
        let rightConstraint = NSLayoutConstraint(item: childView,
                                                 attribute: NSLayoutAttribute.right,
                                                 relatedBy: NSLayoutRelation.equal,
                                                 toItem: parentView,
                                                 attribute: NSLayoutAttribute.right,
                                                 multiplier: 1, constant: 0)
        let bottomConstraint = NSLayoutConstraint(item: childView,
                                                  attribute: NSLayoutAttribute.bottom,
                                                  relatedBy: NSLayoutRelation.equal,
                                                  toItem: parentView,
                                                  attribute: NSLayoutAttribute.bottom,
                                                  multiplier: 1, constant: 0)
        
        parentView.addConstraints([topConstraint, leftConstraint, rightConstraint, bottomConstraint])
    }
}
