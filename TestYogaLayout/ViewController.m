//
//  ViewController.m
//  TestYogaLayout
//
//  Created by HaiYiSoft on 2018/1/18.
//  Copyright © 2018年 HaiYiM+. All rights reserved.
//

#import "ViewController.h"
#import "UIView+Yoga.h"

@interface ViewController (){
    
    UIView * contentview0 ;
    UIView * contentview1  ;
    UIView * contentview2 ;
    UIView * contentview3 ;
    
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
//    UIScrollView * mainScrollview = [[UIScrollView alloc] init];
//    mainScrollview.pagingEnabled = YES;
//    [self.view addSubview:mainScrollview];
//    [mainScrollview configureLayoutWithBlock:^(YGLayout * _Nonnull layout) {
//        layout.isEnabled = YES;
//        layout.flexDirection  = YGFlexDirectionRow;
//        layout.alignItems = YGAlignStretch;
//        layout.height = YGPointValue([UIScreen mainScreen].bounds.size.height);
//
//    }];
//
//     contentview0 = [[UIView alloc] init];
//    contentview0.backgroundColor = [UIColor lightGrayColor];
//     contentview1  = [[UIView alloc] init];
//    contentview1.backgroundColor = [UIColor purpleColor];
//     contentview2 = [[UIView alloc] init];
//    contentview2.backgroundColor = [UIColor yellowColor];
//     contentview3 = [[UIView alloc] init];
//    contentview3.backgroundColor = [UIColor blueColor];
//
//    [mainScrollview addSubview:contentview0];
//    [mainScrollview addSubview:contentview1];
//    [mainScrollview addSubview:contentview2];
//    [mainScrollview addSubview:contentview3];
//
//    YGLayoutConfigurationBlock configureBlock = ^(YGLayout * layout){
//        layout.isEnabled = YES;
//        layout.height   = YGPointValue([UIScreen mainScreen].bounds.size.height);
//        layout.width   = YGPointValue([UIScreen mainScreen].bounds.size.width);
//
//    };
//    [contentview0 configureLayoutWithBlock:configureBlock];
//    [contentview1 configureLayoutWithBlock:configureBlock];
//    [contentview2 configureLayoutWithBlock:configureBlock];
//    [contentview3 configureLayoutWithBlock:configureBlock];
//
//    [self.view configureLayoutWithBlock:^(YGLayout * _Nonnull  layout) {
//        layout.isEnabled = YES;
//        layout.justifyContent = YGJustifyCenter;
//        layout.alignItems     = YGAlignStretch;
//
//    }];
//
//    [self.view.yoga applyLayoutPreservingOrigin:YES];
//
//    mainScrollview.contentSize = CGSizeMake(contentview0.bounds.size.width * 4, contentview0.bounds.size.height);
//    [self configure];
//    [self configure2];
//    [self configure3];
//    [self configure4];
//    [self configure5];
//    [self configure6];
      [self configure7];
}


