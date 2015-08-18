//
//  HTTPClient.h
//  HBALNDesignPatterns
//
//  Created by PhucNT13 on 8/18/15.
//  Copyright (c) 2015 HCMUS. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HBAHTTPClient : NSObject

//- (instancetype)getRequestWithUrl:(NSString *)url;
//- (instancetype)postRequestWithUrl:(NSString *)url andBodyString:(NSString *)body;

// Create API to get image
- (UIImage *)getImageByUrlString:(NSString *)urlString;

// Create singleton class to control HTTPClient
+ (instancetype)sharedInstance;

@end
