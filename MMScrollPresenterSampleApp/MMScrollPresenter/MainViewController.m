//
//  MainViewController.m
//  MMScrollPresenter
//
//  Created by Malleo, Mitch on 10/31/14.
//

#import "MainViewController.h"

@interface MainViewController ()

@property (weak, nonatomic) IBOutlet MMScrollPresenter *mmScrollPresenter;

@end

@implementation MainViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    UIImageView *mountainImage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"mountains.jpg"]];
    [mountainImage setFrame:CGRectMake(0, 0, self.mmScrollPresenter.frame.size.width, self.mmScrollPresenter.frame.size.height)];
    
    UIImageView *dockImage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"dock.jpg"]];
    [dockImage setFrame:CGRectMake(0, 0, self.mmScrollPresenter.frame.size.width, self.mmScrollPresenter.frame.size.height)];
    
    UIImageView *forestImage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"forest.jpg"]];
    [forestImage setFrame:CGRectMake(0, 0, self.mmScrollPresenter.frame.size.width, self.mmScrollPresenter.frame.size.height)];
    
    MMScrollPage *firstPage = [[MMScrollPage alloc] init];
    firstPage.titleLabel.text = @"Look a picture of mountains";
    firstPage.detailLabel.text = @"I'm the detail text";
    [firstPage.backgroundView addSubview:mountainImage];
    firstPage.titleBackgroundColor = [UIColor colorWithRed:119/255.0f green:92/255.0f blue:166/255.0f alpha:0.5];
    
    MMScrollPage *secondPage = [[MMScrollPage alloc] init];
    secondPage.titleLabel.text = @"Ooooh now look at the dock";
    secondPage.detailLabel.text = @"I'm still the detail text! I'm useful!";
    [secondPage.backgroundView addSubview:dockImage];
    secondPage.titleBackgroundColor = [UIColor colorWithRed:67/255.0f green:89/255.0f blue:149/255.0f alpha:1.0];
    
    MMScrollPage *thirdPage = [[MMScrollPage alloc] init];
    thirdPage.titleLabel.text = @"Now we're deep in a forest";
    thirdPage.detailLabel.text = @"PAY ATTENTION TO ME";
    [thirdPage.backgroundView addSubview:forestImage];
    thirdPage.titleBackgroundColor = [UIColor colorWithRed:92/255.0f green:166/255.0f blue:114/255.0f alpha:1.0];
    
    [self.mmScrollPresenter addMMScrollPageArray:@[firstPage, secondPage, thirdPage]];
    
    [self setNeedsStatusBarAppearanceUpdate];
}

- (UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}

@end
