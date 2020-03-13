//
//  Factory.m
//  XLForZAApp
//
//  Created by 纵昂 on 2020/1/18.
//  Copyright © 2020 https://github.com/ZongAng123. All rights reserved.
//  XLForm简书地址:https://www.jianshu.com/p/c7d2fe799b77
//

#import "Factory.h"

@implementation Factory
// 图片压缩
+ (NSData *)imageData:(UIImage *)myimage
{
    NSData *data = UIImageJPEGRepresentation(myimage, 1.0);
    if (data.length > 100 * 1024) {
        if (data.length > 1024 * 1024) {// 1M以及以上
            data = UIImageJPEGRepresentation(myimage, 0.1);
        }else if (data.length > 512 * 1024) {// 0.5M-1M
            data = UIImageJPEGRepresentation(myimage, 0.5);
        }else if (data.length > 200 * 1024) {// 0.25M-0.5M
            data = UIImageJPEGRepresentation(myimage, 0.9);
        }
    }
    return data;
}

@end
