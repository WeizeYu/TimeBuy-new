//
//  myTabBarViewController.m
//  Timebuy
//
//  Created by CraftDream on 15/9/21.
//  Copyright (c) 2015年 com.CraftDream. All rights reserved.
//

#import "myTabBarViewController.h"

@interface myTabBarViewController ()

@end

@implementation myTabBarViewController

@synthesize button;
@synthesize myTabBar;

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:YES];
    //self.hidesBottomBarWhenPushed = YES;
    //NSLog(@"Hello tabbarVC");
    //NSLog(@"tabvc = %@",self);
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [[UINavigationBar appearance] setTintColor:[UIColor whiteColor]];
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    homeRootViewController *vc1 = [[homeRootViewController alloc] init];
    vc1.view.backgroundColor = [UIColor whiteColor];
    //vc1.tabBarItem.title = @"拾贝";
    
    findingsRootViewController *vc2 = [[findingsRootViewController alloc] init];
    vc2.view.backgroundColor = [UIColor whiteColor];
    //vc2.tabBarItem.title = @"发现";
    
    vc3 = [[UIViewController alloc] init];
    vc3.view.backgroundColor = [UIColor blackColor];
    //vc3.tabBarItem.title = @"789";
    
    newsRootViewController *vc4 = [[newsRootViewController alloc] init];
    vc4.view.backgroundColor = [UIColor whiteColor];
    //vc4.tabBarItem.title = @"动态";
    
    profilesRootViewController *vc5 = [[profilesRootViewController alloc] init];
    vc5.view.backgroundColor = [UIColor whiteColor];
    //vc5.tabBarItem.title = @"我的";
    
    UINavigationController *nav1 = [[UINavigationController alloc] initWithRootViewController:vc1];
    nav1.tabBarItem.title = @"拾贝";
    UINavigationController *nav2 = [[UINavigationController alloc] initWithRootViewController:vc2];
    nav2.tabBarItem.title = @"发现";
    UINavigationController *nav4 = [[UINavigationController alloc] initWithRootViewController:vc4];
    nav4.tabBarItem.title = @"动态";
    UINavigationController *nav5 = [[UINavigationController alloc] initWithRootViewController:vc5];
    nav5.tabBarItem.title = @"我的";
    
    [nav1.navigationBar setBackgroundImage:[UIImage imageNamed:@"导航条375x64"] forBarMetrics:UIBarMetricsDefault];
    nav1.navigationBar.translucent = NO;
    
    [nav2.navigationBar setBackgroundImage:[UIImage imageNamed:@"导航条375x64"] forBarMetrics:UIBarMetricsDefault];
    nav2.navigationBar.translucent = NO;
    
    [nav4.navigationBar setBackgroundImage:[UIImage imageNamed:@"导航条375x64"] forBarMetrics:UIBarMetricsDefault];
    nav4.navigationBar.translucent = NO;
    
    [nav5.navigationBar setBackgroundImage:[UIImage imageNamed:@"导航条375x64"] forBarMetrics:UIBarMetricsDefault];
    nav5.navigationBar.translucent = NO;
    
    self.viewControllers = @[nav1,nav2,vc3,nav4,nav5];
    
    [nav2.navigationBar setBackgroundImage:[UIImage imageNamed:@"导航条375x64"] forBarMetrics:UIBarMetricsDefault];
    nav2.navigationBar.translucent = NO;
        [nav4.navigationBar setBackgroundImage:[UIImage imageNamed:@"导航条375x64"] forBarMetrics:UIBarMetricsDefault];
    nav4.navigationBar.translucent = NO;
    
    [nav5.navigationBar setBackgroundImage:[UIImage imageNamed:@"导航条375x64"] forBarMetrics:UIBarMetricsDefault];
    nav5.navigationBar.translucent = NO;
    
    self.viewControllers = @[nav1,nav2,vc3,nav4,nav5];
    [self setup];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(recLocation:) name:@"passLocation" object:nil];
    
}

- (void)recLocation:(NSNotification *)notification
{
    NSDictionary *getDic = [notification userInfo];
    getState = [getDic objectForKey:@"state"];
    
    if ([getState isEqualToString:@"1"]) {
        getLocation = [getDic objectForKey:@"location"];
        
        releaseRootViewController *releaseMainVC = [[releaseRootViewController alloc] init];
        [self presentViewController:releaseMainVC animated:YES completion:nil];
    }
}

#pragma mark- setup
-(void)setup
{
    //  添加突出按钮
    [self addCenterButtonWithImage:[UIImage imageNamed:@"tabbar_mainbtn@2x.png"] selectedImage:[UIImage imageNamed:@"tabbar_mainbtn@2x.png"]];
    //  UITabBarControllerDelegate 指定为自己
    self.delegate=self;
    //  指定当前页——中间页
    self.selectedIndex=0;
    //  设点button状态
    button.selected=YES;
    //  设定其他item点击选中颜色
    myTabBar.tintColor= [UIColor colorWithRed:222/255.0 green:78/255.0 blue:22/255.0 alpha:1];
}


#pragma mark - addCenterButton
// Create a custom UIButton and add it to the center of our tab bar
-(void) addCenterButtonWithImage:(UIImage*)buttonImage selectedImage:(UIImage*)selectedImage
{
    button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button addTarget:self action:@selector(pressChange:) forControlEvents:UIControlEventTouchUpInside];
    button.autoresizingMask = UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleBottomMargin | UIViewAutoresizingFlexibleTopMargin;
    
    //  设定button大小为适应图片
    button.frame = CGRectMake(0.0, 0.0, buttonImage.size.width, buttonImage.size.height);
    [button setImage:buttonImage forState:UIControlStateNormal];
    [button setImage:selectedImage forState:UIControlStateSelected];
    
    //  这个比较恶心  去掉选中button时候的阴影
    button.adjustsImageWhenHighlighted=NO;
    
    /*
     *  核心代码：设置button的center 和 tabBar的 center 做对齐操作， 同时做出相对的上浮
     */
    CGFloat heightDifference = buttonImage.size.height - self.tabBar.frame.size.height;
    if (heightDifference < 0)
        button.center = self.tabBar.center;
    else
    {
        CGPoint center = self.tabBar.center;
        center.y = center.y - heightDifference/2.0;
        button.center = center;
    }
    
    [self.view addSubview:button];
}

-(void)pressChange:(id)sender
{
    NSLog(@"press center");
    //self.selectedIndex=2;
    //button.selected=YES;
    
    
    //locationViewController *locationVC = [[locationViewController alloc] init];
    //[self presentViewController:locationVC animated:YES completion:nil];
    
    releaseRootViewController *releaseRootVC = [[releaseRootViewController alloc] init];
    [self presentViewController:releaseRootVC animated:YES completion:nil];
}

#pragma mark- TabBar Delegate

//  换页和button的状态关联上

- (void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController
{
    if (self.selectedIndex==2) {
        
        button.selected=YES;
    }else
    {
        button.selected=NO;
    }
}

- (BOOL)tabBarController:(UITabBarController *)tabBarController shouldSelectViewController:(UIViewController *)viewController
{
    //设置vc3无法选中
    if ([viewController isEqual:vc3]) {
        return NO;
    } else {
        return YES;
    }
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

@end
