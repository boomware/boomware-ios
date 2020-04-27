//
//  BWBoomware.h
//  Boomware
//
//  Created by Sergey P on 15.08.17.
//  Copyright © 2018 Boomware (http://boomware.com/). All rights reserved.
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software to use and to permit persons to whom the Software is furnished
//  to do so in connection with the web services and APIs provided by Boomware,
//  subject to the conditions described on the Boomware website and hereby:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@class BWParams;

@interface BWBoomware : NSObject

typedef enum : NSUInteger
{
    BWBoomwareMethodSMS = 0,
    BWBoomwareMethodVoice,
    BWBoomwareMethodCall,
}
BWBoomwareMethod;

- (instancetype)init NS_UNAVAILABLE;
+ (instancetype)new NS_UNAVAILABLE;

/*!
 * Default method to init SDK
 * @param key is a required developer key. More info on https://boomware.com/
 */
+ (void)setKey:(nonnull NSString *)key;

/*!
 * To begin phone number verification call the method with phone number and method.
 * @param phoneNumber is a valid phone number in international E164 format example: +1234567890
 * @param method one of the required methods `BWBoomwareMethodSMS`, `BWBoomwareMethodVoice`, `BWBoomwareMethodCall`
 * @param callback is a block to handle the result of requested verification. If the `error` is nil verification request succeeded.
 */
+ (void)verifyNumber:(nonnull NSString *)phoneNumber method:(BWBoomwareMethod)method
          completion:(nonnull void (^)(NSError *_Nullable error))callback NS_SWIFT_NAME(verify(number:method:completion:));

/*!
 * Customized version of verifyNumber
 * @param params configuration of verification params
 * @param callback is a block to handle the result of requested verification. If the `error` is nil verification request succeeded.
*/
+ (void)verifyParams:(nonnull BWParams *)params
          completion:(void (^)(NSError * _Nullable))callback NS_SWIFT_NAME(verify(params:completion:));

/*!
 * To complete the verification call the method with a PIN `code`. And receive result of the verification.
 * @param code - is a PIN code send by chosen method earlier. In case `call` it 4 last digits CLI of the incoming call.
 * @param callback - is handling the result of verification, if `error` is nil the verification was successfully completed and phone number is verified.
 * `requestId` is a unique id of the current verification it can be used to check the number on a backend REST method `/verify/info` more on https://boomware.com/
 */
+ (void)confirmWithCode:(nonnull NSString *)code
             completion:(nonnull void (^)(NSString *_Nullable phoneNumber, NSString *_Nullable requestId, NSError *_Nullable error))callback NS_SWIFT_NAME(confirm(code:completion:));

/*!
 * Verified phone number or number that you set for SDK
 */
+ (nullable NSString *)phoneNumber;

/*!
 * Use this method to set a phone number in case when verification is not applicable
 * @param phoneNumber is a valid phone number is E164 format example: +1234567890
 */
+ (void)setPhoneNumber:(nonnull NSString *)phoneNumber;

/*!
 * Set the device token for push notifications. Once the device token is set, use methods check `isBoomwarePushNotification` and
 * `handlePushNotification` to handle a push notifications.
 * @param deviceToken The device token provided in the `didRegisterForRemoteNotificationsWithDeviceToken` appDelegate method.
 */
+ (void)setDeviceToken:(nonnull NSData *)deviceToken;

/*!
 * Use this method to handle a push notification payload received by Boomware. Check if this
 * notification was send by Boomware with `+[BWBoomware isBoomwarePushNotification:]`.
 */
+ (void)handlePushNotification:(nonnull NSDictionary *)userInfo;

/*!
 * Use this method to check if a push notification payload was sent by Boomware. Typically you should call
 * +[BWBoomware handlePushNotification:] after checking this.
 * @return YES if the payload is an Boomware push notification, NO otherwise.
 */
+ (BOOL)isBoomwarePushNotification:(nonnull NSDictionary *)userInfo;

/*!
 * The method is removing all the data
 */
+ (void)removeDataWithCompletion:(nonnull void (^)(NSError *_Nullable error))callback;

/*!
 * Track event
 */
+ (void)eventWithName:(nonnull NSString *)name attributes:(nullable NSDictionary *)attributes;

@end

typedef enum : NSUInteger
{
    BWBoomwareErrorUnknown = 0,
    BWBoomwareErrorInvalidCode,
    BWBoomwareErrorInvalidPhoneNumber,
}
BWBoomwareError;

extern NSString *_Nonnull const BWBoomwareErrorDomain;

NS_ASSUME_NONNULL_END
