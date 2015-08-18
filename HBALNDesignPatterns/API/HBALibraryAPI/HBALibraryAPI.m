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
    }
    
    // Return value
    return self;
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

@end
