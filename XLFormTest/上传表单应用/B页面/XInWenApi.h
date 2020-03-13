//
//  XInWenApi.h
//  XLFormTest
//
//  Created by 纵昂 on 2020/3/13.
//  Copyright © 2020 https://github.com/ZongAng123. All rights reserved.
//  XLForm简书地址:https://www.jianshu.com/p/c7d2fe799b77
//

#import "ZARequest.h"

NS_ASSUME_NONNULL_BEGIN

@interface XInWenApi : ZARequest //继承ZARequest

//写入方法，可定义参数拼接 userId:(NSString *)userId等等参数
//- (id)initWithPage:(NSString *)page userId:(NSString *)userId;
// 无参数可拼接的
- (id)init;
//- (id)initWithPage:(NSString *)page;
@end

NS_ASSUME_NONNULL_END
