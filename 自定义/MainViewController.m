//
//  MainViewController.m
//  自定义
//
//  Created by 李李贤军 on 15/7/15.
//  Copyright (c) 2015年 TH. All rights reserved.
//

#import "MainViewController.h"
#import "firstViewController.h"
#import "secondViewController.h"
#import "threeViewController.h"
#import "fourseViewController.h"
#import "fiveViewController.h"
#import "BaseNavViewController.h"
#define WIDETH [UIScreen mainScreen] .bounds.size.width
#define  HEITGH [UIScreen mainScreen] .bounds.size.height
@interface MainViewController ()

-(void)createTabBar;
-(void)createController;
@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //创建tabBar
    [self createController];
    [self createTabBar];
    self.tabBar.hidden = YES;
        // Do any additional setup after loading the view.
}

-(void)createTabBar
{

    _tabBar = [[UIImageView alloc] initWithFrame:CGRectMake(0, HEITGH-49, WIDETH, 49)];
    _tabBar.userInteractionEnabled = YES;
//    _tabBar.image = [UIImage imageNamed:@"3"];
//    _tabBar.backgroundColor =[UIColor yellowColor];
    [self.view addSubview:_tabBar];
    
    //选中的图片
    _selectView =[[UIImageView alloc] initWithFrame:CGRectMake(5, _tabBar.frame.size.height/2 - 30.0/2, 50, 45)];
    
//   _selectView.backgroundColor =[UIColor redColor];
////    _selectView.image =[UIImage imageNamed:@"tabbar_home"];
//    [_tabBar addSubview:_selectView];
    
    NSArray * items = @[@"tabbar_home",@"tabbar_course",@"tabbar_question",@"tabbar_profile",@"tabbar_profile"];
    NSArray * selectItems = @[@"tabbar_home_highlighted",@"tabbar_course_highlighted",@"tabbar_course",@"tabbar_profile_highligted",@"tabbar_profile_highligted"];
    

    NSArray * titles = @[@"电影",@"新闻",@"top",@"影院",@"更多"];

    int x = 0;
    for (int index = 0 ; index < 5; index++) {
        UIButton * itemView =[[UIButton alloc] initWithFrame:CGRectMake(30+x, 10, 25, 25)];
//        itemView.image = [UIImage imageNamed:items[index]];
        [itemView setImage:[UIImage imageNamed:items[index]] forState:UIControlStateNormal];
      [itemView setImage:[UIImage imageNamed:selectItems[index]] forState:UIControlStateSelected];
//      itemView.backgroundColor =[UIColor redColor];
        itemView.tag = index;
        itemView.userInteractionEnabled =YES;
        itemView.contentMode = UIViewContentModeScaleAspectFit;
        
        [_tabBar addSubview:itemView];
//        UILabel * itemLable =[[UILabel alloc] initWithFrame:CGRectMake(itemView.frame.origin.x, itemView.frame.origin.y+itemView.frame.size.height+2, itemView.frame.size.width, 10)];
//        itemLable.backgroundColor = [UIColor clearColor];
//        itemLable.textColor = [UIColor redColor];
//        itemLable.text  = titles[index];
//        itemLable.font = [UIFont boldSystemFontOfSize:10];
//        itemLable.textAlignment = UITextAlignmentCenter;
//        itemLable.textColor = [UIColor whiteColor];
//        [_tabBar addSubview:itemLable];
//        

        x += (itemView.frame.size.width +45);
        UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tap:)];
        [itemView addGestureRecognizer:tap];
//        self.title = [UIColor redColor];
    }

}

#pragma mark memery
-(void)tap:(UITapGestureRecognizer*)gester
{
    UIView * view = [gester view];
    
    [UIView animateWithDuration:1 animations:NULL];
    _selectView.frame = CGRectMake(5+65* view.tag,_tabBar.frame.size.height/2 - 30.0/2, 50, 45);

    self.selectedIndex = view.tag;
}
-(void)createController
{
   
    firstViewController * first = [[firstViewController alloc] init];
//    UITabBarItem * firstItem = [[UITabBarItem alloc] initWithTabBarSystemItem:1 tag:1];
//    first.tabBarItem = firstItem;
    BaseNavViewController * firstNav = [[BaseNavViewController alloc] initWithRootViewController:first];
    
    secondViewController * second = [[secondViewController alloc] init];
//    UITabBarItem * secondItem = [[UITabBarItem alloc] initWithTabBarSystemItem:2 tag:2];
//    second.tabBarItem = secondItem;
    BaseNavViewController * sencondNav = [[BaseNavViewController alloc] initWithRootViewController:second];
    
    threeViewController * three = [[threeViewController alloc] init];
//    UITabBarItem * threeItem = [[UITabBarItem alloc] initWithTabBarSystemItem:3 tag:3];
//    first.tabBarItem = threeItem;
    BaseNavViewController * threeNav = [[BaseNavViewController alloc] initWithRootViewController:three];
    
    fourseViewController * four = [[fourseViewController alloc] init];
//    UITabBarItem * fourItem = [[UITabBarItem alloc] initWithTabBarSystemItem:4 tag:4];
//    first.tabBarItem = fourItem;
    BaseNavViewController * fourNav = [[BaseNavViewController alloc] initWithRootViewController:four];
    
    firstViewController * five = [[firstViewController alloc] init];
//    UITabBarItem * fiveItem = [[UITabBarItem alloc] initWithTabBarSystemItem:5 tag:5];
//    first.tabBarItem = fiveItem;
    BaseNavViewController * fiveNav = [[BaseNavViewController alloc] initWithRootViewController:five];
    
    NSArray * viewsControllers = @[firstNav,sencondNav,threeNav,fourNav,fiveNav];
    [self setViewControllers:viewsControllers
                    animated:YES];
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
