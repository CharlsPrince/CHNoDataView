//
//  CHNoDataView.h
//  CHNoDataView
//
//  Created by charls on 2017/1/19.
//  Copyright © 2017年 Charls. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CHNoDataConfiguration.h"

//@class CHNoDataConfiguration;

NS_ASSUME_NONNULL_BEGIN
@class CHNoDataView;
typedef void(^tapActionBlock)(CHNoDataView *v);

@interface CHNoDataView : UIView

@property (nonatomic, copy) tapActionBlock block;

- (instancetype)initWithFrame:(CGRect)frame description:(NSString *)description;

- (instancetype)initWithFrame:(CGRect)frame no_dataConfig:(void(^)(CHNoDataConfiguration *nodataConfig))configHandler;

- (instancetype)initWithFrame:(CGRect)frame no_networkConfig:(void(^)(CHNoDataConfiguration *nodataConfig))configHandler;

- (instancetype)initWithFrame:(CGRect)frame CHNoDataConfiguration:(CHNoDataConfiguration *)config;

- (void)tapCompletionHandler:(void(^)(CHNoDataView *v))handler;

@end

NS_ASSUME_NONNULL_END
