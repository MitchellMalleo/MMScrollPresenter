# MMScrollPresenter
---

![](https://github.com/MitchellMalleo/MMScrollPresenter/blob/master/mmScrollPresenter.gif)

## Overview
---
MMScrollPresenter is a control for iOS development that takes an array of MMScrollPages and displays them in your UIScrollView. 

I was initially insipired by a control in the Destiny App, so I'd recommend checking that out as well.

### Example Usage

1. Download the repo and include MMScrollPresenter.h/.m, MMScrollPage.h/.m, arrow/@2x.png in your app
2. Drag and drop a UIScrollView into your Interface Builder and under the custom class section, subclass your UIScrollView to MMScrollPresenter
3. Now add: `@property (nonatomic, weak) IBOutlet MMScrollPresenter *mmScrollPresenter;` to your list of properties and dont forget to link it up in your Interface Builder
4. Add a MMScrollPage to the MMScrollPresenter

Here is a code snippet from the example app in the `- (void)viewDidLoad` method for #4:
	
	UIImageView *mountainImage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"mountains.jpg"]];
    [mountainImage setFrame:CGRectMake(0, 0, self.mmScrollPresenter.frame.size.width, self.mmScrollPresenter.frame.size.height)];
    
    MMScrollPage *firstPage = [[MMScrollPage alloc] init];
    firstPage.titleLabel.text = @"Look a picture of mountains";
    firstPage.detailLabel.text = @"I'm the detail text";
    [firstPage.backgroundView addSubview:mountainImage];
    firstPage.titleBackgroundColor = [UIColor colorWithRed:119/255.0f green:92/255.0f blue:166/255.0f alpha:0.5];
    
    [self.mmScrollPresenter setupViewsWithArray:@[firstPage]];

## License

MMScrollPresenter is available under the MIT license. See the LICENSE file for more info.