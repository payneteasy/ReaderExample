//
//  AppDelegate.m
//  ReaderExample
//
//  Created by Evgeniy Sinev on 29/06/16.
//  Copyright © 2016 payneteasy. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    ViewController * viewController = [[ViewController alloc] init];

    UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:viewController];
    self.window.rootViewController = navigationController;
    [self.window makeKeyAndVisible];

    return YES;
}


@end
