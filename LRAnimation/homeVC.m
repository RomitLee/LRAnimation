//
//  homeVC.m
//  LRAnimation
//
//  Created by RomitLee on 15/5/21.
//  Copyright (c) 2015年 RomitLee. All rights reserved.
//

#import "homeVC.h"
#import "HomeCell.h"
#import "CoreAnimationEffect.h"
#define TonyColor(r, g, b, a) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:a]
#define Tony_app_color [UIColor colorWithRed:30/255.0 green:126/255.0 blue:237/255.0 alpha:1.0]

#define TonyRandomColor TonyColor(arc4random_uniform(256), arc4random_uniform(256), arc4random_uniform(256),1)
@interface homeVC ()
@property (weak, nonatomic) IBOutlet UITableView *tableview;

@end

@implementation homeVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.tableview registerNib:[UINib nibWithNibName:@"HomeCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:@"HomeCell"];
    self.tableview.separatorStyle=UITableViewCellSeparatorStyleNone;
    self.tableview.delegate=self;
    self.tableview.dataSource=self;
    
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 18;
}

// Row display. Implementers should *always* try to reuse cells by setting each cell's reuseIdentifier and querying for available reusable cells with dequeueReusableCellWithIdentifier:
// Cell gets various attributes set automatically based on table (separators) and data source (accessory views, editing controls)

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    HomeCell *cell=[self.tableview dequeueReusableCellWithIdentifier:@"HomeCell" forIndexPath:indexPath];
    cell.selectionStyle=UITableViewCellSelectionStyleNone;
    switch (indexPath.row) {
        case 0:
            cell.celllabel.text=@"滴水效果";
            break;
        case 1:
            cell.celllabel.text=@"翻页效果";
            break;
        case 2:
            cell.celllabel.text=@"旋转效果";
            break;
        case 3:
            cell.celllabel.text=@"收缩效果";
            break;
        case 4:
            cell.celllabel.text=@"上下左右翻转效果";
            break;
        case 5:
            cell.celllabel.text=@"交叉淡化过渡";
            break;
        case 6:
            cell.celllabel.text=@"相机镜头打开效果(不支持过渡方向)";
            break;
        case 7:
            cell.celllabel.text=@"显露效果(将旧视图移开,显示下面的新视图)";
            break;
        case 8:
            cell.celllabel.text=@"立体翻转";
            break;
        case 9:
            cell.celllabel.text=@"推";
            break;
        case 10:
            cell.celllabel.text=@"向上推";
            break;
        case 11:
            cell.celllabel.text=@"缩小旋转后放大";
            break;
        case 12:
            cell.celllabel.text=@"背景色渐变";
            break;
        case 13:
            cell.celllabel.text=@"上下翻转";
            break;
        case 14:
            cell.celllabel.text=@"透明度";
            break;
        case 15:
            cell.celllabel.text=@"圆角变换";
            break;
        case 16:
            cell.celllabel.text=@"边距变换";
//            cell.layer.borderColor=[UIColor whiteColor].CGColor;
//            cell.layer.borderWidth=5;
            break;
        case 17:
            cell.celllabel.text=@"显露效果(将旧视图移开,显示下面的新视图)";
            break;
        case 18:
            cell.celllabel.text=@"显露效果(将旧视图移开,显示下面的新视图)";
            break;
            
            
        default:
            cell.celllabel.text=@"99";
            break;
    }
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 44;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
   HomeCell *cell=[self.tableview cellForRowAtIndexPath:indexPath];
    switch (indexPath.row) {
        case 0:
            [self animationrippleEffect:cell];
            break;
        case 1:
            [self animationpageCurl:self.view];
            break;
        case 2:
            [self animationrotate:cell];
            break;
        case 3:
            [self animationsuckEffect:cell];
            break;
        case 4:
            [self animationoglFlip:cell];
            break;
        case 5:
            [self animationmoveIn:cell];
            break;
        case 6:
            [self animationcameraIrisHollowOpen:cell];
            break;
        case 7:
            [self animationreveal:cell];
            break;
        
        case 8:
            [self animationcube:cell];
            break;
        case 9:
            [self animationpush:cell];
            break;
        case 10:
            [CoreAnimationEffect animationPushUp:cell];
            break;
        case 11:
            [CoreAnimationEffect animationRotateAndScaleEffects:cell ];
            break;
        case 12:
            [self animationbackgroundColor:cell.vii];
            break;
        case 13:
            [CoreAnimationEffect animationFlipFromTop:cell.vii];
            break;
        case 14:
            [self animationopacity:cell];
            break;
        case 15:
            [self animationcornerRadius:cell.vii];
            break;
        case 16:
            [self animationborderWidth:cell];
            break;
        default:
            //animationborderWidth
            break;
    }
}

