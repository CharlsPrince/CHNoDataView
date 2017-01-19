//
//  ViewController.m
//  CHNoDataView
//
//  Created by charls on 2017/1/19.
//  Copyright © 2017年 Charls. All rights reserved.
//

#import "ViewController.h"
#import "CHNoDataView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

    CHNoDataView *nodataView = [[CHNoDataView alloc] initWithFrame:self.view.bounds no_dataConfig:^(CHNoDataConfiguration * _Nonnull nodataConfig) {
       nodataConfig.configDescription = @"no-data";
        nodataConfig.iconName = @"empty_data";
    }];
    [self.view addSubview:nodataView];
    
//    CHNoDataView *no_networkView = [[CHNoDataView alloc] initWithFrame:self.view.bounds no_networkConfig:^(CHNoDataConfiguration * _Nonnull nodataConfig) {
////        nodataConfig.showResetButton = YES;
//        NSLog(@"%@",nodataConfig.resetButton);
//        [nodataConfig.resetButton setTitle:@"刷新" forState:UIControlStateNormal];
//        [nodataConfig.resetButton setBackgroundColor:[UIColor greenColor]];
//    }];
//    [self.view addSubview:no_networkView];
    
//    CHNoDataView *noDataView = [[CHNoDataView alloc]
//                                initWithFrame:self.view.bounds
//                                description:@"没有数据,点击重新请求"];
//    [noDataView tapCompletionHandler:^(CHNoDataView * _Nonnull v) {
//        NSLog(@"tap");
//    }];
//    [self.view addSubview:noDataView];
    
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
