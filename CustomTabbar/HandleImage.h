//
//  HandleImage.h
//  CustomTabbar
//
//  Created by ari on 2018/7/3.
//  Copyright © 2018年 ZKXT. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HandleImage : UIView
+ (void)pq_cutScreenWithView:(nullable UIView *)view successBlock:(nullable void(^)(UIImage * _Nullable image,NSData * _Nullable imagedata))block;
@end
