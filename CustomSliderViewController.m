//
//  CustomSliderViewController.m
//  Slider
//
//  Created by youssef on 2/3/15.
//  Copyright (c) 2015 youssef. All rights reserved.
//

#import "CustomSliderViewController.h"

@interface CustomSliderViewController ()

@end

@implementation CustomSliderViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title=@"Slider";
    
    
    self.view.backgroundColor=[UIColor whiteColor];
    w_slider=[[CustomSlider alloc]initWithFrame:CGRectMake(10, 100, 300, 50)];
    [w_slider setMinDistance:0.1];
    [self.view addSubview:w_slider];

    // Do any additional setup after loading the view.
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
