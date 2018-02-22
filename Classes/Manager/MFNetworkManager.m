//
//  MFNetworkManager.m
//
//  Created by 张冬冬.
//  Copyright © 2018年 张冬冬. All rights reserved.
//

#import "MFNetworkManager.h"
#import <RealReachability.h>
#import <MFHUDManager.h>
@interface MFNetworkManager()
@property (nonatomic,strong) AFHTTPSessionManager *sessionManager;
@property (nonatomic,strong) AFJSONResponseSerializer *jsonResponseSerializer;
@property (nonatomic,strong) AFHTTPResponseSerializer *httpResponseSerializer;
@end

@implementation MFNetworkManager

+ (instancetype)shareInstance {
    static MFNetworkManager *manager;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [[MFNetworkManager alloc]init];
        manager.sessionManager = [AFHTTPSessionManager manager];
    });
    return manager;
}

- (NSURLSessionDataTask *)get:(NSString *)url
                       params:(id)params
                 responseType:(MFResponseType)responseType
                      success:(MFNetworkSuccessHandle)success
                      failure:(MFNetworkFailureHandle)failure {
    [self p_configResponseForType:responseType];
    return [self.sessionManager GET:url parameters:params progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable    responseObject) {
        if (success) {
            success(responseObject,task);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (failure) {
            failure(error,task);
        }
    }];
}

- (NSURLSessionDataTask *)post:(NSString *)url
                        params:(id)params
                  responseType:(MFResponseType)responseType
                       success:(MFNetworkSuccessHandle)success
                       failure:(MFNetworkFailureHandle)failure {
    [self p_configResponseForType:responseType];
    return [self.sessionManager POST:url parameters:params progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if (success) {
            success(responseObject,task);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (failure) {
            failure(error,task);
        }
    }];
}

- (NSURLSessionDataTask *)HEAD:(NSString *)url
                        params:(id)params
                  responseType:(MFResponseType)responseType
                       success:(MFNetworkSuccessHandle)success
                       failure:(MFNetworkFailureHandle)failure {
    [self p_configResponseForType:responseType];
    return [self.sessionManager HEAD:url parameters:params success:^(NSURLSessionDataTask * _Nonnull task) {
        if (success) {
            success(nil,task);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (failure) {
            failure(error,task);
        }
    }];
}
- (void)p_configResponseForType:(MFResponseType)type {
    switch (type) {
        case MFResponseTypeJSON:
            self.sessionManager.responseSerializer = self.jsonResponseSerializer;
            break;
        case MFResponseTypeHTTP:
            self.sessionManager.responseSerializer = self.httpResponseSerializer;
            break;
    }
}

#pragma mark - getters
- (AFJSONResponseSerializer *)jsonResponseSerializer {
    if (_jsonResponseSerializer == nil) {
        _jsonResponseSerializer = [AFJSONResponseSerializer serializer];
    }
    return _jsonResponseSerializer;
}

- (AFHTTPResponseSerializer *)httpResponseSerializer {
    if (_httpResponseSerializer == nil) {
        _httpResponseSerializer = [AFHTTPResponseSerializer serializer];
    }
    return _httpResponseSerializer;
}


#pragma mark - network state
- (void)startMonitorNetworkType {
    [GLobalRealReachability startNotifier];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(reachabilityChanged:) name:kRealReachabilityChangedNotification object:nil];
}

- (void)reachabilityChanged:(NSNotification *)notification {
    RealReachability *reachability = (RealReachability *)notification.object;
    ReachabilityStatus status = [reachability currentReachabilityStatus];
    NSString *state;
    BOOL isReachable = YES;
    BOOL isNeeNotice = YES;
    switch (status) {
        case RealStatusNotReachable:
        {
            state = @"网络已断开";
            isReachable = NO;
        }
            break;
        case RealStatusViaWiFi:
        {
            state = @"已切换到 WIFI";
        }
            break;
        case RealStatusViaWWAN:
        {
            WWANAccessType accessType = [GLobalRealReachability currentWWANtype];
            if (accessType == WWANType2G)
            {
                state = @"已切换到 2G";
            }
            else if (accessType == WWANType3G)
            {
                state = @"已切换到 3G";
            }
            else if (accessType == WWANType4G)
            {
                state = @"已切换到 4G";
            }
        }
            break;
        default:
        {
            isNeeNotice = NO;
        }
            break;
    }
    
    if (isNeeNotice) {
        if (isReachable) {
            [MFHUDManager showWarning:state];
        }else {
            [MFHUDManager showError:state];
        }
    }
}

- (BOOL)isWIFI {
    if ([GLobalRealReachability currentReachabilityStatus] == RealStatusViaWiFi) {
        return YES;
    }else {
        return NO;
    }
}
@end
