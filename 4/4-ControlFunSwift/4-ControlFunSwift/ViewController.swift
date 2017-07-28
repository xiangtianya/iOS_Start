//
//  ViewController.swift
//  4-ControlFunSwift
//
//  Created by dejin on 2017/5/28.
//  Copyright © 2017年 dejin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var NameTextField: UITextField!
    @IBOutlet weak var NumberTextField: UITextField!
    @IBOutlet weak var sliderLabel: UILabel!
    @IBOutlet weak var leftSwitch: UISwitch!
    @IBOutlet weak var rightSwitch: UISwitch!
    @IBOutlet weak var doSomethingButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        sliderLabel.text = "50"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func textFieldDoneEditing(_ sender : UITextField){
        sender.resignFirstResponder()
    }

    @IBAction func backgroundTap(_ sender: UIControl) {
        NameTextField.resignFirstResponder()
        NumberTextField.resignFirstResponder()
    }
    
    @IBAction func sliderChanged(_ sender: UISlider) {
        let _progress = lroundf(sender.value)
        sliderLabel.text = "\(_progress)"
    }
    
    @IBAction func switchChanged(_ sender: UISwitch) {
        let setting = sender.isOn
        leftSwitch.setOn(setting, animated: true)
        rightSwitch.setOn(setting, animated: true)
        
    }
    
    @IBAction func toggleControls(_ sender: UISegmentedControl) {
        let isSelect = sender.selectedSegmentIndex == 0 ? true : false
        
        leftSwitch.isHidden = !isSelect
        rightSwitch.isHidden = !isSelect
        doSomethingButton.isHidden = isSelect
        
        
    }
    
    @IBAction func buttonPressed(_ sender: UIButton) {
        let controller = UIAlertController(title: "Are You Sure?", message: nil, preferredStyle: .actionSheet)
        
        let yesAction = UIAlertAction(title: "Yes, I'm sure!", style: .destructive, handler: { action in
            let msg = self.NameTextField.text!.isEmpty
                ? "You can breathe easy, everything went OK." : "You can breathe easy, \(self.NameTextField.text!),"
            + " everything went OK."
         
        let controller2 = UIAlertController(title: "Something Was Done", message: msg, preferredStyle:.alert)
        let cancelAction = UIAlertAction(title: "Phew!", style: .cancel, handler: nil)
        controller2.addAction(cancelAction)
            
        self.present(controller2, animated:true, completion:nil)
            
        })
        
        let noAction = UIAlertAction(title: "No way!", style: .cancel, handler: nil)
        
        controller.addAction(yesAction)
        controller.addAction(noAction)
        
        if let ppc = controller.popoverPresentationController {
            ppc.sourceView = sender
            ppc.sourceRect = sender.bounds
            ppc.permittedArrowDirections = .down
            
        }
        
        present(controller, animated:true, completion:nil)
    }
    
}