//滴水效果
-(void)animationrippleEffect:(UIView *)animationView
{
    CATransition *animation = [CATransition animation];
    
    [animation setDuration:1.0f];
    
    [animation setTimingFunction:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear]];
    
    
    [animation setType:@"rippleEffect"];
    [animation setSubtype:kCATransitionFromLeft];
    
    [self.view.layer addAnimation:animation forKey:@""];
    animationView.backgroundColor=TonyRandomColor;
    

}
//翻页
-(void)animationpageCurl:(UIView *)animationView
{
    CATransition *animation = [CATransition animation];
    
    [animation setDuration:1.0f];
    
    [animation setTimingFunction:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear]];
    
    
    [animation setType:@"pageCurl"];
    [animation setSubtype:kCATransitionFromLeft];
    
    [animationView.layer addAnimation:animation forKey:@""];
    animationView.backgroundColor=TonyRandomColor;
    
    
}

//旋转
-(void)animationrotate:(UIView *)animationView
{
    CATransition *animation = [CATransition animation];
    
    [animation setDuration:1.0f];
    
    [animation setTimingFunction:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear]];
    
    
    [animation setType:@"rotate"];
    [animation setSubtype:kCATransitionFromLeft];
    
    [animationView.layer addAnimation:animation forKey:@""];
    animationView.backgroundColor=TonyRandomColor;
    
    
}

//收缩
-(void)animationsuckEffect:(UIView *)animationView
{
    CATransition *animation = [CATransition animation];
    
    [animation setDuration:2.0f];
    
    [animation setTimingFunction:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear]];
    
    
    [animation setType:@"suckEffect"];
    [animation setSubtype:kCATransitionFromLeft];
    
    [animationView.layer addAnimation:animation forKey:@""];
    animationView.backgroundColor=TonyRandomColor;
    
    
}

//翻转
-(void)animationoglFlip:(UIView *)animationView
{
    CATransition *animation = [CATransition animation];
    
    [animation setDuration:1.0f];
    
    [animation setTimingFunction:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear]];
    
    
    [animation setType:@"oglFlip"];
    [animation setSubtype:kCATransitionFromLeft];
    
    [animationView.layer addAnimation:animation forKey:@""];
    animationView.backgroundColor=TonyRandomColor;
    
    
}

//交叉淡化过渡(不支持过渡方向)             (默认为此效果)
-(void)animationmoveIn:(UIView *)animationView
{
    CATransition *animation = [CATransition animation];
    
    [animation setDuration:1.0f];
    
    [animation setTimingFunction:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear]];
    
    
    [animation setType:@"moveIn"];
    [animation setSubtype:kCATransitionFromLeft];
    
    [animationView.layer addAnimation:animation forKey:@""];
    animationView.backgroundColor=TonyRandomColor;
    
    
}

//相机镜头打开效果(不支持过渡方向)
-(void)animationcameraIrisHollowOpen:(UIView *)animationView
{
    CATransition *animation = [CATransition animation];
    
    [animation setDuration:0.4f];
    
    [animation setTimingFunction:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear]];
    
    
    [animation setType:@"cameraIrisHollowOpen"];
    [animation setSubtype:kCATransitionFromLeft];
    
    [self.view.layer addAnimation:animation forKey:@""];
    animationView.backgroundColor=TonyRandomColor;
    
    
}

//显露效果(将旧视图移开,显示下面的新视图)
-(void)animationreveal:(UIView *)animationView
{
    CATransition *animation = [CATransition animation];
    
    [animation setDuration:1.0f];
    
    [animation setTimingFunction:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear]];
    
    
    [animation setType:@"reveal"];
    [animation setSubtype:kCATransitionFromLeft];
    
    [animationView.layer addAnimation:animation forKey:@""];
    animationView.backgroundColor=TonyRandomColor;
    
    
}

//立体
-(void)animationcube:(UIView *)animationView
{
    CATransition *animation = [CATransition animation];
    
    [animation setDuration:1.0f];
    
    [animation setTimingFunction:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear]];
    
    
    [animation setType:@"cube"];
    [animation setSubtype:kCATransitionFromLeft];
    
    [self.view.layer addAnimation:animation forKey:@""];
    animationView.backgroundColor=TonyRandomColor;
    
    
}

