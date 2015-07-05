//
//  MMScrollPage.m
//  MMScrollPresenter
//
//  Created by Malleo, Mitch on 10/31/14.
//

#import "MMScrollPage.h"

#pragma mark - MMScrollPage

@implementation MMScrollPage

#pragma mark - Lifecycle

- (instancetype)init
{
    self = [super init];
    
    if(self)
    {
        self.titleView = [[UIView alloc] init];
        self.backgroundView = [[UIView alloc] init];
        
        self.titleLabel = [[UILabel alloc] init];
        self.titleLabel.adjustsFontSizeToFitWidth = YES;
        self.titleLabel.text = @"Default Title Text";
        self.titleLabel.lineBreakMode = NSLineBreakByWordWrapping;
        self.titleLabel.textColor = [UIColor whiteColor];
        self.titleLabel.font = [UIFont fontWithName:@"Helvetica Neue" size:16];
        self.titleLabel.numberOfLines = 2;
        
        self.detailLabel = [[UILabel alloc] init];
        self.detailLabel.adjustsFontSizeToFitWidth = YES;
        self.detailLabel.text = @"Default Detail Text";
        self.detailLabel.textColor = [UIColor whiteColor];
        self.detailLabel.lineBreakMode = NSLineBreakByWordWrapping;
        self.detailLabel.numberOfLines = 2;
        self.detailLabel.font = [UIFont systemFontOfSize:13];
        
        self.backgroundView.backgroundColor = [UIColor lightGrayColor];
        
        self.titleBackgroundColor = [UIColor blackColor];
        
        self.icon = [UIImage imageNamed:@"arrow.png"];
    }
    
    return self;
}

@end
