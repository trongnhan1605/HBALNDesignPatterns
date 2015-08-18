//
//  AlbumView.h
//  HBALNDesignPatterns
//
//  Created by PhucNT13 on 8/18/15.
//  Copyright (c) 2015 HCMUS. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AlbumView : UIView

// Init AlbumView with frame and cover info
- (instancetype)initWithFrame:(CGRect)frame albumCover:(NSString *)cover;

@end