//push
-(void)animationpush:(UIView *)animationView
{
    CATransition *animation = [CATransition animation];
    
    [animation setDuration:1.0f];
    
    [animation setTimingFunction:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear]];
    
    
    [animation setType:@"push"];
    [animation setSubtype:kCATransitionFromLeft];
    
    [animationView.layer addAnimation:animation forKey:@""];
    animationView.backgroundColor=TonyRandomColor;
    
    
}

//变色
-(void)animationbackgroundColor:(UIView *)animationView
{
    CGFloat duration = 1;
    
    //1、从白色变为灰色 程实原创
    CABasicAnimation *anim1 = [CABasicAnimation animationWithKeyPath:@"backgroundColor"];
    anim1.duration = duration;
    anim1.fromValue = (__bridge id)animationView.backgroundColor.CGColor;
    anim1.toValue = (__bridge id)TonyRandomColor.CGColor;
    //填充效果：动画结束后，动画将保持最后的表现状态
    anim1.fillMode = kCAFillModeForwards;
    anim1.removedOnCompletion = NO;
    anim1.beginTime = 0.0f;
    
    [animationView.layer addAnimation:anim1 forKey:@"backgroundColor"];
    
}

//opacity 透明度
-(void)animationopacity:(UIView *)animationView
{
    CGFloat duration = 1;
    
    //1、从白色变为灰色 程实原创
    CABasicAnimation *anim1 = [CABasicAnimation animationWithKeyPath:@"opacity"];
    anim1.duration = duration;
    anim1.fromValue = [NSNumber numberWithFloat:1];;
    anim1.toValue = [NSNumber numberWithFloat:0.4];
    //填充效果：动画结束后，动画将保持最后的表现状态
    anim1.fillMode = kCAFillModeForwards;
    anim1.removedOnCompletion = NO;
    anim1.beginTime = 0.0f;
    
    [animationView.layer addAnimation:anim1 forKey:@"opacity"];
    
}

//角度变园
-(void)animationcornerRadius:(UIView *)animationView
{
    CABasicAnimation *anim2 = [CABasicAnimation animationWithKeyPath:@"cornerRadius"];
    anim2.duration = 0.5f;
    anim2.fromValue = [NSNumber numberWithFloat:0.f];
    anim2.toValue = [NSNumber numberWithFloat:22.f];
    anim2.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    anim2.repeatCount = CGFLOAT_MAX;
    anim2.autoreverses = YES;
    
    [animationView.layer addAnimation:anim2 forKey:@"cornerRadius"];
}

//边距变换
-(void)animationborderWidth:(UIView *)animationView
{
    CABasicAnimation *anim2 = [CABasicAnimation animationWithKeyPath:@"borderWidth"];
    anim2.duration = 0.5f;
    anim2.fromValue = [NSNumber numberWithFloat:0.f];
    anim2.toValue = [NSNumber numberWithFloat:10.f];
    anim2.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    anim2.repeatCount = CGFLOAT_MAX;
    anim2.autoreverses = YES;
    
    [animationView.layer addAnimation:anim2 forKey:@"borderWidth"];
}


//参数详解
//Autoreverses
//
//当你设定这个属性为 YES 时,在它到达目的地之后,动画的返回到开始的值,代替了直接跳转到 开始的值。
//
//Duration
//Duration 这个参数你已经相当熟悉了。它设定开始值到结束值花费的时间。期间会被速度的属性所影响。 RemovedOnCompletion
//这个属性默认为 YES,那意味着,在指定的时间段完成后,动画就自动的从层上移除了。这个一般不用。
//
//假如你想要再次用这个动画时,你需要设定这个属性为 NO。这样的话,下次你在通过-set 方法设定动画的属 性时,它将再次使用你的动画,而非默认的动画。
//
//Speed
//
//默认的值为 1.0.这意味着动画播放按照默认的速度。如果你改变这个值为 2.0,动画会用 2 倍的速度播放。 这样的影响就是使持续时间减半。如果你指定的持续时间为 6 秒,速度为 2.0,动画就会播放 3 秒钟---一半的 持续时间。
//
//BeginTime
//
//这个属性在组动画中很有用。它根据父动画组的持续时间,指定了开始播放动画的时间。默认的是 0.0.组 动画在下个段落中讨论“Animation Grouping”。
//
//TimeOffset
//
//如果一个时间偏移量是被设定,动画不会真正的可见,直到根据父动画组中的执行时间得到的时间都流逝 了。
//
//RepeatCount
//
//默认的是 0,意味着动画只会播放一次。如果指定一个无限大的重复次数,使用 1e100f。这个不应该和 repeatDration 属性一块使用。
//
//RepeatDuration
//
//这个属性指定了动画应该被重复多久。动画会一直重复,直到设定的时间流逝完。它不应该和 repeatCount 一起使用。
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
