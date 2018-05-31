//
//  AppDelegate.m
//  Boom
//
//  Created by Sergey P on 31.05.2018.
//  Copyright © 2018 Boomware. All rights reserved.
//

#import "AppDelegate.h"
#import <Boomware/Boomware.h>

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {

    // Init Boomware SDK
    [BWBoomware setKey:@"youkey:youkey:youkey"];
    return YES;
}

- (void)application:(UIApplication *)application didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)deviceToken {

    // Set device token
    [BWBoomware setDeviceToken:deviceToken];
}

- (void)application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo fetchCompletionHandler:(void (^)(UIBackgroundFetchResult))completionHandler {

    // Check that the notification send by boomware
    if ([BWBoomware isBoomwarePushNotification:userInfo]) {
        // Handle it
        [BWBoomware handlePushNotification:userInfo];
    }

}

@end
