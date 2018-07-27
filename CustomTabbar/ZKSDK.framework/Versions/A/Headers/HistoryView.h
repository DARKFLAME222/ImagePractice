//
//  HistoryView.h
//  ZKSDK
//
//  Created by ari on 2018/5/30.
//  Copyright © 2018年 ZKXT. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>
@interface HistoryView : UIView

/**
 设备Id, 必填
 */
@property (nonatomic) NSNumber *DeviceId;

/**
 初始化方法

 @param deviceId 设备ID
 @return 返回对象
 */
-(instancetype)initWithDeviceId:(NSNumber *)deviceId;

@end
