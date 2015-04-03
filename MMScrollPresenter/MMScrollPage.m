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

- (id)init
{
    self = [super init];
    
    if(self)
    {
        self.titleView = [[UIView alloc] init];
        self.backgroundView = [[UIView alloc] init];
        
        self.titleLabel = [[UILabel alloc] init];
        self.titleLabel.adjustsFontSizeToFitWidth = YES;
        [self.titleLabel setText:@"Default Title Text"];
        [self.titleLabel setLineBreakMode:NSLineBreakByWordWrapping];
        [self.titleLabel setTextColor:[UIColor whiteColor]];
        self.titleLabel.font = [UIFont fontWithName:@"Helvetica Neue" size:16];
        self.titleLabel.numberOfLines = 2;
        
        self.detailLabel = [[UILabel alloc] init];
        self.detailLabel.adjustsFontSizeToFitWidth = YES;
        [self.detailLabel setText:@"Default Detail Text"];
        [self.detailLabel setTextColor:[UIColor whiteColor]];
        [self.detailLabel setLineBreakMode:NSLineBreakByWordWrapping];
        self.detailLabel.numberOfLines = 2;
        self.detailLabel.font = [UIFont systemFontOfSize:13];
        
        [self.backgroundView setBackgroundColor:[UIColor lightGrayColor]];
        
        self.titleBackgroundColor = [UIColor blackColor];
        
        self.icon = [UIImage imageNamed:@"arrow.png"];
    }
    
    return self;
}

@end
