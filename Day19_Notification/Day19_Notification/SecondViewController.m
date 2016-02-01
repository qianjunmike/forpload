//
//  SecondViewController.m
//  Day19_Notification
//
//  Created by Xingtan Hu on 2/1/16.
//  Copyright © 2016 Xingtan Hu. All rights reserved.
//

#import "SecondViewController.h"

@interface SecondViewController ()
- (IBAction)btn_tapped:(id)sender;

@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)btn_tapped:(id)sender {
    [[NSNotificationCenter defaultCenter] postNotificationName:@"KUpdateFirst" object:nil];
    [self.navigationController popViewControllerAnimated:YES];
}
@end
