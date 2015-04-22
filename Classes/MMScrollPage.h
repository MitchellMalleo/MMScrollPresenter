//
//  MMScrollPage.h
//  MMScrollPresenter
//
//  Created by Malleo, Mitch on 10/31/14.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface MMScrollPage : NSObject

- (id)init;

@property (strong, nonatomic) UIView *backgroundView;
@property (strong, nonatomic) UIView *titleView;
@property (strong, nonatomic) UIColor *titleBackgroundColor;
@property (strong, nonatomic) UILabel *titleLabel;
@property (strong, nonatomic) UILabel *detailLabel;
@property (strong, nonatomic) UIImage *icon;

@end
