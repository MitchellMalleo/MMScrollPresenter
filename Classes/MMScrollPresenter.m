//
//  MMScrollPresenter.m
//  MMScrollPresenter
//
//  Created by Malleo, Mitch on 10/31/14.
//

#import "MMScrollPresenter.h"

static int const MMTitleViewXOffset = 50;
static int const MMTitleViewHeight = 75;
static int const MMPageViewPadding = 20;

@interface MMScrollPresenter()

@property (strong, nonatomic) NSMutableArray *pageArray;
@property (strong, nonatomic) UIScrollView *titleScrollView;
@property (strong, nonatomic) UIScrollView *labelScrollView;
@property (strong, nonatomic) NSMutableArray *labelScrollViewArray;

@property CGRect backgroundFrame;

@property CGRect titleViewFrame;
@property CGRect titleLabelFrame;
@property CGRect titleDetailLabelFrame;
@property CGRect iconFrame;

@end

#pragma mark - MMScrollPresenter

@implementation MMScrollPresenter

#pragma mark - Public methods

- (void)addMMScrollPage:(MMScrollPage *)page
{
    if(self.pageArray == nil)
    {
        [self setupScrollPresenter];
    }
    
    [self.pageArray addObject:page];
    
    [[self subviews] makeObjectsPerformSelector:@selector(removeFromSuperview)];
    
    for(MMScrollPage *page in self.pageArray)
    {
        [[page.titleView subviews] makeObjectsPerformSelector:@selector(removeFromSuperview)];
    }
    
    [self setupViews];
}

- (void)addMMScrollPageArray:(NSMutableArray *)array
{
    [self setupScrollPresenter];
    
    self.pageArray = array;
    
    [self setupViews];
}

- (void)setupViews
{
    self.titleScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, self.frame.size.height - MMTitleViewHeight, self.frame.size.width * [self.pageArray count], MMTitleViewHeight)];
    [self.titleScrollView setScrollEnabled:NO];
    [self addSubview:self.titleScrollView];
    int pageArrayIndex = 0;
    
    for (MMScrollPage *page in self.pageArray)
    {
        self.backgroundFrame = CGRectMake(self.frame.size.width * pageArrayIndex, 0, self.frame.size.width, self.frame.size.height);
        
        UIImageView *iconView = [[UIImageView alloc] initWithImage:page.icon];
        
        if([self.pageArray count] == 1)
        {
            self.titleViewFrame = CGRectMake(0, 0, self.backgroundFrame.size.width, MMTitleViewHeight);
            self.iconFrame = CGRectMake(- MMTitleViewXOffset, (MMTitleViewHeight / 2) - (iconView.frame.size.height / 2), iconView.frame.size.width, iconView.frame.size.height);
        }
        else if(pageArrayIndex == 0)
        {
            self.titleViewFrame = CGRectMake(0, 0, self.backgroundFrame.size.width -  MMTitleViewXOffset, MMTitleViewHeight);
            self.iconFrame = CGRectMake(- MMTitleViewXOffset, (MMTitleViewHeight / 2) - (iconView.frame.size.height / 2), iconView.frame.size.width, iconView.frame.size.height);
        }
        else if(pageArrayIndex != [self.pageArray count] - 1)
        {
            self.titleViewFrame = CGRectMake(self.frame.size.width * pageArrayIndex -  MMTitleViewXOffset, 0, self.backgroundFrame.size.width -  MMTitleViewXOffset, MMTitleViewHeight);
            self.iconFrame = CGRectMake( MMTitleViewXOffset / 2 - iconView.frame.size.width / 2, (MMTitleViewHeight / 2) - (iconView.frame.size.height / 2), iconView.frame.size.width, iconView.frame.size.height);
        }
        else if(pageArrayIndex == [self.pageArray count] - 1)
        {
            self.titleViewFrame = CGRectMake(self.frame.size.width * pageArrayIndex - ( MMTitleViewXOffset * 2), 0, self.backgroundFrame.size.width +  MMTitleViewXOffset, MMTitleViewHeight);
            self.iconFrame = CGRectMake( MMTitleViewXOffset + ( MMTitleViewXOffset / 2 - iconView.frame.size.width / 2), (MMTitleViewHeight / 2) - (iconView.frame.size.height / 2), iconView.frame.size.width, iconView.frame.size.height);
        }
        
        page.backgroundView.frame = self.backgroundFrame;
        [self addSubview:page.backgroundView];
        [self sendSubviewToBack:page.backgroundView];
        
        page.titleView.frame = self.titleViewFrame;
        
        CGRect titleLabelFrame = CGRectMake(10 + ( MMTitleViewXOffset * pageArrayIndex), MMTitleViewHeight / 100, page.titleView.frame.size.width - MMPageViewPadding, MMTitleViewHeight / 1.7);
        page.titleLabel.frame = titleLabelFrame;
        
        CGRect titleDetailLabelFrame = CGRectMake(10 + ( MMTitleViewXOffset * pageArrayIndex), MMTitleViewHeight / 2.2, page.titleView.frame.size.width - MMPageViewPadding, MMTitleViewHeight / 2);
        page.detailLabel.frame = titleDetailLabelFrame;
        
        self.labelScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, page.titleView.frame.size.width, page.titleView.frame.size.height)];
        [page.titleView addSubview:self.labelScrollView];
        
        UIView *titleViewBackground = [[UIView alloc] initWithFrame:self.labelScrollView.frame];
        titleViewBackground.alpha = 0.5;
        titleViewBackground.backgroundColor = page.titleBackgroundColor;
        [page.titleView addSubview:titleViewBackground];
        [page.titleView sendSubviewToBack:titleViewBackground];
        
        [self.labelScrollView addSubview:page.detailLabel];
        [self.labelScrollView addSubview:page.titleLabel];
        
        [self.titleScrollView addSubview:page.titleView];
        
        [self.labelScrollViewArray addObject:self.labelScrollView];
        
        iconView.frame = self.iconFrame;
        [self.labelScrollView addSubview:iconView];
        
        pageArrayIndex++;
    }
    
    self.contentSize = CGSizeMake(self.frame.size.width * self.pageArray.count, self.frame.size.height);
    self.titleScrollView.contentSize = self.contentSize;
}

- (int)currentPage
{
    return self.contentOffset.x / self.frame.size.width;
}

- (void)animateToPageAtIndex:(int)index
{
    self.contentOffset = CGPointMake(self.frame.size.width * index, self.contentOffset.y);
}

#pragma mark - Private methods

- (void)setupScrollPresenter
{
    self.showsHorizontalScrollIndicator = NO;
    self.showsVerticalScrollIndicator = NO;
    self.pagingEnabled = YES;
    self.delegate = self;
    self.bounces = NO;
    
    self.pageArray = [[NSMutableArray alloc] init];
    self.labelScrollViewArray = [[NSMutableArray alloc] init];
}

#pragma mark - UIScrollViewDelegate

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    scrollView.contentOffset = CGPointMake(scrollView.contentOffset.x, 0);
    
    self.titleScrollView.contentOffset = CGPointMake(scrollView.contentOffset.x * -(MMTitleViewXOffset / self.frame.size.width), scrollView.contentOffset.y);
    
    for(UIScrollView *labelScrollView in self.labelScrollViewArray)
    {
        labelScrollView.contentOffset = CGPointMake(scrollView.contentOffset.x * (MMTitleViewXOffset / self.frame.size.width), scrollView.contentOffset.y);
    }
}

@end
