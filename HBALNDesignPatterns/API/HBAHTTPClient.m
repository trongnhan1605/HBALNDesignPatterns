//
//  HTTPClient.m
//  HBALNDesignPatterns
//
//  Created by PhucNT13 on 8/18/15.
//  Copyright (c) 2015 HCMUS. All rights reserved.
//

#pragma mark - Import frameworks
#import "HBAHTTPClient.h"
#import <AFNetworking/AFHTTPSessionManager.h>

#pragma mark - Class implementing
@implementation HBAHTTPClient

#pragma mark Implement public methods

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
