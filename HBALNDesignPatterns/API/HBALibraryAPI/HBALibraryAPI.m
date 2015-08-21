//
//  HBALibraryAPI.m
//  HBALNDesignPatterns
//
//  Created by PhucNT13 on 8/18/15.
//  Copyright (c) 2015 HCMUS. All rights reserved.
//

#pragma mark - Import frameworks
#import "HBALibraryAPI.h"
#import "HBAPersistencyManager.h"
#import "HBAHTTPClient.h"

#pragma mark - Private interface
@interface HBALibraryAPI ()

//Create a HBAPersistencyManager instance to control its API
@property (strong, nonatomic) HBAPersistencyManager *persistencyManager;

//Create a HBAHTTPClient instance to control its API
@property (strong, nonatomic) HBAHTTPClient *httpClient;

//Create a HBAHTTPClient instance to control its API
@property (nonatomic) BOOL isOnline;

@end

#pragma mark - Class implementing
@implementation HBALibraryAPI

// Override init method
- (instancetype)init
{
    // Create return value
    self = [super init];
    
    // Config self
    if (self) {
        _persistencyManager = [[HBAPersistencyManager alloc] init];
        _httpClient = [[HBAHTTPClient alloc] init];
        _isOnline = NO;
        
        // Add observer to update image data
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(downloadImage:) name:@"HBADownloadImageNotification" object:nil];
    }
    
    // Return value
    return self;
}

// Remove observer when class was delocating
- (void)dealloc
{
	[[NSNotificationCenter defaultCenter] removeObserver:self];
}

#pragma mark Implement public methods

// Create HBALibraryAPI as singleton class to mutiple access
+ (instancetype)sharedInstance
{
    // Create singleton static variable to share
    static id _singleton = nil;
    static dispatch_once_t predicate;
    
    // Keep instance variable be create just one
    dispatch_once(&predicate, ^{
        _singleton = [[self alloc] init];
    });
    
    // Return instance variable
    return _singleton;
}

#pragma mark HBAPersistencyManager Implementing

// Get all albums
- (NSArray *)getAlbums
{
    // Get list of album through HBAPersistencyManager
    return [self.persistencyManager getAlbums];
}

// Add album to list of album
- (BOOL)addAlbum:(HBALNAlbum *)album
{
    // Add album to albums through HBAPersistencyManager
    BOOL isAdded = [self.persistencyManager addAlbum:album];
    
    // Send album adding info to server
    if (self.isOnline) {
        [self.httpClient postRequestWithUrlString:@"/api/addAlbum" andBodyString:[album description]];
    }
    
    // Return adding result
    return isAdded;
}

// Add album to list of album at index
- (BOOL)addAlbum:(HBALNAlbum *)album atIndex:(NSUInteger)index
{
    // Add album to list of album at index through HBAPersistencyManager
    return [self.persistencyManager addAlbum:album];
}

// Delete album at index
- (BOOL)deleteAlbumAtIndex:(NSUInteger)index
{
    // Delete album from albums at index through HBAPersistencyManager
    BOOL isdeleleted = [self.persistencyManager deleteAlbumAtIndex:index];
    
    // Send album deleting info to server
    if (self.isOnline) {
        [self.httpClient postRequestWithUrlString:@"/api/deleteAlbum" andBodyString:[@(index) description] ];
    }
    
    // Return deleting result
    return isdeleleted;
}

#pragma mark Implement private methods

// Download image
- (void)downloadImage:(NSNotification *)notification
{
    // Collect data from notification
    UIImageView *imageViewNotifier = notification.userInfo[@"imageView"];
    NSString *coverURL = notification.userInfo[@"coverUrl"];
    
    // TODO Load data from local
    imageViewNotifier.image = [self.persistencyManager getImageWithName:[coverURL lastPathComponent] ];
    
    if (!imageViewNotifier.image) { //if no data from local
        
        // Download data
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
            UIImage *image = [self.httpClient getImageByUrlString:coverURL];
            
            dispatch_async(dispatch_get_main_queue(), ^{
                
                imageViewNotifier.image = image;
                
                // Save image to local
                [self.persistencyManager saveImage:image withName:[coverURL lastPathComponent] ];
            });
        });
    }
    
}

@end
