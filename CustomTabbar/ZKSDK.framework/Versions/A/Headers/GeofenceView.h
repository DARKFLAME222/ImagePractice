//
//  GeofenceView.h
//  ZKSDK
//
//  Created by ari on 2018/6/1.
//  Copyright © 2018年 ZKXT. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GeofenceView : UIView

/**
 围栏数据, 创建围栏则传nil, 编辑围栏则传从接口获取的围栏数据
 */
@property (nonatomic, strong) NSDictionary *geofenceData;

/**
 设备Id, 必传否则无法使用
 */
@property (nonatomic) NSNumber *DeviceId;

/**
 初始化方法, 建立对象后直接addSubView即可

 @param fenceData 围栏数据
 @param Id 设备Id
 @return 返回对象
 */
-(instancetype)initWithData:(NSDictionary *)fenceData DviceId:(NSNumber *)Id;
@end
