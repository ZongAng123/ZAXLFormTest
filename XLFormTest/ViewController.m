//
//  ViewController.m
//  XLFormTest
//
//  Created by 纵昂 on 2020/3/13.
//  Copyright © 2020 https://github.com/ZongAng123. All rights reserved.
//  XLForm简书地址:https://www.jianshu.com/p/c7d2fe799b77
//


#import "ViewController.h"

#import "ZAGoodsViewController.h"
#import "ZARecipientsController.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic , strong) UITableView *tableView;
@property (nonatomic,strong) UILabel * goodspurchase;//Goods purchase
@property (nonatomic,strong) UILabel * recipients; //recipients

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
     self.navigationItem.title = @"XLForm使用";
//   的添加背景颜色
    if (@available(iOS 13.0, *)) {
        self.view.backgroundColor = [UIColor systemGroupedBackgroundColor];
    } else {
        // Fallback on earlier versions
    }
    
    
//    初始化
        _tableView = [[UITableView alloc]initWithFrame:self.view.frame style:UITableViewStyleGrouped];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        [self.view addSubview:_tableView];
    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 2;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSString *identifier = [NSString stringWithFormat:@"%ld%ldcell", indexPath.section, indexPath.row];
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:identifier];
    }
    if (indexPath.section == 0 && indexPath.row == 0) {
        UIImageView * imagone = [[UIImageView alloc]initWithFrame:CGRectMake(10, 10, 30, 30)];
        imagone.image=[UIImage imageNamed:@"wupinshengou"];
        [cell.contentView addSubview:imagone];
        
        _goodspurchase = [[UILabel alloc]initWithFrame:CGRectMake(55, 0, 200, 50)];
        _goodspurchase.text = @"XLForm表单";
        _goodspurchase.font = [UIFont systemFontOfSize:18];
        [cell.contentView addSubview:_goodspurchase];
        
    }else if (indexPath.section == 0 && indexPath.row == 1){
        UIImageView * imagtwo = [[UIImageView alloc]initWithFrame:CGRectMake(10, 10, 30, 30)];
        imagtwo.image=[UIImage imageNamed:@"wupinshenlin"];
        [cell.contentView addSubview:imagtwo];

        _recipients = [[UILabel alloc]initWithFrame:CGRectMake(55, 0, 200, 50)];
        _recipients.text = @"XLForm表单传值";
        _recipients.font = [UIFont systemFontOfSize:18];
        [cell.contentView addSubview:_recipients];
    }
    
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    if (indexPath.section ==0 && indexPath.row == 0) { //

        ZAGoodsViewController *listVC = [[ZAGoodsViewController alloc]init];
        [self.navigationController pushViewController:listVC animated:YES];
    }else if (indexPath.section ==0 && indexPath.row == 1){ //
        ZARecipientsController *listOneVC = [[ZARecipientsController alloc]init];
        [self.navigationController pushViewController:listOneVC animated:YES];
    }
}


@end
