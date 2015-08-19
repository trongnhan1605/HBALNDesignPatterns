//
//  HBALNAlbum+HBALNTableRepresentation.m
//  HBALNDesignPatterns
//
//  Created by PhucNT13 on 8/19/15.
//  Copyright (c) 2015 HCMUS. All rights reserved.
//

#pragma mark - Import frameworks
#import "HBALNAlbum+HBALNTableRepresentation.h"

#pragma mark - Private interface
@implementation HBALNAlbum (HBALNTableRepresentation)

// Get info that table will present
- (NSDictionary *)tr_tableRepresentation
{
    return @{@"titles":@[@"Artist", @"Album", @"Genre", @"Year"],
             @"values":@[self.artist, self.title, self.genre, self.year]};
}

@end
