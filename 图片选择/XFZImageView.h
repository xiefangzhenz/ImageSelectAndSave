//
//  XFZImageView.h
//  图片选择
//
//  Created by 谢方振 on 15/11/27.
//  Copyright © 2015年 谢方振. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface XFZImageView : UIView
@property (nonatomic,assign)BOOL isShow;
@property (nonatomic,assign)NSInteger index;
- (instancetype)initWithFrame:(CGRect)frame withImage:(UIImage*)image;
@end
