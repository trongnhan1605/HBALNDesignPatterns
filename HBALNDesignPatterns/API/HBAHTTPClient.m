//
//  HTTPClient.m
//  HBALNDesignPatterns
//
//  Created by PhucNT13 on 8/18/15.
//  Copyright (c) 2015 HCMUS. All rights reserved.
//

#import "HBAHTTPClient.h"

// Import AFNetworking
#import <AFNetworking/AFHTTPSessionManager.h>


@implementation HBAHTTPClient

// Create singleton class to control HTTPClient
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

// Create API to get image
- (UIImage *)getImageByUrlString:(NSString *)urlString
{
    //Create Image for getting
    UIImage *image;
    
    //TODO Convert UrlString to URL
    NSURL *imageUrl = [NSURL URLWithString:urlString];
    
    //TODO Download image by URL
    NSData *data = [NSData dataWithContentsOfURL:imageUrl];
    
    //TODO Return Image (format: Image)
    image = [UIImage imageWithData:data];
    
    //TODO Return Image
    return image;
}

@end
