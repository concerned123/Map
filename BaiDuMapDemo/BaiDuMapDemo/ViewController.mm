//
//  ViewController.m
//  BaiDuMapDemo
//
//  Created by apple on 2018/6/11.
//  Copyright © 2018年 tanyun. All rights reserved.
//

#import "ViewController.h"

#import <BaiduMapAPI_Base/BMKBaseComponent.h>                           //引入base相关所有的头文件
#import <BaiduMapAPI_Map/BMKMapComponent.h>                             //引入地图功能所有的头文件
#import <BaiduMapAPI_Location/BMKLocationComponent.h>                   //引入定位功能所有的头文件
#import <BaiduMapAPI_Search/BMKSearchComponent.h>                       //引入检索功能所有的头文件

#import "NSArray+Log.h"

#import "SearchViewController.h"

@interface ViewController () <BMKMapViewDelegate, BMKLocationServiceDelegate, BMKSuggestionSearchDelegate, BMKGeoCodeSearchDelegate>

@property (nonatomic, strong) BMKMapView *mapView;                  /**< 基础地图  */
@property (nonatomic, strong) UIButton *searchButton;               /**< 搜索按钮  */


@property (nonatomic, strong) BMKLocationService *locService;       /**< 定位服务  */
@property (nonatomic, strong) BMKSuggestionSearch *suggestionSearcher;        /**< 地点输入提示搜索服务  */

@end

@implementation ViewController

#pragma mark - 声明周期
- (void)viewDidLoad {
    [super viewDidLoad];
    
    _mapView = [[BMKMapView alloc] initWithFrame:self.view.bounds];
    self.view = _mapView;
    
    [self.view addSubview:self.searchButton];
    
    //定位
    _mapView.showsUserLocation = YES;//显示定位图层
    _mapView.userTrackingMode = BMKUserTrackingModeFollow;//定位跟随模式
    _mapView.zoomLevel = 17;//地图比例尺级别 4-21 越大地图显示范围越小
    
    //初始化BMKLocationService
    _locService = [[BMKLocationService alloc] init];
    _locService.delegate = self;
    //启动LocationService
    [_locService startUserLocationService];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [_mapView viewWillAppear];
    _mapView.delegate = self;
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    [_mapView viewWillDisappear];
    _mapView.delegate = nil;
    _suggestionSearcher.delegate = nil;
}

#pragma mark - 定位
//实现相关delegate 处理位置信息更新
//处理方向变更信息
- (void)didUpdateUserHeading:(BMKUserLocation *)userLocation {
    [self.mapView updateLocationData:userLocation];
}

//处理位置坐标更新
- (void)didUpdateBMKUserLocation:(BMKUserLocation *)userLocation {
    [self.mapView updateLocationData:userLocation];
}

#pragma mark - 搜索
- (void)searchButtonAction:(UIButton *)sender {
    
    SearchViewController *searchVC = [[SearchViewController alloc] init];
    [self.navigationController pushViewController:searchVC animated:YES];
    
    /*
    _suggestionSearcher = [[BMKSuggestionSearch alloc] init];
    _suggestionSearcher.delegate = self;
    
    BMKSuggestionSearchOption* option = [[BMKSuggestionSearchOption alloc] init];
    option.cityname = @"深圳市";
    option.keyword  = @"梅沙";
    
    BOOL flag = [self.suggestionSearcher suggestionSearch:option];
    if (flag) {
        NSLog(@"Sug检索发送成功");
    } else {
        NSLog(@"Sug检索发送失败");
    }
     */
}

//Map搜索回调
//返回地址信息搜索结果
- (void)onGetSuggestionResult:(BMKSuggestionSearch *)searcher result:(BMKSuggestionResult *)result errorCode:(BMKSearchErrorCode)error {
    if (error == BMK_SEARCH_NO_ERROR) {
        //在此处理正常结果
        NSLog(@"addressList = %@", result.addressList);
        //具体地址
        NSLog(@"keyList = %@", [result.keyList descriptionWithLocale:nil]);
        //深圳市
        NSLog(@"cityList = %@", [result.cityList descriptionWithLocale:nil]);
        //盐田区
        NSLog(@"districtList = %@", [result.districtList descriptionWithLocale:nil]);
        NSLog(@"tagList = %@", [result.tagList descriptionWithLocale:nil]);
        
    } else {
        NSLog(@"抱歉，未找到结果");
    }
}


#pragma mark - getter
- (UIButton *)searchButton {
    if (!_searchButton) {
        _searchButton = [[UIButton alloc] initWithFrame:CGRectMake(15, STATUSBAR_HEIGHT + 15, SCREEN_WIDTH - 30, 50)];
        [_searchButton setTitle:@"搜索" forState:(UIControlStateNormal)];
        [_searchButton setTitleColor:[UIColor blackColor] forState:(UIControlStateNormal)];
        _searchButton.backgroundColor = [UIColor whiteColor];
        [_searchButton addTarget:self action:@selector(searchButtonAction:) forControlEvents:(UIControlEventTouchUpInside)];
    }
    return _searchButton;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
