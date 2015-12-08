//
//  XFZImageView.m
//  图片选择
//
//  Created by 谢方振 on 15/11/27.
//  Copyright © 2015年 谢方振. All rights reserved.
//
#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width
#define FRAME_WIDTH self.frame.size.width
#import "XFZImageView.h"
@interface XFZImageView(){
    
    UIImageView* _selectView;
    
    UIImageView* _imageView;
    
    UIImageView* _maskView;
    
    

}
@end

@implementation XFZImageView

- (instancetype)initWithFrame:(CGRect)frame withImage:(UIImage*)image
{
    self = [super initWithFrame:frame];
    
    if (self) {
        
        self.userInteractionEnabled = YES;
        
        _imageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, frame.size.width, frame.size.height)];
        
        _imageView.userInteractionEnabled = YES;
        
        _imageView.image = image;
        
        [self addSubview:_imageView];
        
        _maskView = [[UIImageView alloc]initWithFrame:CGRectMake(FRAME_WIDTH-15, 0, 15, 15)];
        
        _maskView.image = [UIImage imageNamed:@"icon_unselect.png"];
        
        _maskView.userInteractionEnabled = YES;
        
        [_imageView addSubview:_maskView];
        
        _selectView = [[UIImageView alloc]initWithFrame:CGRectMake(FRAME_WIDTH-15, 0, 15, 15)];
        _selectView.image = [UIImage imageNamed:@"icon_select.png"];
        
        _selectView.hidden = YES;
        
        _selectView.userInteractionEnabled = YES;
        
        [_imageView addSubview:_selectView];
    
        UITapGestureRecognizer* tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapAction:)];
        
        tap.numberOfTapsRequired = 1; //点击次数
        tap.numberOfTouchesRequired = 1; //点击手指数
        
        [_imageView addGestureRecognizer:tap];
        

    }
    return self;
}

- (void)tapAction:(UITapGestureRecognizer*)ges{
    
    _selectView.hidden = !_selectView.hidden;
    
    _isShow = !_selectView.hidden;

    
}
-(void)setIsShow:(BOOL)isShow{

    _isShow = isShow;
    
    _selectView.hidden = !isShow;

}


@end
