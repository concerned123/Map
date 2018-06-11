//
//  ViewController.m
//  BaiDuMapDemo
//
//  Created by apple on 2018/6/11.
//  Copyright © 2018年 tanyun. All rights reserved.
//

#import "ViewController.h"

#import <BaiduMapAPI_Base/BMKBaseComponent.h>//引入base相关所有的头文件
#import <BaiduMapAPI_Map/BMKMapComponent.h>//引入地图功能所有的头文件
#import <BaiduMapAPI_Location/BMKLocationComponent.h>//引入定位功能所有的头文件

@interface ViewController () <BMKMapViewDelegate, BMKLocationServiceDelegate>

@property (nonatomic, strong) BMKMapView *mapView;                  /**< 基础地图  */
@property (nonatomic, strong) BMKLocationService *locService;       /**< 定位服务  */

@end

@implementation ViewController

#pragma mark - 声明周期
- (void)viewDidLoad {
    [super viewDidLoad];
    
    _mapView = [[BMKMapView alloc] initWithFrame:self.view.bounds];
    self.view = _mapView;
    
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
    [_mapView viewWillAppear];
    _mapView.delegate = self;
}

- (void)viewWillDisappear:(BOOL)animated {
    [_mapView viewWillDisappear];
    _mapView.delegate = nil;
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



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
