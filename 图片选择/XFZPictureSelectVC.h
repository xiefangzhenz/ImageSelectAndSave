//
//  XFZPictureSelectVC.h
//  图片选择
//
//  Created by 谢方振 on 15/11/27.
//  Copyright © 2015年 谢方振. All rights reserved.
//
#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width
#define LineSpace 10
#import <UIKit/UIKit.h>
#import "XFZImageView.h"
@interface XFZPictureSelectVC : UIViewController

- (instancetype)initWithPictureList:(NSArray*)picList;
@end
