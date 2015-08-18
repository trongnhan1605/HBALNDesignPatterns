//
//  PersistencyManager.h
//  HBALNDesignPatterns
//
//  Created by PhucNT13 on 8/18/15.
//  Copyright (c) 2015 HCMUS. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HBALNAlbum.h"

@interface PersistencyManager : NSObject

// Get all albums
- (NSArray *)getAlbums;

// Add album to list
- (BOOL)addAlbum:(HBALNAlbum *)album;

// Add album to list at index
- (BOOL)addAlbum:(HBALNAlbum *)album atIndex:(NSUInteger)index;

// Delete album at index
- (BOOL)deleteAlbumAtIndex:(NSUInteger)index;

@end
