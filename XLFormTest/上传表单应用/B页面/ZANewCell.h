//
//  ZANewCell.h
//  XLFormTest
//
//  Created by 纵昂 on 2020/3/13.
//  Copyright © 2020 https://github.com/ZongAng123. All rights reserved.
//  XLForm简书地址:https://www.jianshu.com/p/c7d2fe799b77
//

#import <Foundation/Foundation.h>
#import "NewModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface ZANewCell : UITableViewCell

@property (nonatomic,strong) UILabel *titleLab; //新闻标题
@property (nonatomic,strong) UILabel *descriptionLab; //描述
@property (nonatomic,strong) UILabel *timeLab; //时间
@property (nonatomic,strong) UIImageView *headImageView; //图片
@property (nonatomic,strong) UILabel *yuantouLab;


@property (nonatomic,strong) NewModel * model;

//选择
@property (nonatomic, strong) UIButton * selectBtn;
@property (nonatomic, assign) BOOL isSelect;
@property (nonatomic, copy) void(^qhxSelectBlock)(BOOL choice,NSInteger btntag);
@end

NS_ASSUME_NONNULL_END
