//
//  LMHttpPost.m
//
//  Created by apple on 14-4-8.
//  Copyright (c) 2014年 thinkrace. All rights reserved.
//

#import "LMHttpPost.h"
#define Current_langue [NSLocale preferredLanguages].firstObject

//static NSString *const APIBaseURLString = @"http://grapi.5gcity.com/OpenAPIV2.asmx/";

//static NSString *const APIBaseURLString = @"http://grapi.5gcity.com/OpenAPIV4.asmx/";

static NSString *const APIBaseURLString = @"http://d2api.zkapi01.com/OpenAPI_D2.asmx/";
//http://dtrackapi.zkapi01.com
static NSString *const APIEnURLString = @"http://dtrackapi.zkapi01.com/OpenAPI_D2.asmx/";

//static NSString *const APIBaseURLString = @"http://120.76.27.205:20088/OpenAPIV4.asmx/";

//static NSString *const APIBaseURLString = @"http://113.98.255.46:8888/OpenAPIV4.asmx/"; //标准版接口

//static NSString *const APIBaseURLString = @"http://124.232.153.196:8044/OpenAPIV4.asmx/"; //肖林接口

@interface LMHttpPost () <NSXMLParserDelegate>

@property (copy, nonatomic) void (^successBlock)(id responseObject);
@property (strong, nonatomic) NSMutableString *responseString;

@end

@implementation LMHttpPost

- (void)getResponseWithName:(NSString *)URLString parameters:(NSDictionary *)parameters success:(void (^)(id responseObject))success failure:(void (^)(NSError *error))failure
{
    self.successBlock = [success copy];
    self.responseString = [[NSMutableString alloc] init];
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    //manager.responseSerializer.acceptableContentTypes
    //AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/rss+xml",@"text/html", @"application/json", @"text/json", @"text/javascript", @"text/plain", nil];
    manager.responseSerializer = [AFXMLParserResponseSerializer serializer];
//    if ([URLString isEqualToString:@"UnboundDevices_V2"]) {
//        manager.requestSerializer = [AFJSONRequestSerializer serializer];//申明请求的数据是json类型
//    }

    NSString *url = [NSString stringWithFormat:@"%@%@", APIBaseURLString, URLString];
    if (![Current_langue hasPrefix:@"ch"]) {
        url = [NSString stringWithFormat:@"%@%@", APIEnURLString, URLString];
    }
    
    [manager POST:url parameters:parameters progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSXMLParser *parser = (NSXMLParser *)responseObject;
        parser.delegate = self;
        [parser parse];
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        failure(error);
    }];
    
    // 监听网络状况
//    AFNetworkReachabilityManager *mgr = [AFNetworkReachabilityManager sharedManager];
//    [mgr setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
//        switch (status) {
//            case AFNetworkReachabilityStatusUnknown:
//                break;
//            case AFNetworkReachabilityStatusNotReachable: {
//                
//                //[SVProgressHUD showInfoWithStatus:@"当前设备无网络"];
//                NSLog(@"当前设备无网络");
//            }
//                break;
//            case AFNetworkReachabilityStatusReachableViaWiFi:
//                //[SVProgressHUD showInfoWithStatus:@"当前Wi-Fi网络"];
//                NSLog(@"当前Wi-Fi网络");
//
//                
//                break;
//            case AFNetworkReachabilityStatusReachableViaWWAN:
//                //[SVProgressHUD showInfoWithStatus:@"当前蜂窝移动网络"];
//                NSLog(@"当前蜂窝移动网络");
//
//                
//                break;
//            default:
//                break;
//        }
//    }];
//    [mgr startMonitoring];
    
    
//    [manager POST:[NSString stringWithFormat:@"%@%@", APIBaseURLString, URLString] parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
//        NSXMLParser *parser = (NSXMLParser *)responseObject;
//        parser.delegate = self;
//        [parser parse];
//    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
//        failure(error);
//    }];
}
-(void)getTTSResponseWithName:(NSString *)URLString parameters:(NSDictionary *)parameters success:(void (^)(id))success failure:(void (^)(NSError *))failure{
    {
        self.successBlock = [success copy];
        self.responseString = [[NSMutableString alloc] init];
        AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
        //manager.responseSerializer.acceptableContentTypes
        //AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
        manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/rss+xml",@"text/html", @"application/json", @"text/json", @"text/javascript", @"text/plain", nil];
        manager.responseSerializer = [AFXMLParserResponseSerializer serializer];
        [manager POST:URLString parameters:parameters progress:^(NSProgress * _Nonnull uploadProgress) {
            
        } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            NSXMLParser *parser = (NSXMLParser *)responseObject;
            parser.delegate = self;
            [parser parse];
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            failure(error);
        }];
        //    [manager POST:[NSString stringWithFormat:@"%@%@", APIBaseURLString, URLString] parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
        //        NSXMLParser *parser = (NSXMLParser *)responseObject;
        //        parser.delegate = self;
        //        [parser parse];
        //    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        //        failure(error);
        //    }];
    }
    
}
#pragma mark - XML

- (void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary *)attributeDict
{
    [_responseString setString:@""];
}

- (void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string
{
    [_responseString appendString:string];
}

- (void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName
{
    NSString *clearString = [[_responseString stringByReplacingOccurrencesOfString:@"\n" withString:@""] stringByReplacingOccurrencesOfString:@"\r" withString:@""];
    NSDictionary *json = [NSJSONSerialization JSONObjectWithData:[clearString dataUsingEncoding:NSUTF8StringEncoding] options:kNilOptions error:nil];

    if (json) {
        _successBlock(json);
    } else {
        _successBlock(clearString);
    }
}

@end
