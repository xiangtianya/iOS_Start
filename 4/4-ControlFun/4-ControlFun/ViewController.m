//
//  ViewController.m
//  4-ControlFun
//
//  Created by dejin on 2017/5/28.
//  Copyright © 2017年 dejin. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UITextField *NameTextField;
@property (weak, nonatomic) IBOutlet UITextField *NumberTextField;
@property (weak, nonatomic) IBOutlet UILabel *sliderLabel;
@property (weak, nonatomic) IBOutlet UISwitch *leftSwitch;
@property (weak, nonatomic) IBOutlet UISwitch *rightSwitch;
@property (weak, nonatomic) IBOutlet UIButton *doSomethingButton;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.sliderLabel.text = @"50";
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction) textFieldDoneEditing: (id)sender {
    [sender resignFirstResponder];
}
- (IBAction)backgroundTap:(UIControl *)sender {
    [self.NameTextField resignFirstResponder];
    [self.NumberTextField resignFirstResponder];
}
- (IBAction)sliderChanged:(UISlider *)sender {
    int _progress = (int)lroundf(sender.value);
    self.sliderLabel.text = [NSString stringWithFormat:@"%d", _progress];
}

- (IBAction)switchChanged:(UISwitch *)sender {
    BOOL settings = sender.isOn;
    [self.leftSwitch setOn:settings animated:YES];
    [self.rightSwitch setOn:settings animated:YES];
    
}
- (IBAction)toggleControls:(UISegmentedControl *)sender {
    BOOL isSelect = sender.selectedSegmentIndex == 0 ? true : false;
    self.leftSwitch.hidden = !isSelect;
    self.rightSwitch.hidden = !isSelect;
    self.doSomethingButton.hidden = isSelect;
    
}
- (IBAction)buttonPressed:(UIButton *)sender {
    UIAlertController *controller = [UIAlertController alertControllerWithTitle:@"Are You Sure?" message:nil preferredStyle:UIAlertControllerStyleActionSheet];
    UIAlertAction *yesAction = [UIAlertAction actionWithTitle:@"Yes, I'm sure!" style:UIAlertActionStyleDestructive handler:^(UIAlertAction *action){
        NSString *msg;
        if([self.NameTextField.text length] > 0){
            msg = [NSString stringWithFormat:@"You can breathe easy, %@, everything went OK.", self.NameTextField.text];
        } else {
            msg = @"You can breathe easy, everything went OK.";
        }
        UIAlertController *controller2 = [UIAlertController alertControllerWithTitle:@"Something Was Done" message:msg preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"Phew!" style:UIAlertActionStyleCancel handler:nil];
        [controller2 addAction:cancelAction];
        [self presentViewController:controller2 animated:YES completion:nil];

    }];
    
    UIAlertAction *noAction = [UIAlertAction actionWithTitle:@"No Way!" style:UIAlertActionStyleCancel handler:nil];
    [controller addAction:yesAction];
    [controller addAction:noAction];
    
    UIPopoverPresentationController *ppc = controller.popoverPresentationController;
    if(ppc != nil){
        ppc.sourceView = sender;
        ppc.sourceRect = sender.bounds;
    }
    [self presentViewController:controller animated:YES completion:nil];
}


@end
