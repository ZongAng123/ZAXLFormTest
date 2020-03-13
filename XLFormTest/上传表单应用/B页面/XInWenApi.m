//
//  XInWenApi.m
//  XLFormTest
//
//  Created by 纵昂 on 2020/3/13.
//  Copyright © 2020 https://github.com/ZongAng123. All rights reserved.
//  XLForm简书地址:https://www.jianshu.com/p/c7d2fe799b77
//

#import "XInWenApi.h"

@implementation XInWenApi
{
//    NSString *_page;
//    NSString *_userId;
}


//- (id)initWithPage:(NSString *)page userId:(NSString *)userId {
//    self = [super init];
//    if (self) {
//        _page = page;
//        _userId = userId;
//    }
//    return self;
//}

//- (id)initWithPage:(NSString *)page{
//    self = [super init];
//    if (self) {
//         _page = page;
//    }
//    return self;
//}

- (id)init{
    self = [super init];
    if (self) {
         
    }
    return self;
}

// 新闻数据
- (NSString *)requestUrl {
    return @"/nc/auto/list/5bmz6aG25bGx/0-20.html";
}


//get请求  在这里切换请求方式
- (YTKRequestMethod)requestMethod {
    return YTKRequestMethodGET;
}

//存放参数的方法，没有可以为空
//- (id)requestArgument {
//    return @{
//             @"page": _page,
//             @"userId":_userId,
//             };
//}
@end
