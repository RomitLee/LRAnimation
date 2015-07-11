//
//  ViewController.m
//  LRAnimation
//
//  Created by RomitLee on 15/5/19.
//  Copyright (c) 2015年 RomitLee. All rights reserved.
//

#import "ViewController.h"
#import "CoreAnimationEffect.h"
#define TonyColor(r, g, b, a) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:a]
#define Tony_app_color [UIColor colorWithRed:30/255.0 green:126/255.0 blue:237/255.0 alpha:1.0]

#define TonyRandomColor TonyColor(arc4random_uniform(256), arc4random_uniform(256), arc4random_uniform(256),1)
#define RGBCOLOR(r,g,b) [UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:1]

@interface ViewController ()
@property (nonatomic,strong) UIView *vivi;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor=TonyRandomColor;
    UIView *vivi=[[UIView alloc]initWithFrame:CGRectMake(100, 100, 100, 100)];
    vivi.backgroundColor=TonyRandomColor;
    
    
    UIButton *btn=[[UIButton alloc]initWithFrame:CGRectMake(100, 300, 100, 100)];
    [btn setTitle:@"戴逸" forState:UIControlStateNormal];
    
    [btn addTarget:self action:@selector(gyy) forControlEvents:UIControlEventTouchUpInside];
    
    [btn setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    UIPanGestureRecognizer *pen=[[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(push:)];
    [self.view addGestureRecognizer:pen];
    
    [self.view addSubview:btn];
    [self.view addSubview:vivi];
    self.vivi=vivi;
    
    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)push:(UIPanGestureRecognizer *)gest
{
    CGPoint point1 = [gest translationInView:self.view];
    CGPoint point2 = [gest velocityInView:self.view];
    NSLog(@"llllll%f,%f",point1.x,point1.y);
    NSLog(@"nnnnnn%f,%f",point2.x,point2.y);
    
//    [CoreAnimationEffect showAnimationType:kCATransitionFade
//                               withSubType:kCATransitionFromRight
//                                  duration:30
//                            timingFunction:kCAMediaTimingFunctionLinear
//                                      view:self.vivi];
    
    CATransition *animation = [CATransition animation];

    [animation setDuration:1.0f];

    [animation setTimingFunction:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear]];
    
    if(point1.x>50&&gest.state==UIGestureRecognizerStateEnded)
    {
        [animation setType:@"pageCurl"];
        [animation setSubtype:kCATransitionFromLeft];
        
        [self.view.layer addAnimation:animation forKey:@""];
        self.view.backgroundColor=TonyRandomColor;
    }
    if(point1.x<-50&&gest.state==UIGestureRecognizerStateEnded)
    {
        [animation setType:@"pageUnCurl"];
        [animation setSubtype:kCATransitionFromLeft];
        
        [self.view.layer addAnimation:animation forKey:@""];
        self.view.backgroundColor=TonyRandomColor;
    }
    
    
}

-(void)gyy
{
//    CGAffineTransform yy=CGAffineTransformScale(self.vivi.transform, 0.1, 0.1);
//    CGAffineTransform xx=CGAffineTransformRotate(yy, 3);
//    [UIView animateWithDuration:0.3 animations:^{
//        
//        
//        
//        
//        
//        
//        [self.vivi setTransform:xx];
//        
//    } completion:^(BOOL finished) {
//        [UIView animateWithDuration:0.3 animations:^{
//            CGAffineTransform x1=self.vivi.transform;
//            self.vivi.transform = CGAffineTransformRotate(CGAffineTransformScale(x1, 10, 10), -3);
//        }];
//    }];

    
    
    
    //[CoreAnimationEffect animationRotateAndScaleDownUp:self.vivi];
    //self.view.backgroundColor=TonyRandomColor;
    
    
    

    
    CGFloat duration = 3;
    
    //1、从白色变为灰色 程实原创
    CABasicAnimation *anim1 = [CABasicAnimation animationWithKeyPath:@"backgroundColor"];
    anim1.duration = duration;
    anim1.fromValue = (__bridge id)self.vivi.backgroundColor.CGColor;
    anim1.toValue = (__bridge id)TonyRandomColor.CGColor;
    //填充效果：动画结束后，动画将保持最后的表现状态
    anim1.fillMode = kCAFillModeForwards;
    anim1.removedOnCompletion = NO;
    anim1.beginTime = 0.0f;
    
    CABasicAnimation *anim2 = [CABasicAnimation animationWithKeyPath:@"backgroundColor"];
    anim2.duration = duration;
    anim2.fromValue = (__bridge id)self.vivi.backgroundColor.CGColor;
    anim2.toValue = (__bridge id)TonyRandomColor.CGColor;
    //填充效果：动画结束后，动画将保持最后的表现状态
    anim2.fillMode = kCAFillModeForwards;
    anim2.removedOnCompletion = NO;
    anim2.beginTime = 0.0f;
    
    
    
    //下面介绍一下fillMode这个枚举
//    kCAFillModeRemoved 动画结束后，将会移除掉做的动画效果
//    kCAFillModeForwards 动画结束后，动画将保持最后的表现状态
//    kCAFillModeBackwards 与kCAFillModeForwards相对应
//    kCAFillModeBoth 是kCAFillModeForwards和kCAFillModeBackwards的结合
//    kCAFillModeFrozen 4.0之后就不推荐使用了。
    
    
    
    [self.vivi.layer addAnimation:anim1 forKey:@"backgroundColor"];
}

@end
