# MMScrollPresenter
---

![](file:///Users/mmalleo/Desktop/Personal%20Projects/MMScrollPresenter/mmScrollPresenterGif.gif)

## Overview
---
MMScrollPresenter is a control for iOS development that takes an array of MMScrollPages and displays them in your UIScrollView. 

I was initially insipired by a control in Destiny App, so I'd recommend checking that out as well.

### Example Usage

1. Download the project and include MMScrollPresenter.h/.m, MMScrollPage.h/.m, arrow/@2x.png
2. Drag and drop a UIScrollView into your Interface Builder and under the custom class section, subclass your UIScrollView to MMScrollPresenter
3. Now add: `@property (weak, nonatomic) IBOutlet MMScrollPresenter *mmScrollPresenter;` to your list of properties.
4. Add a MMScrollPage to the MMScrollPresenter

Here is a a snippet of code from the example app in the `- (void)viewDidLoad` method for #4:
	
	UIImageView *mountainImage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"mountains.jpg"]];
    [mountainImage setFrame:CGRectMake(0, 0, self.mmScrollPresenter.frame.size.width, self.mmScrollPresenter.frame.size.height)];
    
    MMScrollPage *firstPage = [[MMScrollPage alloc] init];
    firstPage.titleLabel.text = @"Look a picture of mountains";
    firstPage.detailLabel.text = @"I'm the detail text";
    [firstPage.backgroundView addSubview:mountainImage];
    firstPage.titleBackgroundColor = [UIColor colorWithRed:119/255.0f green:92/255.0f blue:166/255.0f alpha:0.5];
    
    [self.mmScrollPresenter setupViewsWithArray:@[firstPage]];