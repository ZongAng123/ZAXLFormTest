//
//  ZAXFormPickerRecipienCell.h
//  XLFormTest
//  XLForm简书地址:https://www.jianshu.com/p/c7d2fe799b77
//  Created by 纵昂 on 2020/3/13.
//  Copyright © 2020 https://github.com/ZongAng123. All rights reserved.
//  这边就等同于自定tableview自定义的一个cell行
//


//1、引入XLForm库
#import <XLForm/XLForm.h>

NS_ASSUME_NONNULL_BEGIN

extern NSString * const XLFormRowDescriptorTypeRecipienCell;

//2、改变继承关系 XLFormBaseCell
@interface ZAXFormPickerRecipienCell : XLFormBaseCell

@property (nonatomic, strong) UILabel *titleLabel; //传个值

@property (nonatomic, strong) UIImageView *titleImageView; //图片

@property (nonatomic, strong) UILabel *detaileLabel; //接受传值的

@end

NS_ASSUME_NONNULL_END
