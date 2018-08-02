# Boomware

[![CocoaPods Compatible](https://img.shields.io/cocoapods/v/Boomware.svg)](https://img.shields.io/cocoapods/v/Boomware.svg)
[![Carthage Compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage)

## Installation with CocoaPods

#### Podfile

To integrate Boomware into your Xcode project using CocoaPods, specify it in your `Podfile`:

```ruby
source 'https://github.com/CocoaPods/Specs.git'
platform :ios, '8.0'
use_frameworks!

target 'YourTargetName' do
pod 'Boomware'
end
```

Then, run the following command:

```bash
$ pod install
```

### Installation with Carthage

[Carthage](https://github.com/Carthage/Carthage) is a decentralized dependency manager that builds your dependencies and provides you with binary frameworks.

You can install Carthage with [Homebrew](http://brew.sh/) using the following command:

```bash
$ brew update
$ brew install carthage
```

To integrate Boomware into your Xcode project using Carthage, specify it in your `Cartfile`:

```ogdl
github "boomware/boomware-ios"
github "AFNetworking/AFNetworking" ~> 3.0
github "kishikawakatsumi/UICKeyChainStore"
```

Run `carthage` to build frameworks and drag frameworks `Boomware.framework`, `AFNetworking.framework` and `UICKeyChainStore.framework` into your Xcode project.
Probably you have to add `$(SRCROOT)/Carthage/Build/iOS/` to `Build Settings` -> `Runpath Search Paths`

## Usage

### Init SDK
```objective-c
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Init Boomware SDK
    [BWBoomware setKey:@"48868d4f42e1a29ec0134d254:42e1a29ec0134d254d:8f9ad63d594685df7d"];
    return YES;
}
```

####  Verification Request

```objective-c
[BWBoomware verifyNumber:@"+188811100011" method:BWBoomwareMethodSMS completion:^(NSError * _Nullable error) {
    if (! error) {
    // Number verification successfylly requested
    }
}];

```


#### Complete Verification

```objective-c

NSString *PINCode = @"7777";

[BWBoomware confirmWithCode:PINCode completion:^(NSString * _Nullable phoneNumber, NSString * _Nullable requestId, NSError * _Nullable error) {

    if (! error) {
        // Phone number successfully verified
    }

}];
```

#### Handling Push Notifications

Set a device token to Boomware SDK

```objective-c
- (void)application:(UIApplication *)application didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)deviceToken {
    // Set device token
    [BWBoomware setDeviceToken:deviceToken];
}
```

Handle remote notification

```objective-c
- (void)application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo fetchCompletionHandler:(void (^)(UIBackgroundFetchResult))completionHandler {
    // Check that the notification send by boomware
    if ([BWBoomware isBoomwarePushNotification:userInfo]) {
        // Handle it
        [BWBoomware handlePushNotification:userInfo];
    }
}
```

