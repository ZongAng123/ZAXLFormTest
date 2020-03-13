//
//  NewModel.h
//  XLFormTest
//
//  Created by 纵昂 on 2020/3/13.
//  Copyright © 2020 https://github.com/ZongAng123. All rights reserved.
//  XLForm简书地址:https://www.jianshu.com/p/c7d2fe799b77
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NewModel : NSObject
@property (nonatomic,copy)NSString * content;
@property (nonatomic,copy)NSString * source;
@property (nonatomic,copy)NSString * unixtime;
@property (nonatomic,copy)NSString * updatetime;

//title
@property (nonatomic,copy)NSString * ltitle;
//digest
@property (nonatomic,copy)NSString * digest;
//
@property (nonatomic,copy)NSString * lmodify;
@property (nonatomic,copy)NSString * imgsrc; //配图
@property (nonatomic,copy)NSString * hint; //作者

@property (nonatomic,strong) NSString *url;


@end

NS_ASSUME_NONNULL_END
