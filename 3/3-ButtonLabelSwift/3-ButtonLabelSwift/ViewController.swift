//
//  ViewController.swift
//  3_ButtonLabelSwift
//
//  Created by dejin on 2017/5/19.
//  Copyright © 2017年 dejin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var statusLabel: UILabel!
    
    @IBAction func Click(_ sender: UIButton) {
        let title = sender.title(for: .normal)!
        let plainText = "\(title) button pressed."
        //statusLabel.text = plainText
        let styledText = NSMutableAttributedString(string: plainText)
        let attributes = [NSFontAttributeName:UIFont.boldSystemFont(ofSize: statusLabel.font.pointSize)]
        let nameRange = (plainText as NSString).range(of: title)
        styledText.setAttributes(attributes, range: nameRange)
        statusLabel.attributedText = styledText
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

