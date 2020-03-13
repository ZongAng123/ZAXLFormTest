//
//  ZARequest.m
//  XLFormTest
//
//  Created by 纵昂 on 2020/3/13.
//  Copyright © 2020 https://github.com/ZongAng123. All rights reserved.
//  XLForm简书地址:https://www.jianshu.com/p/c7d2fe799b77
//

#import "ZARequest.h"

@implementation ZARequest

// 供全局使用
-(NSDictionary<NSString *,NSString *> *)requestHeaderFieldValueDictionary {
//    这是自己测试玩，不需要token全局，座椅隐藏掉，如果在项目上运用要写这一处就可以
//    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
//    NSString *token = [userDefaults objectForKey:@"KEY_USER_TOKEN"];
    
//    return @{@"Token":token};
    return @{};
    
}

- (void)requestFailedPreprocessor
{
//note：子类如需继承，必须必须调用 [super requestFailedPreprocessor];
  [super requestFailedPreprocessor];
  
  NSError * error = self.error;
  
//  if ([error.domain isEqualToString:AFURLResponseSerializationErrorDomain])
//  {
//    //AFNetworking处理过的错误
//
//  }else
    if ([error.domain isEqualToString:YTKRequestValidationErrorDomain])
  {
//    猿题库处理过的错误
    NSLog(@"猿题库error");
    
  }else{
    //系统级别的domain错误，无网络等[NSURLErrorDomain]
    //根据error的code去定义显示的信息，保证显示的内容可以便捷的控制
  }
  [SVProgressHUD showErrorWithStatus:@"网络错误"];
}


@end
