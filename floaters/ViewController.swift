//
//  ViewController.swift
//  floaters
//
//  Created by Razvigor Andreev on 2/8/16.
//  Copyright © 2016 Razvigor Andreev. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var densityLabel: UILabel!
    @IBOutlet weak var floaterView: Floater!
    @IBAction func startTapped(_ sender: Any) {
        floaterView.startAnimation()
    }
    
    @IBAction func endTapped(_ sender: Any) {
        floaterView.stopAnimation()
    }
    
    @IBAction func plusTapped(_ sender: Any) {
        floaterView.density += 1
        densityLabel.text = "\(floaterView.density)"
    }
    
    @IBAction func minusTapped(_ sender: Any) {
        floaterView.density -= 1
        densityLabel.text = "\(floaterView.density)"
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        densityLabel.text = "\(floaterView.density)"
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