//九宫格
- (void)configure7 {
    UIView *baseClassView = [[UIView alloc] initWithFrame:CGRectZero];
    baseClassView.backgroundColor = [UIColor whiteColor];
    [baseClassView configureLayoutWithBlock:^(YGLayout * layout) {
       layout.isEnabled = YES;
       layout.marginTop = YGPointValue(64);
       layout.width = YGPointValue(self.view.frame.size.width);
       layout.height = YGPointValue(self.view.frame.size.height);
       layout.justifyContent = YGJustifyFlexStart;
       layout.flexDirection = YGFlexDirectionColumn;
    }];
    [self.view addSubview:baseClassView];
    NSArray *arr = [NSArray arrayWithObjects:@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",nil];
    UIView *templateView = [[UIView alloc] initWithFrame:CGRectZero];
    templateView.backgroundColor = [UIColor greenColor];
    [templateView configureLayoutWithBlock:^(YGLayout * layout) {
        layout.isEnabled = YES;
        layout.flexDirection = YGFlexDirectionRow;
        layout.height = YGPointValue(50*(arr.count/3));
        layout.width = YGPointValue(self.view.frame.size.width);
        layout.flexWrap = YGWrapWrap;
    }];
    [baseClassView addSubview:templateView];
    
    for (NSString *str in arr) {
        UIView *view = [[UIView alloc] initWithFrame:CGRectZero];
        view.backgroundColor = [UIColor redColor];
        [view configureLayoutWithBlock:^(YGLayout * layout) {
            layout.isEnabled = YES;
            layout.width = YGPointValue(self.view.frame.size.width/3);
            layout.height = YGPointValue(50);
        }];
        [templateView addSubview:view];
        
        UILabel *lbl = [[UILabel alloc] initWithFrame:CGRectZero];
        lbl.text = str;
        lbl.layer.borderWidth = 1;
        lbl.textAlignment = NSTextAlignmentCenter;
        [lbl configureLayoutWithBlock:^(YGLayout * layout) {
            layout.isEnabled = YES;
            layout.flexGrow = 1.0;
//            layout.padding = YGPointValue(0);
        }];
        [view addSubview:lbl];
    }
    [baseClassView.yoga applyLayoutPreservingOrigin:NO];
}


/** 均分 */
-(void)configure6{
     UIView *baseClassView = [[UIView alloc] initWithFrame:CGRectZero];
     baseClassView.backgroundColor = [UIColor whiteColor];
     [baseClassView configureLayoutWithBlock:^(YGLayout * layout) {
        layout.isEnabled = YES;
        layout.marginTop = YGPointValue(64);
        layout.width = YGPointValue(self.view.frame.size.width);
        layout.height = YGPointValue(self.view.frame.size.height);
        layout.justifyContent = YGJustifyFlexStart;
        layout.flexDirection = YGFlexDirectionColumn;
     }];
     [self.view addSubview:baseClassView];
    //均分view
     UIView *view1 = [[UIView alloc] initWithFrame:CGRectZero];
           view1.backgroundColor = [UIColor redColor];
           [view1 configureLayoutWithBlock:^(YGLayout * layout) {
               layout.isEnabled = YES;
               layout.flexGrow = 1.0;
           }];
     [baseClassView addSubview:view1];
           
       UIView *view2 = [[UIView alloc] initWithFrame:CGRectZero];
       view2.backgroundColor = [UIColor cyanColor];
       [view2 configureLayoutWithBlock:^(YGLayout * layout) {
           layout.isEnabled = YES;
           layout.flexGrow = 1.0;
       }];
       [baseClassView addSubview:view2];
       
       UIView *view3 = [[UIView alloc] initWithFrame:CGRectZero];
       view3.backgroundColor = [UIColor brownColor];
       [view3 configureLayoutWithBlock:^(YGLayout * layout) {
           layout.isEnabled = YES;
           layout.flexGrow = 1.0;
       }];
       [baseClassView addSubview:view3];
       
       [baseClassView.yoga applyLayoutPreservingOrigin:NO];
}

/** 自动lable */
-(void)configure5{
    UIView *view = [[UIView alloc] initWithFrame:CGRectZero];
    view.backgroundColor = [UIColor redColor];
    [view configureLayoutWithBlock:^(YGLayout * layout) {
        layout.isEnabled = YES;
        layout.marginTop = YGPointValue(64);
        layout.width = YGPointValue(self.view.frame.size.width);
        layout.height = YGPointValue(self.view.frame.size.width);
        layout.justifyContent = YGJustifyFlexStart;
    }];
    [self.view addSubview:view];
    
    //测试容器
    UIView *templateView = [[UIView alloc] initWithFrame:CGRectZero];
    templateView.backgroundColor = [UIColor yellowColor];
    [templateView configureLayoutWithBlock:^(YGLayout * layout) {
        layout.isEnabled = YES;
        layout.flexDirection = YGFlexDirectionRow;
        layout.width = YGPointValue(self.view.frame.size.width - 50);
        layout.height = YGPointValue(100);
    }];
    [view addSubview:templateView];
    
    UILabel *variableLbl = [[UILabel alloc] initWithFrame:CGRectZero];
    variableLbl.backgroundColor = [UIColor greenColor];
    variableLbl.text = @"文本";
    [variableLbl configureLayoutWithBlock:^(YGLayout * layout) {
        layout.isEnabled = YES;
        layout.flexGrow = 0;
    }];
    [templateView addSubview:variableLbl];
    
    UIView *tagView = [[UIView alloc] initWithFrame:CGRectZero];
    tagView.backgroundColor = [UIColor orangeColor];
    [tagView configureLayoutWithBlock:^(YGLayout * layout) {
        layout.isEnabled = YES;
        layout.flexGrow = 1.0;
        layout.flexDirection = YGFlexDirectionRowReverse;
    }];
    [templateView addSubview:tagView];
    
    UILabel *variableLbl1 = [[UILabel alloc] initWithFrame:CGRectZero];
    variableLbl1.backgroundColor = [UIColor yellowColor];
    variableLbl1.text = @"文本文本文本文本文本";
    [variableLbl1 configureLayoutWithBlock:^(YGLayout * layout) {
        layout.isEnabled = YES;
        layout.flexGrow = 0;
    }];
    [tagView addSubview:variableLbl1];
    
    [view.yoga applyLayoutPreservingOrigin:NO];

}
//UIscrollview 自动计算contentsize
-(void)configure4{
    [contentview3 configureLayoutWithBlock:^(YGLayout * _Nonnull layout) {
        layout.isEnabled = YES;
        layout.justifyContent = YGJustifyCenter;
        layout.alignItems = YGAlignStretch;
    }];
    UIScrollView * scrollview = [[UIScrollView alloc] init];
    [contentview3 addSubview:scrollview];
    
    scrollview.backgroundColor = [UIColor lightGrayColor];
    [scrollview configureLayoutWithBlock:^(YGLayout * _Nonnull layout) {
        layout.isEnabled = YES;
        layout.flexDirection = YGFlexDirectionColumn;//关键代码
        layout.height = YGPointValue([UIScreen mainScreen].bounds.size.height);
        
    }];
    
    UIView * contentview = [[UIView alloc] init];
    [scrollview addSubview:contentview];
    
    [contentview configureLayoutWithBlock:^(YGLayout * _Nonnull layout) {
        layout.isEnabled = YES;
        layout.alignItems = YGAlignCenter;
//        layout.flexDirection = YGFlexDirectionColumn;
//        layout.padding       = YGPointValue(5);
    }];
    
    for ( int i = 1 ; i <= 20 ; ++i )
    {
        UIView *item = [UIView new];
        item.backgroundColor = [UIColor colorWithHue:( arc4random() % 256 / 256.0 )
                                          saturation:( arc4random() % 128 / 256.0 ) + 0.5
                                          brightness:( arc4random() % 128 / 256.0 ) + 0.5
                                               alpha:1];
        [item configureLayoutWithBlock:^(YGLayout *layout) {
            layout.isEnabled = YES;
            layout.height = YGPointValue(20*i) ;
            layout.width = YGPointValue([UIScreen mainScreen].bounds.size.width - 20);
            layout.marginLeft = YGPointValue(10);
            layout.marginRight = YGPointValue(10);

        }];
        [contentview addSubview:item];
    }
    
    
    [contentview3.yoga applyLayoutPreservingOrigin:YES];
    scrollview.contentSize = contentview.bounds.size;//关键代码

    
}

//左右布局 自适应宽度
-(void)configure3{
    UIView * firstview = [UIView new];
    firstview.backgroundColor = [UIColor lightGrayColor];
    UIView * secondview = [UIView new];
    secondview.backgroundColor = [UIColor redColor];
    [contentview2 addSubview:firstview];
    [contentview2 addSubview:secondview];
    
    
    [contentview2 configureLayoutWithBlock:^(YGLayout * _Nonnull layout) {
        layout.isEnabled = YES;
        layout.flexDirection = YGFlexDirectionRow;//关键
        layout.alignItems    =  YGAlignCenter;
        layout.paddingHorizontal = YGPointValue(5);//关键
    }];
    
    YGLayoutConfigurationBlock configureBlock = ^(YGLayout * layout){
        layout.isEnabled = YES;
        layout.flexGrow = 1;//关键
        layout.height   = YGPointValue(100);
        layout.marginHorizontal = YGPointValue(5);//关键
    };
    [firstview configureLayoutWithBlock:configureBlock];
    [secondview configureLayoutWithBlock:configureBlock];
    [contentview2.yoga applyLayoutPreservingOrigin:YES];
    
    
}

//由上而下的布局
-(void)configure2{
    
    [contentview1 configureLayoutWithBlock:^(YGLayout * _Nonnull layout) {
       
        layout.isEnabled = YES;
        layout.alignItems = YGAlignCenter;
        layout.justifyContent = YGJustifySpaceBetween;
//        layout.paddingVertical = YGPointValue(10);
        
    }];
    
    for (int i = 0; i < 5 ; i++) {
        
        UIView * item = [UIView new];
        
        [contentview1 addSubview:item];
        
        item.backgroundColor = [UIColor colorWithHue:( arc4random() % 256 / 256.0 )
                                          saturation:( arc4random() % 128 / 256.0 ) + 0.5
                                          brightness:( arc4random() % 128 / 256.0 ) + 0.5
                                               alpha:1];
        [item configureLayoutWithBlock:^(YGLayout * _Nonnull layout) {
           
            layout.isEnabled = YES;
            layout.width = YGPointValue( 10 * i );
            layout.height = layout.width;
        }];
        
    }
    [contentview1.yoga applyLayoutPreservingOrigin:YES];
    
}



/*内外嵌套view*/
-(void)configure{
    UIView * firstview = [UIView new];
    firstview.backgroundColor = [UIColor blueColor];
    UIView * secondview = [UIView new];
    secondview.backgroundColor = [UIColor redColor];
    [contentview0 addSubview:firstview];
    [firstview addSubview:secondview];
    /*** ========================设置居中======================== ***/
    [contentview0 configureLayoutWithBlock:^(YGLayout * _Nonnull layout) {
        layout.isEnabled = YES;
        layout.justifyContent = YGJustifyCenter;
        layout.alignItems     = YGAlignCenter;
    }];
    
    [firstview configureLayoutWithBlock:^(YGLayout * _Nonnull layout) {
        layout.isEnabled = YES;
        layout.width = layout.height = YGPointValue(100);
        
        
    }];
    [secondview configureLayoutWithBlock:^(YGLayout * _Nonnull layout) {
        layout.isEnabled = YES;
//        layout.width = layout.height = YGPointValue(80);
        layout.margin = YGPointValue(10);//关键
        layout.flexGrow = 1;//关键
        
    }];
    
    [contentview0.yoga applyLayoutPreservingOrigin:YES];

    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
