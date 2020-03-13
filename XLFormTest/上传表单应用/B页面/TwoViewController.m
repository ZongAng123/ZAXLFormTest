//
//  TwoViewController.m
//  XLFormTest
//
//  Created by 纵昂 on 2020/3/13.
//  Copyright © 2020 https://github.com/ZongAng123. All rights reserved.
//  XLForm简书地址:https://www.jianshu.com/p/c7d2fe799b77
//

#import "TwoViewController.h"
#import "XInWenApi.h"
#import "ZANewCell.h"
#import "NewModel.h"

#define defaultTag 1990

@interface TwoViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong) UITableView *tableView;
@property (nonatomic,strong) NSMutableArray *dataArray;
@property (nonatomic,assign) NSInteger page;
@property (nonatomic,strong) NewModel * model;

@property (nonatomic, assign) NSInteger btnTag;//默认选中的Tag

@end

@implementation TwoViewController
//必须写，不然跳不进来，会崩溃
@synthesize rowDescriptor = _rowDescriptor;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
     self.navigationItem.title = @"新闻";
     self.view.backgroundColor = [UIColor groupTableViewBackgroundColor];
     self.page = 1;
          
     [self.view addSubview:self.tableView];
     [self.tableView.mj_header beginRefreshing];
    
     self.btnTag = defaultTag+1; //self.btnTag = defaultTag+1  表示默认选择第二个，依次类推
       
     [self requestData];
     _dataArray=[NSMutableArray new];
}

- (void)requestData{
    XInWenApi *api = [[XInWenApi alloc] init];
    [api startWithCompletionBlockWithSuccess:^(YTKBaseRequest *request) {
        [self.tableView.mj_header endRefreshing];
        NSLog(@"responseString,%@",request.responseString);
        NSLog(@"success,%@",request);

//      json转模型
        NSData *jsonData = [request.responseString dataUsingEncoding:NSUTF8StringEncoding];
        NSError *err;
        NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:jsonData
                                                            options:NSJSONReadingMutableContainers
                                                              error:&err];
//        NSMutableArray *modelArray = dic[@"data"];
        NSLog(@"新闻数据%@",dic);
        __weak typeof (self)weakSelf = self;
//        NSArray * array = dic[@"result"][@"data"];
        NSArray * array = dic[@"list"];
           for (NSDictionary * dict in array) {
               
               if ([dict[@"city"] integerValue] == 0) {
                   if (_page == 1) {
                       [weakSelf.dataArray removeAllObjects];
                       for (NSString * ss in array) {
                           NewModel * model = [NewModel yy_modelWithJSON:ss];
                           [self.dataArray addObject:model];
                       }
                       [self.tableView reloadData];
                   }else{
                       for (NSString * ss in array) {
                           NewModel * model = [NewModel yy_modelWithJSON:ss];
                           [self.dataArray addObject:model];
                       }
                       [self.tableView reloadData];
                   }
                   if (array.count < 20 ) {
                       [weakSelf.tableView.mj_footer endRefreshingWithNoMoreData];
                   }
//                   [self.dataArray removeAllObjects];
//                       HomeModel * model = [HomeModel yy_modelWithJSON:dict];
//                        NSLog(@"223%@",model.title);
//                   [self.dataArray addObject:model];
                  
               }else if ([dic[@"code"] integerValue] == 1001){
                   [SVProgressHUD showErrorWithStatus:@"token失效，请重新登录"];
//                   这一步就是写登录跳转方法
               }else{
                    [SVProgressHUD showErrorWithStatus:dic[@"message"]];
               }
//               [self.tableView reloadData];
            
        }
    
    } failure:^(YTKBaseRequest *request) {
        // you can use self here, retain cycle won't happen
        NSLog(@"failed,%@",request);
    }];
}

- (UITableView *)tableView {
    if (!_tableView) {
        _tableView  = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.separatorStyle = 5;
        [_tableView registerClass:[ZANewCell class] forCellReuseIdentifier:@"ZANewCell"];
       
        __weak typeof (self)weakSelf = self;
        
      self.tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
          self->_page = 1;
          [weakSelf requestData];
      }];
      self.tableView.mj_footer = [MJRefreshBackNormalFooter footerWithRefreshingBlock:^{
          self->_page++;
          [weakSelf requestData];
      }];
    
        
    }
    return _tableView;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _dataArray.count;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
  
    return 137;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NewModel * model = _dataArray[indexPath.row];
    NSString *identifier = [NSString stringWithFormat:@"%ld%ldcell", indexPath.section, indexPath.row];
    ZANewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    if (!cell) {
        cell = [[ZANewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:identifier];
    }
    [cell setModel:model];
    
    cell.selectBtn.tag = defaultTag+indexPath.row;
    if (cell.selectBtn.tag == self.btnTag) {
        cell.isSelect = YES;
        [cell.selectBtn setImage:[UIImage imageNamed:@"work_inform_checked"] forState:UIControlStateNormal];
        
//      上一页面传值
        self.rowDescriptor.value = cell.titleLab.text;
        
        [[NSUserDefaults standardUserDefaults]setObject:cell.titleLab.text forKey:@"RANGE"];
        [[NSNotificationCenter defaultCenter]postNotificationName:@"range_people" object:nil];
        
    }else{
        cell.isSelect = NO;
        [cell.selectBtn setImage:[UIImage imageNamed:@"work_inform_unchecked"] forState:UIControlStateNormal];
    }
    __weak ZANewCell * weakCell = cell;
    [cell setQhxSelectBlock:^(BOOL choice, NSInteger btntag) {
        if (choice) {
            [weakCell.selectBtn setImage:[UIImage imageNamed:@"work_inform_checked"] forState:UIControlStateNormal];
            self.btnTag = btntag;
            NSLog(@"%ld",(long)btntag);
            
            [_tableView reloadData];
        }else{
            [weakCell.selectBtn setImage:[UIImage imageNamed:@"work_inform_checked"] forState:UIControlStateNormal];
            self.btnTag = btntag;
            
            [_tableView reloadData];
            NSLog(@"%ld",(long)btntag);
        }
    }];
    cell = cell;
    [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
//    新闻页面url连接跳转
//     HomeModel *model = _dataArray[indexPath.row];
//    [self pushToWebViewControllerWithNewsUrl:model.url];
//    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}
//- (void)pushToWebViewControllerWithNewsUrl:(NSString *)newsUrl {
////    隐藏Bar
//    self.hidesBottomBarWhenPushed = YES;
//    WebViewController *webController = [[WebViewController alloc]init];
//    webController.urlstring = newsUrl;
//    [self.navigationController pushViewController:webController animated:YES];
////    返回回来显示Bar
//    self.hidesBottomBarWhenPushed=NO;
//
//}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
