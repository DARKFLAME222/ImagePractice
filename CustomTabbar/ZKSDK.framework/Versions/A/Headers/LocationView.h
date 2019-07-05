//
//  LocationView.h
//  ZKSDK
//
//  Created by ari on 2018/5/29.
//  Copyright © 2018年 ZKXT. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>
typedef NS_ENUM(NSUInteger, TrackingSpeed) {
    Tracking_fast = 1,
    Tracking_mid,
    Tracking_slow,
};
@interface LocationView : UIView

//默认10秒
/**
 追踪刷新时间, 默认10秒 最慢30秒
 */
@property (nonatomic) TrackingSpeed trackingTime;

//设备ID
@property (nonatomic) NSNumber *DeviceId;

/**
 调次方法, 开始周期性调用接口
 */
- (void) startTrcaking;

/**
 停用定时器
 */
- (void) releaseTimer;
@end
