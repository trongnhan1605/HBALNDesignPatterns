//
//  Album.h
//  HBALNDesignPatterns
//
//  Created by PhucNT13 on 8/18/15.
//  Copyright (c) 2015 HCMUS. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HBALNAlbum : NSObject

@property (copy, nonatomic) NSString *title;
@property (copy, nonatomic) NSString *artist;
@property (copy, nonatomic) NSString *coverUrl;
@property (copy, nonatomic) NSString *year;
@property (copy, nonatomic) NSString *genre;

- (HBALNAlbum *)initWithTitle:(NSString *)title artist:(NSString *)artist coverUrlString:(NSString *)urlString year:(NSString *)year;

@end
