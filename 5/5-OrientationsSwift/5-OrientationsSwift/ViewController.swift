//
//  ViewController.swift
//  5-OrientationsSwift
//
//  Created by dejin on 2017/7/23.
//  Copyright © 2017年 dejin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    /*
    override func supportedInterfaceOrientations() -> Int {
        return Int(UIInterfaceOrientationMask.portrait.rawValue)
                | Int(UIInterfaceOrientationMask.landscapeLeft.rawValue)
    }
    */
    private var _orientations = UIInterfaceOrientationMask.landscapeLeft
    override var supportedInterfaceOrientations : UIInterfaceOrientationMask {
        get { return self._orientations }
        set { self._orientations = newValue }
    }
    

}

