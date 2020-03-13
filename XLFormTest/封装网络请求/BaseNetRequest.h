//
//  BaseNetRequest.h
//  XLFormTest
//
//  Created by 纵昂 on 2020/3/13.
//  Copyright © 2020 https://github.com/ZongAng123. All rights reserved.
//  XLForm简书地址:https://www.jianshu.com/p/c7d2fe799b77
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface BaseNetRequest : NSObject
+ (void)getDataWithUrl:(NSString *)url Param:(NSDictionary *)param success:(void (^)(id responseObject))success failure:(void (^) (NSError *error))failure;

+ (void)postDataWithUrl:(NSString *)url Param:(NSDictionary *)param success:(void (^)(id responseObject))success failure:(void (^) (NSError *error))failure;

@end

NS_ASSUME_NONNULL_END
