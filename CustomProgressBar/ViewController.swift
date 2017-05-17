//
//  ViewController.swift
//  CustomProgressBar
//
//  Created by Vy Nguyen on 5/17/17.
//  Copyright © 2017 VVLab. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var progressBar: CustomProgressBar!
    @IBOutlet weak var btnClickHere: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        startProgress()
        
        //progressBar.setProgress(progress: 0.5)
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    
    @IBAction func click(_ sender: Any) {
        startProgress()
    }
    func startProgress(){
        let progressList:[CGFloat] = [0.1,0.2,0.4,0.3,0.5,0.3,1.0]
        DispatchQueue.global(qos: .userInitiated).async {
            for progress in progressList{
                usleep(200000)
                DispatchQueue.main.async {
                    self.progressBar.setProgress(progress: progress)
                }
            }
            
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

