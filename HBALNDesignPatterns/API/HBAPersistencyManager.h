//
//  PersistencyManager.h
//  HBALNDesignPatterns
//
//  Created by PhucNT13 on 8/18/15.
//  Copyright (c) 2015 HCMUS. All rights reserved.
//

#pragma mark - Import frameworks
#import <UIKit/UIKit.h>
#import "HBALNAlbum.h"

#pragma mark - Public interface
@interface HBAPersistencyManager : NSObject

// Get all albums
- (NSArray *)getAlbums;

// Add album to list
- (BOOL)addAlbum:(HBALNAlbum *)album;

// Add album to list at index
- (BOOL)addAlbum:(HBALNAlbum *)album atIndex:(NSUInteger)index;

// Delete album at index
- (BOOL)deleteAlbumAtIndex:(NSUInteger)index;

// Save image to local
- (BOOL)saveImage:(UIImage *)image withName:(NSString *)fileName;

// Get image from local
- (UIImage *)getImageWithName:(NSString *)imageName;

@end
