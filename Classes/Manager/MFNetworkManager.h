//
//  MFNetworkManager.h
//  软装
//
//  Created by 张冬冬 on 2018/2/22.
//  Copyright © 2018年 张冬冬. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AFNetworking.h>
#define MFNETWROK [MFNetworkManager shareInstance]
typedef void (^MFNetworkSuccessHandle) (id result, NSURLSessionDataTask *task);
typedef void (^MFNetworkFailureHandle) (NSError *error, NSURLSessionDataTask *task);

typedef NS_ENUM(NSInteger, MFResponseType) {
    MFResponseTypeJSON,
    MFResponseTypeHTTP
};
@interface MFNetworkManager : NSObject
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
