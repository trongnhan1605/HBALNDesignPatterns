//
//  Album.m
//  HBALNDesignPatterns
//
//  Created by PhucNT13 on 8/18/15.
//  Copyright (c) 2015 HCMUS. All rights reserved.
//

#import "HBALNAlbum.h"

@implementation HBALNAlbum

// Init Album
- (HBALNAlbum *)initWithTitle:(NSString *)title artist:(NSString *)artist coverUrlString:(NSString *)coverUrlString year:(NSString *)year
{
    // Create self
    self = [super init];
    
    // Init self
    if (self) {
        _title = title;
        _artist = artist;
        _coverUrl = coverUrlString;
        _year = year;
        _genre = @"Pop";
    }
    
    // Return self
    return self;
}

@end
