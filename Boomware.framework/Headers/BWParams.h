//
//  BWParams.h
//  Boomware
//
//  Created by Sergey P on 22.08.17.
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

@interface BWParams : NSObject <NSCopying>

NS_ASSUME_NONNULL_BEGIN

- (instancetype)init NS_UNAVAILABLE;
+ (instancetype)new NS_UNAVAILABLE;

NS_ASSUME_NONNULL_END

@property (strong, nonatomic, readonly, nonnull) NSString *method;
@property (strong, nonatomic, readonly, nonnull) NSString *phoneNumber;

@property (strong, nonatomic, nullable) NSString *from;
@property (strong, nonatomic, nullable) NSString *language;
@property (strong, nonatomic, nullable) NSNumber *codeLength;

- (nullable instancetype)initWithMethod:(nonnull NSString *)method
                            phoneNumber:(nonnull NSString *)phoneNumber NS_DESIGNATED_INITIALIZER;

@end

extern NSString *_Nonnull const BWParamsMethodSMS;
extern NSString *_Nonnull const BWParamsMethodCall;
extern NSString *_Nonnull const BWParamsMethodVoice;

