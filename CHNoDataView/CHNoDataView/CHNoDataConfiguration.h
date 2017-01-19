//
//  CHNoDataConfiguration.h
//  CHNoDataView
//
//  Created by charls on 2017/1/19.
//  Copyright © 2017年 Charls. All rights reserved.
//

#import <Foundation/Foundation.h>

@class UIColor,UIFont,UIButton;

typedef NS_ENUM(NSInteger, CHNoDataType) {
    CHNodataDefaults,       //! 默认值(无数据)
    CHNoNetwork,            //!  无网络
    CHNoDataCustom, //! 自定义配置
};

NS_ASSUME_NONNULL_BEGIN

@interface CHNoDataConfiguration : NSObject

#pragma mark - Properties
@property (nonatomic, copy) NSString *configDescription;
@property (nonatomic, strong) UIColor *descriptionTextColor;
@property (nonatomic, strong) UIFont *descriptionTextFont;
@property (nonatomic, copy) NSString *iconName;
/// 图片跟文字间隔
@property (nonatomic, assign) NSInteger distance;
@property (nonatomic, assign) BOOL canTouch;
//@property (nonatomic, assign) BOOL showResetButton;
@property (nonatomic, strong) UIButton *resetButton;
@property (nonatomic, strong) UIColor *backgroundColor;

/**
 带配置类型初始化器

 @param type 配置类型
 @return 配置对象 or nil
 */
- (instancetype)initWithNoDataType:(CHNoDataType)type;

@end

NS_ASSUME_NONNULL_END
