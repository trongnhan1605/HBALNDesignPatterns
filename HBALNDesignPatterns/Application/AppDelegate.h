//
//  AppDelegate.h
//  HBALNDesignPatterns
//
//  Created by PhucNT13 on 8/18/15.
//  Copyright (c) 2015 HCMUS. All rights reserved.
//

#pragma mark - Import frameworks
#import <UIKit/UIKit.h>

#pragma mark - Public interface
@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

// Create a root view controller
@property (strong, nonatomic) UIViewController *rootViewController;

@end

