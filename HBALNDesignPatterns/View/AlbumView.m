//
//  AlbumView.m
//  HBALNDesignPatterns
//
//  Created by PhucNT13 on 8/18/15.
//  Copyright (c) 2015 HCMUS. All rights reserved.
//

#pragma mark - Import frameworks
#import "AlbumView.h"

#pragma mark - Private interface
@interface AlbumView ()

// Cover image to show in view
@property (copy, nonatomic) UIImageView *coverImage;

// Indicator to present progress on view
@property (copy, nonatomic) UIActivityIndicatorView *indicator;

@end

#pragma mark - Class implementing
@implementation AlbumView

- (instancetype)initWithFrame:(CGRect)frame albumCover:(NSString *)cover
{
    // Create return value
    self = [super initWithFrame:frame];
    
    // Config self
    if (self) {
        
        // Init cover image
        _coverImage = [[UIImageView alloc] initWithFrame:CGRectMake(5, 5, frame.size.width - 10, frame.size.height - 10)];
        [self addSubview:_coverImage];
        
        // Init cover activity indicator
        _indicator = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:(UIActivityIndicatorViewStyleWhiteLarge)];
        _indicator.center = self.center;
        [_indicator startAnimating];
        [self addSubview:_indicator];
    }
    
    // Return value
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
