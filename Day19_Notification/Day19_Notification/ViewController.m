//
//  ViewController.m
//  Day19_Notification
//
//  Created by Xingtan Hu on 2/1/16.
//  Copyright © 2016 Xingtan Hu. All rights reserved.
//

#import "ViewController.h"
#import "SecondViewController.h"

@interface ViewController ()
@property (strong, nonatomic) IBOutlet UILabel *lbltext;
- (IBAction)btn_tapped:(id)sender;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.lbltext.text = @"First";
    
    
}

-(void)viewWillAppear:(BOOL)animated{
    
    
    [self registerLocalNotification];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(updateUILabelText:) name:@"KUpdateFirst" object:nil];

}


#pragma -mark Implement UIlocal Notification
-(void)registerLocalNotification{
    UILocalNotification *local = [[UILocalNotification alloc]init];
    if(local){
        local.fireDate = [NSDate date];
        local.timeZone = [NSTimeZone defaultTimeZone];
        local.soundName = UILocalNotificationDefaultSoundName;
        local.repeatInterval = kCFCalendarUnitMinute;
        local.alertBody = @"My Alert Local Notification";
        
    }
    
    
    [[UIApplication sharedApplication]scheduleLocalNotification:local];
    [[UIApplication sharedApplication]presentLocalNotificationNow:local];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)updateUILabelText:(NSNotification*)notify{
    
    self.lbltext.text = @"Second";
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Alert" message:@"hello" preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *okAlert = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
    }];
    
    [alert addAction:okAlert];
    [self presentViewController:alert animated:YES completion:nil];
    //[[NSNotificationCenter defaultCenter] removeObserver:self name:@"KUpdateFirst" object:nil];
}

- (IBAction)btn_tapped:(id)sender {
    SecondViewController *controller2 = [self.storyboard instantiateViewControllerWithIdentifier:@"vc2"];
    [self.navigationController pushViewController:controller2 animated:YES];
}
@end
