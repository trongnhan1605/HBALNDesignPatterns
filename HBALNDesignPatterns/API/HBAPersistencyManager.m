//
//  PersistencyManager.m
//  HBALNDesignPatterns
//
//  Created by PhucNT13 on 8/18/15.
//  Copyright (c) 2015 HCMUS. All rights reserved.
//

#pragma mark - Import frameworks
#import "HBAPersistencyManager.h"

#pragma mark - Private interface
@interface HBAPersistencyManager ()

// Create array of album
@property (strong, nonatomic) NSMutableArray *albums;

@end

#pragma mark - Class implementing
@implementation HBAPersistencyManager

// Override init method
- (instancetype)init
{
    // Create return value
    self = [super init];
    
    // Config self
    if (self) {
        
        // Create a dumy list of album
        _albums = [NSMutableArray arrayWithArray:
                  @[[[HBALNAlbum alloc] initWithTitle:@"Best of Bowie" artist:@"David Bowie" coverUrlString:@"http://www.coversproject.com/static/thumbs/album/album_david%20bowie_best%20of%20bowie.png" year:@"1992"],
                    [[HBALNAlbum alloc] initWithTitle:@"It's My Life" artist:@"No Doubt" coverUrlString:@"http://www.coversproject.com/static/thumbs/album/album_no%20doubt_its%20my%20life%20%20bathwater.png" year:@"2003"],
                    [[HBALNAlbum alloc] initWithTitle:@"Nothing Like The Sun" artist:@"Sting" coverUrlString:@"http://www.coversproject.com/static/thumbs/album/album_sting_nothing%20like%20the%20sun.png" year:@"1999"],
                    [[HBALNAlbum alloc] initWithTitle:@"Staring at the Sun" artist:@"U2" coverUrlString:@"http://www.coversproject.com/static/thumbs/album/album_u2_staring%20at%20the%20sun.png" year:@"2000"],
                    [[HBALNAlbum alloc] initWithTitle:@"American Pie" artist:@"Madonna" coverUrlString:@"http://www.coversproject.com/static/thumbs/album/album_madonna_american%20pie.png" year:@"2000"]]];
        
    }
    
    // Return value
    return self;
}

#pragma mark Implement public methods

// Get all albums
- (NSArray *)getAlbums
{
    // Just return array of albums
    return self.albums;
}

// Add album to list
- (BOOL)addAlbum:(HBALNAlbum *)album
{
    // Return non success if album does not available
    if (!album) {
        return NO;
    }
    
    // Add to albums if album does not nil and return success
    [self.albums addObject:album];
    return YES;
}

// Add album to list at index
- (BOOL)addAlbum:(HBALNAlbum *)album atIndex:(NSUInteger)index
{
    // Insert to album at end of array if index in out of range
    if (index >= self.albums.count) {
        [self addAlbum:album];
    }
    else {
        if (!album) {
            // Return non success if album does not available
            return NO;
        }
        // Insert to albums if index in range
        [self.albums insertObject:album atIndex:index];
    }
    
    // Return success
    return YES;
}

// Delete album at index
- (BOOL)deleteAlbumAtIndex:(NSUInteger)index
{
    // Return non success if index out of range
    if (index < self.albums.count - 1) {
        return NO;
    }
    
    // Remove album from albums at index that in range and return success
    [self.albums removeObjectAtIndex:index];
    return YES;
}

@end
