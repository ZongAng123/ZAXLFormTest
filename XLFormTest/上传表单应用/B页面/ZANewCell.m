//
//  ZANewCell.m
//  XLFormTest
//
//  Created by 纵昂 on 2020/3/13.
//  Copyright © 2020 https://github.com/ZongAng123. All rights reserved.
//  XLForm简书地址:https://www.jianshu.com/p/c7d2fe799b77
//

#import "ZANewCell.h"

#define KWidth [UIScreen mainScreen].bounds.size.width
#define KRate KWidth/320.0
#define kWS(ws) __weak typeof(&*self) ws=self
#define cellHeight  50

@implementation ZANewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        _titleLab = [[UILabel alloc]init];
        _titleLab.lineBreakMode = NSLineBreakByWordWrapping;
        _titleLab.font = [UIFont systemFontOfSize:13];
        _titleLab.numberOfLines =0;
        _titleLab.text = @"暂无数据";
        
        
        _descriptionLab = [[UILabel alloc]init];
//        _descriptionLab.backgroundColor=[UIColor redColor];
        _descriptionLab.lineBreakMode = NSLineBreakByWordWrapping;
        _descriptionLab.font = [UIFont systemFontOfSize:13];
        _descriptionLab.numberOfLines =0;
        _descriptionLab.text = @"暂无数据";
        
        _timeLab = [[UILabel alloc]init];
        _timeLab.lineBreakMode = NSLineBreakByWordWrapping;
        _timeLab.font = [UIFont systemFontOfSize:13];
        _timeLab.numberOfLines =0;
        _timeLab.text = @"暂无数据";
        
//       出自哪里
        _yuantouLab = [[UILabel alloc]init];
        _yuantouLab.lineBreakMode = NSLineBreakByWordWrapping;
        _yuantouLab.font = [UIFont systemFontOfSize:13];
        _yuantouLab.numberOfLines =0;
        _yuantouLab.text = @"暂无数据";
        
        _headImageView = [[UIImageView alloc]init];
        
        
        
        [self.contentView addSubview:_titleLab];
        [self.contentView addSubview:_timeLab];
        [self.contentView addSubview:_headImageView];
        [self.contentView addSubview:_yuantouLab];
        [self.contentView addSubview:_descriptionLab];
        
        [_titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.contentView.mas_left).offset(98);
            make.top.mas_equalTo(self.contentView.mas_top).offset(0);
            make.width.mas_equalTo(280);
            make.height.mas_equalTo(48);
        }];
        
        [_descriptionLab mas_makeConstraints:^(MASConstraintMaker *make) {
                   make.left.mas_equalTo(self.contentView.mas_left).offset(98);
                   make.top.mas_equalTo(self.contentView.mas_top).offset(36);
                   make.width.mas_equalTo(280);
                   make.height.mas_equalTo(80);
               }];
        
        [_timeLab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.contentView.mas_left).offset(98);
            make.top.mas_equalTo(self.contentView.mas_top).offset(115);
            make.height.mas_equalTo(25);
        }];
     
        [_headImageView mas_makeConstraints:^(MASConstraintMaker *make) {
               make.left.mas_equalTo(self.contentView.mas_left).offset(5);
               make.top.mas_equalTo(self.contentView.mas_top).offset(5);
               make.height.mas_equalTo(90);
               make.width.mas_equalTo(90);
           }];
          [_yuantouLab mas_makeConstraints:^(MASConstraintMaker *make) {
              make.left.mas_equalTo(self.contentView.mas_left).offset(258);
              make.top.mas_equalTo(self.contentView.mas_top).offset(115);
              make.height.mas_equalTo(25);
          }];
        
        
        self.selectBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, ScreenSizeWidth, cellHeight)];
        self.selectBtn.imageEdgeInsets = UIEdgeInsetsMake(15, ScreenSizeWidth-35, 15, 15);//设置边距
        [self.selectBtn addTarget:self action:@selector(selectPressed:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:self.selectBtn];
    }
    return self;
}

-(void)setModel:(NewModel *)model{
    _model = model;
//    图片
//    NSURL * url =[NSURL URLWithString:model.imgsrc];
//    //1. 基本语句, 异步加载及缓存图片一步到位
//    [_headImageView sd_setImageWithURL: url placeholderImage: [UIImage imageNamed:@"001.jpg"]];
//    [_headImageView sd_setImageWithURL:url];
    
    _titleLab.text = model.ltitle; //新闻标题
    _descriptionLab.text = model.digest; //正文
    _timeLab.text = model.lmodify;
    _yuantouLab.text = model.source;
}

- (void)selectPressed:(UIButton *)sender{
    self.isSelect = !self.isSelect;
    if (self.qhxSelectBlock) {
        self.qhxSelectBlock(self.isSelect,sender.tag);
    }
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
