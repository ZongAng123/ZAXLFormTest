//
//  ZAXFormPickerRecipienCell.m
//  XLFormTest
//  XLForm简书地址:https://www.jianshu.com/p/c7d2fe799b77
//  Created by 纵昂 on 2020/3/13.
//  Copyright © 2020 https://github.com/ZongAng123. All rights reserved.
//

#import "ZAXFormPickerRecipienCell.h"
#import <Masonry.h>

NSString * const XLFormRowDescriptorTypeRecipienCell = @"XLFormRowDescriptorTypeRecipienCell";

@interface ZAXFormPickerRecipienCell ()<UIActionSheetDelegate, UIPickerViewDelegate, UIPickerViewDataSource, UIPopoverControllerDelegate>

@property (nonatomic) UIPickerView * pickerView;

@property (nonatomic) UIPopoverController *popoverController;

@end

@implementation ZAXFormPickerRecipienCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.text = @"传个h值:";
        [self.contentView addSubview:self.titleLabel];
        
//        这个图片可以设置在cell的最左边，一般不设置，
        _titleImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"message_cell_arrow"]];
        [self.contentView addSubview:_titleImageView];
        
        
        _detaileLabel = [[UILabel alloc] init];
        _detaileLabel.text = @"接收的值";
        [self.contentView addSubview:self.detaileLabel];
    }
    return self;
}


- (void)layoutSubviews {
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView.mas_left).offset(12);
        make.centerY.equalTo(self.contentView.mas_centerY);
    }];
    
    [_titleImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(_titleLabel.mas_centerY);
        make.right.equalTo(self.contentView.mas_right).offset(-10);
    }];
    
//    接受值
    [self.detaileLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.titleLabel.mas_right).offset(30);
        make.centerY.equalTo(self.contentView.mas_centerY);
    }];
    
}

+(void)load {
    
    [[XLFormViewController cellClassesForRowDescriptorTypes] setObject:[ZAXFormPickerRecipienCell class] forKey:XLFormRowDescriptorTypeRecipienCell];
}

-(void)formDescriptorCellDidSelectedWithFormController:(XLFormViewController *)controller{
    UIViewController * controllerToPresent = nil;
    if ((controllerToPresent = [self controllerToPresent])){
        UIViewController<XLFormRowDescriptorViewController> *selectorViewController = (UIViewController<XLFormRowDescriptorViewController> *)controllerToPresent;
        selectorViewController.rowDescriptor = self.rowDescriptor;
        selectorViewController.title = self.rowDescriptor.selectorTitle;
        
        if ([self.rowDescriptor.rowType isEqualToString:XLFormRowDescriptorTypeSelectorPopover]) {
            
        }
        else {
            [controller.navigationController pushViewController:selectorViewController animated:YES];
        }
    }
}

//传值代码关键语句
-(NSString *)valueDisplayText
{
    if (!self.rowDescriptor.value){
        return self.rowDescriptor.noValueDisplayText;
    }
    if (self.rowDescriptor.valueTransformer){
        NSAssert([self.rowDescriptor.valueTransformer isSubclassOfClass:[NSValueTransformer class]], @"valueTransformer is not a subclass of NSValueTransformer");
        NSValueTransformer * valueTransformer = [self.rowDescriptor.valueTransformer new];
        NSString * tranformedValue = [valueTransformer transformedValue:self.rowDescriptor.value];
        NSLog(@"tranformedValue:%@",tranformedValue);
        if (tranformedValue){
            
            return tranformedValue;
        }
    }
    return self.rowDescriptor.displayTextValue;
}

#pragma mark - XLFormDescriptorCell

-(void)configure
{
    [super configure];
}
//一直到这里
-(void)update
{
    [super update];
    
    self.titleLabel.text = [NSString stringWithFormat:@"%@%@", self.rowDescriptor.title, self.rowDescriptor.required && self.rowDescriptor.sectionDescriptor.formDescriptor.addAsteriskToRequiredRowsTitle ? @"*" : @""];
//    关键代码 传值
    self.detaileLabel.text = [self valueDisplayText];
    
}

// 传值语法
-(UIViewController *)controllerToPresent
{
    if (self.rowDescriptor.action.viewControllerClass){
        return [[self.rowDescriptor.action.viewControllerClass alloc] init];
    }
    
    return nil;
}

@end
