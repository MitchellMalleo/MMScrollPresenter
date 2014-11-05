//
//  MMScrollPresenter.h
//  MMScrollPresenter
//
//  Created by Malleo, Mitch on 10/31/14.
//  Copyright (c) 2014 Encore. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MMScrollPage.h"

@interface MMScrollPresenter : UIScrollView <UIScrollViewDelegate>

-(int)currentPage;
-(void)animateToPageAtIndex:(int)index;
-(void)addMMScrollPage:(MMScrollPage *)page;
-(void)setupViewsWithArray:(NSArray *)array;

@end
