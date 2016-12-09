//
//  RRCenterViewController.m
//  RRSlideController
//
//  Created by ZeroJ on 16/9/13.
//  Copyright © 2016年 ZeroJ. All rights reserved.
//

#import "RRCenterViewController.h"
#import "RRDrawerController.h"
@interface RRCenterViewController ()<UITableViewDelegate,UITableViewDataSource>

@end

@implementation RRCenterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"%@ ---- didLoad",self);

    self.title = @"center";
    self.view.backgroundColor = [UIColor whiteColor];
    UIButton *leftbtn = [[UIButton alloc] initWithFrame:CGRectMake(200, 100, 44, 44)];
    [leftbtn setTitle:@"左边" forState:UIControlStateNormal];
    [leftbtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [leftbtn addTarget:self action:@selector(leftOnClick) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:leftbtn];
    
    UIButton *rightbtn = [[UIButton alloc] initWithFrame:CGRectMake(200, 100, 44, 44)];
    [rightbtn setTitle:@"右边" forState:UIControlStateNormal];
    [rightbtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [rightbtn addTarget:self action:@selector(rightOnClick) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:rightbtn];
//    [self exchangeCenterControllerViewMethod];

    UITableView *tableview = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    [self.view addSubview:tableview];
    tableview.delegate = self;
    tableview.dataSource = self;
    [tableview registerClass:[UITableViewCell class] forCellReuseIdentifier:@"kk"];
}

- (void)leftOnClick {
    [self.RR_drawerController slidingLeftDrawer];
}

- (void)rightOnClick {
//    [self.RR_slideController slidingRightDrawer];
    UIViewController *test = [UIViewController new];
    test.view.backgroundColor = [UIColor greenColor];
//    [self presentViewController:test animated:YES completion:nil];
    [self showViewController:test sender:nil];
}


- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    NSLog(@"%@ ---- willAppear",self);
//    [self.RR_slideController activeGestureOfCenterContentView];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    NSLog(@"%@ ---- didAppear",self);
    
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    NSLog(@"%@ ---- willDisappear",self);
//    [self.RR_slideController disableGestureOfCenterContentView];
    
}

- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
    NSLog(@"%@ ---- didDisappear",self);
    
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 20;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"kk"];
    cell.textLabel.text = [NSString stringWithFormat:@"---%zd",indexPath.row];
    return cell;
}
@end
