//
//  NSString+AESEncryty.h
//  News
//
//  Created by 鲁成龙 on 2020/4/30.
//  Copyright © 2020 鲁成龙. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSString (AESEncryty)


+ (NSString *)encrypyAES:(NSString *)content key:(NSString *)key;

+ (NSString *)descryptAES:(NSString *)content key:(NSString *)key;

@end

NS_ASSUME_NONNULL_END
