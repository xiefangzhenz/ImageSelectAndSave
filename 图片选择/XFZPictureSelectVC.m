//
//  XFZPictureSelectVC.m
//  图片选择
//
//  Created by 谢方振 on 15/11/27.
//  Copyright © 2015年 谢方振. All rights reserved.
//

#import "XFZPictureSelectVC.h"

@interface XFZPictureSelectVC ()
{

    NSMutableArray* _picList;
    


}
@end

@implementation XFZPictureSelectVC

- (instancetype)initWithPictureList:(NSArray*)picList
{
    
    if (self = [super init]) {
        
        _picList = [[NSMutableArray alloc]initWithArray:picList];
        
        //[self createUI];
    }
    
    
    return self;
}

- (void)createUI{

    for (int i=0; i<_picList.count; i++){
        
        XFZImageView* imageView = [[XFZImageView alloc]initWithFrame:CGRectMake((i%3)*(SCREEN_WIDTH-LineSpace*4)/3+(i%3+1)*LineSpace,(i/3)*(SCREEN_WIDTH-LineSpace*4)/3+(i/3+1)*LineSpace+64,(SCREEN_WIDTH-LineSpace*4)/3,(SCREEN_WIDTH-LineSpace*4)/3) withImage:[UIImage imageNamed:_picList[i]]];
        
        
        imageView.index = i;
        
        [self.view addSubview:imageView];
        
    }
    
    UIView* bottomView = [[UIView alloc]initWithFrame:CGRectMake(0, [UIScreen mainScreen].bounds.size.height-30, SCREEN_WIDTH, 30)];
    bottomView.backgroundColor = [UIColor grayColor];
    [self.view addSubview:bottomView];
    
    UILabel* label = [[UILabel alloc]initWithFrame:CGRectMake(SCREEN_WIDTH-50, 0, 30, 30)];
    label.text = @"全选";
    label.font = [UIFont systemFontOfSize:10];
    [bottomView addSubview:label];
    
    UIButton* button = [[UIButton alloc]initWithFrame:CGRectMake(SCREEN_WIDTH-80, 0, 30, 30)];
    [button setImage:[UIImage imageNamed:@"icon_unselect.png"] forState:UIControlStateNormal];
    [button setImage:[UIImage imageNamed:@"icon_select.png"] forState:UIControlStateSelected];
    [button addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
    [bottomView addSubview:button];
    
    UIButton* rightButton = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 40, 40)];
    
    [rightButton addTarget:self action:@selector(saveAction) forControlEvents:UIControlEventTouchUpInside];
    
    rightButton.backgroundColor = [UIColor whiteColor];
    
    [rightButton setTitle:@"保存" forState:UIControlStateNormal];
    
    [rightButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    
    UIBarButtonItem* item = [[UIBarButtonItem alloc]initWithCustomView:rightButton];
    
    self.navigationItem.rightBarButtonItem = item;

}

- (void)buttonAction:(UIButton*)sender{


    UIButton* button = (UIButton*)sender;
    
    button.selected = !button.selected;
    
    [self allSelect:button.selected];


}

- (void)saveAction{


    NSMutableArray* arr = [[NSMutableArray alloc]init];
    
    [self.view.subviews enumerateObjectsUsingBlock:^(__kindof UIView * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        
        if ([obj isKindOfClass:[XFZImageView class]]) {
            
            XFZImageView* view = (XFZImageView*)obj;
            
            if (view.isShow) {
                
                [arr addObject:[NSString stringWithFormat:@"%ld",view.index]];
            }
            
            
        }
        
    }];
    
    NSLog(@"%@",arr);


}
- (void)allSelect:(BOOL)isSelect{

    for (XFZImageView* view in self.view.subviews) {
        
        
        if ([view isKindOfClass:[XFZImageView class]]) {
            
            
            view.isShow = isSelect;
        }
    }
    
    


}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self createUI];

    
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
