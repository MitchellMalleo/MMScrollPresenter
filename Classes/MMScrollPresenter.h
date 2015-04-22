//
//  MMScrollPresenter.h
//  MMScrollPresenter
//
//  Created by Malleo, Mitch on 10/31/14.
//

#import <UIKit/UIKit.h>
#import "MMScrollPage.h"

@interface MMScrollPresenter : UIScrollView <UIScrollViewDelegate>

- (void)addMMScrollPage:(MMScrollPage *)page;
- (void)addMMScrollPageArray:(NSArray *)array;

- (int)currentPage;
- (void)animateToPageAtIndex:(int)index;

@end
