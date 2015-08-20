//
//  HBALNHorizontalScroller.m
//  HBALNDesignPatterns
//
//  Created by PhucNT13 on 8/20/15.
//  Copyright (c) 2015 HCMUS. All rights reserved.
//

#pragma mark - Import frameworks
#import "HBALNHorizontalScroller.h"

#pragma mark - Define macro

#define VIEW_PADDING 10
#define VIEW_DIMENSIONS 100
#define VIEW_OFFSET 100

#pragma mark - Private interface
@interface HBALNHorizontalScroller () <UIScrollViewDelegate>

// Define a scroller
@property (strong, nonatomic) UIScrollView *scroller;

@end

#pragma mark - Class implementing
@implementation HBALNHorizontalScroller

// Override init Class
- (instancetype)initWithFrame:(CGRect)frame
{
    // Create self value
    self = [super initWithFrame:frame];
    
    if (self) {
        
        // Config ScrollView
        self.scroller = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
        self.scroller.delegate = self;
        [self.scroller addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(scrollerTapped:)] ];
        [self addSubview:self.scroller];
    }
    
    // Return self value
    return self;
}

- (void)didMoveToSuperview
{
    [self reload];
}

#pragma mark Implement public methods

- (void)reload
{
    // Nothing to load if no delegate
    if (!self.delegate) {
        return;
    }
    
    // Remove all subview
    [self.scroller.subviews enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        [obj removeFromSuperview];
    }];
    
    // xValue is the starting point of the view inside the scroller
    CGFloat xValue = VIEW_OFFSET;
    
    // we want to enumerate only the subviews that we added
    NSInteger numberOfView = [self.delegate numberOfViewsForHorizontalScroller:self];
    
    // Loop to add new view to scrollview
    for (NSInteger i = 0 ; i< numberOfView; i++) {
        
        // Add the view to the right position
        // Create a sub view to add
        UIView *subScrollView = [self.delegate horizontalScroller:self viewAtIndex:i];
        xValue += VIEW_PADDING;
        
        // Config frame for subview to
        subScrollView.frame = CGRectMake(xValue, VIEW_PADDING, VIEW_DIMENSIONS, VIEW_DIMENSIONS);
        
        // Add sub view to scroller
        [self.scroller addSubview:subScrollView];
        
        // update x asis
        xValue += VIEW_DIMENSIONS;
    }
    
    // Set content size for scrollview if you dont want it scroll
    [self.scroller setContentSize:CGSizeMake(xValue + VIEW_OFFSET, self.frame.size.height)];
    
    // Scroll the view that we has been choosen to the right place
    if ([self.delegate respondsToSelector:@selector(initialViewIndexForHorizontalScroller:)]) {

        NSInteger index = [self.delegate initialViewIndexForHorizontalScroller:self];
        [self.scroller setContentOffset:CGPointMake(index * (VIEW_DIMENSIONS +(2 * VIEW_PADDING)), 0) animated:YES];
    }
    
}

#pragma mark Implement private methods

- (void)scrollerTapped:(UITapGestureRecognizer*)gesture
{
    // Get location of point that we has been taped
    CGPoint tappedPoint = [gesture locationInView:gesture.view];
    
    // we don't want to use enumerator here, because we don't want to go throught all of UIScrollView subviews.
    // we want to enumerate only the subviews that we added
    NSInteger numberOfView = [self.delegate numberOfViewsForHorizontalScroller:self];
    
    // Loop for all view to find taped point
    for (NSUInteger i = 0; i < numberOfView; i++) {
        
        // Get subview in scrollview
        UIView *subScrollView = self.scroller.subviews[i];
        
        if (CGRectContainsPoint(subScrollView.frame, tappedPoint)) {
            
            [self.delegate horizontalScroller:self clickedAtIndex:i];
            [self.scroller setContentOffset:CGPointMake(subScrollView.frame.origin.x - self.frame.size.width/2 + subScrollView.frame.size.width/2, 0) animated:YES];
            break;
        }
    }
}

// TODO Check it later
// Put current view in center
- (void)centerCurrentView
{
    int xFinal = self.scroller.contentOffset.x + (VIEW_OFFSET/2) + VIEW_PADDING;
    // Get Current View index
    int viewIndex = xFinal / (VIEW_DIMENSIONS+(2*VIEW_PADDING));
    
    // Hack for view location
    [self.scroller setContentOffset:CGPointMake(100, 0) animated:YES];
    
    // Click to view after local index
    [self.delegate horizontalScroller:self clickedAtIndex:viewIndex];
}

#pragma mark ScrollViewDelegate Implementing

// Override
- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
{
    if (!decelerate) {
        [self centerCurrentView];
    }
}

// Override
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    [self centerCurrentView];
}

@end
