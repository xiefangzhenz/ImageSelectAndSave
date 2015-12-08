//
//  ViewController.m
//  图片选择
//
//  Created by 谢方振 on 15/11/27.
//  Copyright © 2015年 谢方振. All rights reserved.
//

#import "ViewController.h"
#import "XFZPictureSelectVC.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    
}
- (IBAction)buttonAction:(id)sender {
    
    NSArray* arr = @[@"SPDB.PNG",@"ICBC.PNG",@"HXB.PNG",@"GDB.PNG",@"CMBC.PNG",@"CMB.PNG",@"CEB.PNG",@"CCB.PNG",@"BOC.PNG",@"BCM.PNG",@"ABC.PNG"];
    
    XFZPictureSelectVC* vc = [[XFZPictureSelectVC alloc]initWithPictureList:arr];
    
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
