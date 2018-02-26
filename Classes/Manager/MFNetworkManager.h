//
//  MFNetworkManager.h
//
//  Created by 张冬冬.
//  Copyright © 2018年 张冬冬. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AFNetworking/AFNetworking.h>
#define MFNETWROK [MFNetworkManager shareInstance]
typedef void (^MFNetworkSuccessHandle) (id result, NSURLSessionDataTask *task);
typedef void (^MFNetworkFailureHandle) (NSError *error, NSURLSessionDataTask *task);
typedef void (^MFNotReachable) (NSString *string);
typedef void (^MFCanReachable) (NSString *string);

typedef NS_ENUM(NSInteger, MFResponseType) {
    MFResponseTypeJSON,
    MFResponseTypeHTTP
};
@interface MFNetworkManager : NSObject
/**
 处理网络连接的两种情况， 通常用HUD展示给用户（推荐MFHUDManager）
 */
@property (nonatomic, copy) MFNotReachable notReachable;
@property (nonatomic, copy) MFCanReachable canReachable;
/**
 Create manager
 
 @return manager
 */
+ (instancetype)shareInstance;

/**
 Start monitor network
 */
- (void)startMonitorNetworkType;
/**
 Judge is wifi ?
 
 @return isWifi
 */
- (BOOL)isWIFI;

//处理头信息
- (void)addHeaderFieldWithDictionary:(NSDictionary<NSString *, NSString *> *)dictionary;

//request
- (NSURLSessionDataTask *)get:(NSString *)url
                       params:(id)params
                 responseType:(MFResponseType)responseType
                      success:(MFNetworkSuccessHandle)success
                      failure:(MFNetworkFailureHandle)failure;

- (NSURLSessionDataTask *)post:(NSString *)url
                        params:(id)params
                  responseType:(MFResponseType)responseType
                       success:(MFNetworkSuccessHandle)success
                       failure:(MFNetworkFailureHandle)failure;

- (NSURLSessionDataTask *)HEAD:(NSString *)url
                        params:(id)params
                  responseType:(MFResponseType)responseType
                       success:(MFNetworkSuccessHandle)success
                       failure:(MFNetworkFailureHandle)failure;
@end

