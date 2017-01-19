//
//  CHNoDataView.m
//  CHNoDataView
//
//  Created by charls on 2017/1/19.
//  Copyright © 2017年 Charls. All rights reserved.
//

#import "CHNoDataView.h"

@interface CHNoDataView ()
{
    CHNoDataConfiguration *_customConfig;
}
@property (nonatomic, strong) UIImageView *iconView;
@property (nonatomic, strong) UILabel *descriptionLabel;
@property (nonatomic, strong) UIButton *resetButton;
@end

@implementation CHNoDataView

- (instancetype)initWithFrame:(CGRect)frame description:(NSString *)description {
    if (self = [super initWithFrame:frame]) {
        _customConfig = [[CHNoDataConfiguration alloc] initWithNoDataType:CHNodataDefaults];
        _customConfig.configDescription = description;
        [self initialization];
        [self addConfiguration:_customConfig];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame no_dataConfig:(void (^)(CHNoDataConfiguration * _Nonnull))configHandler {
    if (self = [super initWithFrame:frame]) {
        _customConfig = [[CHNoDataConfiguration alloc] initWithNoDataType:CHNoDataCustom];
        [self initialization];
        configHandler(_customConfig);
        [self addConfiguration:_customConfig];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame CHNoDataConfiguration:(CHNoDataConfiguration *)config {
    if (self = [super initWithFrame:frame]) {
        [self initialization];
        [self addConfiguration:config];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame no_networkConfig:(void (^)(CHNoDataConfiguration * _Nonnull))configHandler {
    if (self = [super initWithFrame:frame]) {
        _customConfig = [[CHNoDataConfiguration alloc] initWithNoDataType:CHNoNetwork];
        [self initialization];
        configHandler(_customConfig);
        [self addConfiguration:_customConfig];
    }
    return self;
}

- (void)initialization {
    _iconView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 64, 64)];
    _descriptionLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, 32)];
    _descriptionLabel.textAlignment = NSTextAlignmentCenter;
    _iconView.center = CGPointMake(self.center.x, self.center.y - _iconView.bounds.size.height / 2);
    _descriptionLabel.center = CGPointMake(self.center.x, self.center.y + 16);
    [self addSubview:_iconView];
    [self addSubview:_descriptionLabel];
    
    _resetButton = [UIButton buttonWithType:UIButtonTypeCustom];
    _resetButton.frame = CGRectMake(
                                    self.center.x - 50,
                                    _descriptionLabel.frame.origin.y + _descriptionLabel.frame.size.height,
                                    100, 28);
    _resetButton.layer.cornerRadius = 5.0f;
    _resetButton.layer.masksToBounds = YES;
    [_resetButton setTitle:@"重置" forState:UIControlStateNormal];
    [_resetButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [_resetButton setBackgroundColor:[UIColor redColor]];
    [_resetButton addTarget:self action:@selector(tapAction:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:_resetButton];
    _customConfig.resetButton = _resetButton;
}

- (void)addConfiguration:(CHNoDataConfiguration *)config {
    _iconView.image = [UIImage imageNamed:config.iconName];
    _descriptionLabel.text = config.configDescription;
    _descriptionLabel.textColor = config.descriptionTextColor;
    _descriptionLabel.font = config.descriptionTextFont;
    self.backgroundColor = config.backgroundColor;
    if (config.canTouch) {
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapAction:)];
        [self addGestureRecognizer:tap];
    }
}

- (void)tapAction:(id)tap {
    if (self.block) {
        self.block(self);
    }
}

- (void)tapCompletionHandler:(void (^)(CHNoDataView * _Nonnull))handler {
    self.block = handler;
}

@end
