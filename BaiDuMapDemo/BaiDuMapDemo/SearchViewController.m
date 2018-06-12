//
//  SearchViewController.m
//  BaiDuMapDemo
//
//  Created by apple on 2018/6/12.
//  Copyright © 2018年 tanyun. All rights reserved.
//

#import "SearchViewController.h"

#import <BaiduMapAPI_Search/BMKSearchComponent.h>                       //引入检索功能所有的头文件

@interface SearchViewController () <UITextFieldDelegate, UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITextField *searchTextField;
@property (nonatomic, strong) UITableView *resultTableView;

@end

@implementation SearchViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view addSubview:self.searchTextField];
    [self.view addSubview:self.resultTableView];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.view bringSubviewToFront:self.searchTextField];
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    
    
    
    return YES;
}

#pragma mark - UITableView代理方法
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    return nil;
}

#pragma mark - getter
- (UITextField *)searchTextField {
    if (!_searchTextField) {
        _searchTextField = [[UITextField alloc] initWithFrame:CGRectMake(15, STATUSBAR_HEIGHT + 15, SCREEN_WIDTH - 30, 40)];
        _searchTextField.placeholder = @"搜索";
        _searchTextField.borderStyle = UITextBorderStyleRoundedRect;
        _searchTextField.delegate = self;
    }
    return _searchTextField;
}

- (UITableView *)resultTableView {
    if (!_resultTableView) {
        _resultTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, self.searchTextField.v_bottom + 15, SCREEN_WIDTH, SCREEN_HEIGHT - self.searchTextField.v_bottom - 15) style:(UITableViewStylePlain)];
        _resultTableView.delegate = self;
        _resultTableView.dataSource = self;
    }
    return _resultTableView;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
