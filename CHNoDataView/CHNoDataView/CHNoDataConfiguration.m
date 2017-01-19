//
//  CHNoDataConfiguration.m
//  CHNoDataView
//
//  Created by charls on 2017/1/19.
//  Copyright © 2017年 Charls. All rights reserved.
//

#import "CHNoDataConfiguration.h"
#import <UIKit/UIKit.h>

@implementation CHNoDataConfiguration

- (instancetype)initWithNoDataType:(CHNoDataType)type {
    if (self = [super init]) {
        switch (type) {
            case CHNodataDefaults: {
                _configDescription = @"没有数据哦!";
                _descriptionTextColor = [UIColor lightGrayColor];
                _descriptionTextFont = [UIFont systemFontOfSize:16.0f];
                _iconName = @"empty_data";
                _canTouch = YES;
                _distance = 0;
                _backgroundColor = [UIColor clearColor];
//                _showResetButton = NO;
            }
                break;
            case CHNoNetwork: {
                _configDescription = @"没有网络哦!";
                _descriptionTextColor = [UIColor lightGrayColor];
                _descriptionTextFont = [UIFont systemFontOfSize:16.0f];
                _iconName = @"no_network";
                _canTouch = YES;
                _distance = 0;
                _backgroundColor = [UIColor clearColor];
//                _showResetButton = NO;
            }
            default:
                break;
        }
    }
    return self;
}

@end
