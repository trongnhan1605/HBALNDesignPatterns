//
//  HTTPClient.h
//  HBALNDesignPatterns
//
//  Created by PhucNT13 on 8/18/15.
//  Copyright (c) 2015 HCMUS. All rights reserved.
//

#pragma mark - Import frameworks
#import <UIKit/UIKit.h>

#pragma mark - Public interface
@interface HBAHTTPClient : NSObject

- (instancetype)getRequestWithUrlString:(NSString *)url;
- (instancetype)postRequestWithUrlString:(NSString *)url andBodyString:(NSString *)body;

// Create API to get image
- (UIImage *)getImageByUrlString:(NSString *)urlString;

@end
