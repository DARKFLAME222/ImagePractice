//
//  NewTabbar.h
//  CustomTabbar
//
//  Created by ari on 2018/5/24.
//  Copyright © 2018年 ZKXT. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol NewTabbarDelegate <UITabBarDelegate>
@optional

@end
@interface NewTabbar : UITabBar
@property (nonatomic,weak) id<NewTabbarDelegate> delegate;
@end
