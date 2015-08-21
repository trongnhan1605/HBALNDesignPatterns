//
//  HBALNAlbumView.
//  HBALNDesignPatterns
//
//  Created by PhucNT13 on 8/18/15.
//  Copyright (c) 2015 HCMUS. All rights reserved.
//

#pragma mark - Import frameworks
#import "HBALNAlbumView.h"

#pragma mark - Private interface
@interface HBALNAlbumView ()

// Cover image to show in view
@property (copy, nonatomic) UIImageView *coverImage;

// Indicator to present progress on view
@property (copy, nonatomic) UIActivityIndicatorView *indicator;

@end

#pragma mark - Class implementing
@implementation HBALNAlbumView

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
        
        // Post notification to load image data
        [[NSNotificationCenter defaultCenter] postNotificationName:@"HBADownloadImageNotification" object:self userInfo:@{@"imageView":self.coverImage, @"coverUrl":cover}];
		
		// Add observer for cover Image
		[self.coverImage addObserver:self forKeyPath:@"image" options:0 context:nil];
    }
    
    // Return value
    return self;
}

// Remove observer when view locating
- (void)dealloc
{
	[self.coverImage removeObserver:self forKeyPath:@"image"];
}

// Implement KVO for image
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
	if ([keyPath isEqualToString:@"image"]) {
		[self.indicator stopAnimating];
	}
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
