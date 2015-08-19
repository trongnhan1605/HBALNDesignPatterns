//
//  HBALNAlbum+HBALNTableRepresentation.h
//  HBALNDesignPatterns
//
//  Created by PhucNT13 on 8/19/15.
//  Copyright (c) 2015 HCMUS. All rights reserved.
//

#pragma mark - Import frameworks
#import "HBALNAlbum.h"

#pragma mark - Public interface
@interface HBALNAlbum (HBALNTableRepresentation)

// Get info that table will present
- (NSDictionary *)tr_tableRepresentation;

@end
