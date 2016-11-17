//
//  ViewController.m
//  悬浮的cell
//
//  Created by 小果 on 16/1/21.
//  Copyright © 2016年 小果. All rights reserved.
//

#import "ViewController.h"
#import "XGTableViewCell.h"


#define ScreenW [UIScreen mainScreen].bounds.size.width
#define ScreenH [UIScreen mainScreen].bounds.size.height

@interface ViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (nonatomic,strong)UITableView *tableView;
@property (nonatomic,assign)CGFloat height;
@property (nonatomic, strong) NSArray *imageArr;
@end

@implementation ViewController

-(NSArray *)imageArr{
    if (nil == _imageArr){
        
        NSString *path = [[NSBundle mainBundle] pathForResource:@"image.plist" ofType:nil];
        _imageArr = [NSArray arrayWithContentsOfFile:path];
        
    }
    return _imageArr;
}
- (void)viewDidLoad {
    [super viewDidLoad];
   
    [self createTableView];
//    NSString  *str  = [NSString stringWithFormat:aa];
}

-(void)createTableView{
   
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 20, ScreenW, ScreenH - 20)];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    // tableview的分割线的样式
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:self.tableView];
    
}

#pragma mark - tableView的数据源方法
#pragma mark - 共有多少组
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
#pragma mark - 每一组有多少行
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 10;
}
#pragma mark - 设置cell的内容
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *ID = @"cell";
    XGTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (nil == cell){
        cell = [[XGTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    
    cell.imageview.image = [UIImage imageNamed:self.imageArr[indexPath.row][@"icon"]];
    return cell;
}
#pragma mark - 每一行的高度
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return [XGTableViewCell getHeight]+50 ;
}
@end
