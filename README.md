# Boomware

## Installation with CocoaPods

[CocoaPods](http://cocoapods.org) is a dependency manager for Objective-C, which automates and simplifies the process of using 3rd-party libraries like AFNetworking in your projects. You can install it with the following command:

```bash
$ gem install cocoapods
```

#### Podfile

To integrate VerifireKit into your Xcode project using CocoaPods, specify it in your `Podfile`:

```ruby
source 'https://github.com/CocoaPods/Specs.git'
platform :ios, '8.0'
use_frameworks!

target 'YourTargetName' do
pod 'Boomware'
end
```

`use_frameworks!` Required option


Then, run the following command:

```bash
$ pod install
```

## Usage

### Init SDK
```objective-c
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Init Boomware SDK
    [BWBoomware setKey:@"youkey:youkey:youkey"];
    return YES;
}
```

####  Verification Request

```objective-c

[BWBoomware verifyNumber:@"+188811100011" method:BWBoomwareMethodSMS completion:^(NSError * _Nullable error) {

if (! error)
{
// Number verification successfylly requested
}
}];

```


#### Complete Verification

```objective-c

NSString *PINCode = @"7777";

[BWBoomware confirmWithCode:PINCode completion:^(NSString * _Nullable phoneNumber, NSString * _Nullable requestId, NSError * _Nullable error) {

if (! error)
{
// Phone number successfully verified
}

}];
```

