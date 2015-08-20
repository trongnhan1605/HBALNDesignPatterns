//
//  HBALNHorizontalScroller.h
//  HBALNDesignPatterns
//
//  Created by PhucNT13 on 8/20/15.
//  Copyright (c) 2015 HCMUS. All rights reserved.
//

#pragma mark - Import frameworks
#import <UIKit/UIKit.h>

@protocol HBALNHorizontalScrollerDelegate;

#pragma mark - Public interface
@interface HBALNHorizontalScroller : UIView

// Create a delegate of HBALNHorizontalScroller
@property (weak, nonatomic) id<HBALNHorizontalScrollerDelegate> delegate;

// Reloads all the data used to construct
- (void)reload;

@end

#pragma mark - Define protocols
// Create HBALNHorizontalScroller Delegate

@protocol HBALNHorizontalScrollerDelegate <NSObject>
@required

// ask the delegate how many views we want present inside the horizontal scroller
- (NSInteger)numberOfViewsForHorizontalScroller:(HBALNHorizontalScroller *)scroller;

// ask the delegate to return the view that should appear at <index>
- (UIView *)horizontalScroller:(HBALNHorizontalScroller *)scroller viewAtIndex:(NSInteger)index;

// inform the delegate what the view at <index> has been clicked
- (void)horizontalScroller:(HBALNHorizontalScroller *)scroller clickedAtIndex:(NSInteger)index;

@optional

// ask the delegate for the index of the initial view will display.
// This method is optional, default by 0
- (NSInteger)initialViewIndexForHorizontalScroller:(HBALNHorizontalScroller *)scroller;

@end