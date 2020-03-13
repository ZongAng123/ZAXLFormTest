//
//  ZAGoodsViewController.m
//  XLFormTest
//
//  Created by 纵昂 on 2020/3/13.
//  Copyright © 2020 https://github.com/ZongAng123. All rights reserved.
//  XLForm简书地址:https://www.jianshu.com/p/c7d2fe799b77
//


#import "ZAGoodsViewController.h"
#import "ZAXFormPickerRecipienCell.h" //导入需要传值的地方，才可以controller页面
#import "TwoViewController.h" //B页面 从这个页面拿值

@interface ZAGoodsViewController ()

@end

@implementation ZAGoodsViewController

NSString * const Claimsitems = @"Claimsitems";//申领物品
NSString * const Numberitems = @"Numberitems";//物品个数
NSString * const Recipientsreason = @"Recipientsreason";//领用原因
NSString * const Approverselection = @"Approverselection";//审批人选择
NSString * const UserMain = @"UserMain";//审批人选择


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.title = @"XLForm表单库";
    
}

#pragma mark  验证表格完整性
-(void)validateForm{
    NSArray * array = [self formValidationErrors];
    NSLog(@"%lu",(unsigned long)array.count);
    [array enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        XLFormValidationStatus * validationStatus = [[obj userInfo] objectForKey:XLValidationStatusErrorKey];
        if ([validationStatus.rowDescriptor.tag isEqualToString:Claimsitems]){ //申领物品
            UITableViewCell * cell = [self.tableView cellForRowAtIndexPath:[self.form indexPathOfFormRow:validationStatus.rowDescriptor]];
            [self animateCell:cell];
        } else if ([validationStatus.rowDescriptor.tag isEqualToString:Numberitems]) { //物品个数
            UITableViewCell * cell = [self.tableView cellForRowAtIndexPath:[self.form indexPathOfFormRow:validationStatus.rowDescriptor]];
            [self animateCell:cell];
        } else if ([validationStatus.rowDescriptor.tag isEqualToString:Recipientsreason]) { //领用原因
            UITableViewCell * cell = [self.tableView cellForRowAtIndexPath:[self.form indexPathOfFormRow:validationStatus.rowDescriptor]];
            [self animateCell:cell];
        }
        else if ([validationStatus.rowDescriptor.tag isEqualToString:Approverselection]) { //选择审批人
            UITableViewCell * cell = [self.tableView cellForRowAtIndexPath:[self.form indexPathOfFormRow:validationStatus.rowDescriptor]];
            [self animateCell:cell];
        }
        [SVProgressHUD showInfoWithStatus:@"信息填写不完整"];
    }];
    
//调用网络请求处
    
    
    
}
-(void)animateCell:(UITableViewCell *)cell {
    CAKeyframeAnimation *animation = [CAKeyframeAnimation animation];
    animation.keyPath = @"position.x";
    animation.values =  @[@0, @20, @-20, @10, @0];
    animation.keyTimes = @[@0, @(1 / 6.0), @(3 / 6.0), @(5 / 6.0), @1];
    animation.duration = 0.3;
    animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut];
    animation.additive = YES;
    
    [cell.layer addAnimation:animation forKey:@"shake"];
}

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self){
        [self initializeForm];
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self){
        [self initializeForm];
    }
    return self;
}

- (void)initializeForm{
    XLFormDescriptor * form;
    XLFormSectionDescriptor * section;
    XLFormRowDescriptor * row;
    
    form = [XLFormDescriptor formDescriptorWithTitle:@""];
    
// First section
    section = [XLFormSectionDescriptor formSection];
    [form addFormSection:section];
    // 申领物品
    row = [XLFormRowDescriptor formRowDescriptorWithTag:Claimsitems rowType:XLFormRowDescriptorTypeRecipienCell title:@"传个值:"];
    row.action.viewControllerClass = [TwoViewController class]; //库存列表
    [section addFormRow:row];
    
//    Numberitems 物品个数
    row = [XLFormRowDescriptor formRowDescriptorWithTag:Numberitems rowType:XLFormRowDescriptorTypeText title:@"物品个数"];
    row.required = YES;
    [section addFormRow:row];

//         测试新增栏目  自带cell
//    section = [XLFormSectionDescriptor formSectionWithTitle:@"新增领用物品"
//                                             sectionOptions:XLFormSectionOptionCanInsert
//                                          sectionInsertMode:XLFormSectionInsertModeButton];
//    [form addFormSection:section];
//    row = [XLFormRowDescriptor formRowDescriptorWithTag:Claimsitems rowType:XLFormRowDescriptorTypeText title:@"领用物品"];
//    section.multivaluedAddButton.title = @"新增领用物品";
//    [row.cellConfigAtConfigure setObject:@"请填写领用物品" forKey:@"textField.placeholder"];
//    row.required = YES;
//    section.multivaluedRowTemplate = row;
//
//    section = [XLFormSectionDescriptor formSection];
//    [form addFormSection:section];
    
//     领用原因
    row = [XLFormRowDescriptor formRowDescriptorWithTag:Recipientsreason rowType:XLFormRowDescriptorTypeTextView title:@"领用原因"];
    row.required = YES;
    [section addFormRow:row];

    section = [XLFormSectionDescriptor formSection];
    [form addFormSection:section];
    
    // 按钮
    row = [XLFormRowDescriptor formRowDescriptorWithTag:@"conform" rowType:XLFormRowDescriptorTypeButton];
    row.title = @"提交申请";
    [section addFormRow:row];
    
    self.form = form;
    
}


-(void)didSelectFormRow:(XLFormRowDescriptor *)formRow{
    
//  判断是不是点击了确定按钮
    if(formRow.rowType == XLFormRowDescriptorTypeButton){
        
        [self validateForm];
    }
    
    [super didSelectFormRow:formRow];
    
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
