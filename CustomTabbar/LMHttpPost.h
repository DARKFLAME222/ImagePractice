//
//  LMHttpPost.h
//  智能手环
//
//  Created by apple on 14-4-8.
//  Copyright (c) 2014年 thinkrace. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFNetworking.h"

@interface LMHttpPost : NSObject

- (void)getResponseWithName:(NSString *)URLString
                 parameters:(NSDictionary *)parameters
                    success:(void (^)(id responseObject))success
                    failure:(void (^)(NSError *error))failure;
- (void)getTTSResponseWithName:(NSString *)URLString
                 parameters:(NSDictionary *)parameters
                    success:(void (^)(id responseObject))success
                    failure:(void (^)(NSError *error))failure;
@end
