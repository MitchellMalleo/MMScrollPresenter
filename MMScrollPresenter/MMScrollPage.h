//
//  MMScrollPage.h
//  MMScrollPresenter
//
//  Created by Malleo, Mitch on 10/31/14.
//  Copyright (c) 2014 Encore. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface MMScrollPage : NSObject

-(id)init;

@property (nonatomic, strong) UIView *backgroundView;

@property (nonatomic, strong) UIView *titleView;
@property (nonatomic, strong) UIColor *titleBackgroundColor;
@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UILabel *detailLabel;

@property (nonatomic, strong) UIImage *icon;

@end
