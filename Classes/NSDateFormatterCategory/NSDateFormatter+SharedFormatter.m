//
//  NSDateFormatter+SharedFormatter.m
//  微感科技
//
//  Created by 张冬冬 on 2017/6/28.
//  Copyright © 2017年 张冬冬. All rights reserved.
//

#import "NSDateFormatter+SharedFormatter.h"

@implementation NSDateFormatter (SharedFormatter)
+ (instancetype)sharedFormatter {
    static NSDateFormatter *formatter = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        formatter = [[NSDateFormatter alloc] init];
        [formatter setDateFormat:@"yyyyMMddHHmmss"];
    });
    return formatter;
}

+ (instancetype)defaultFormatter {
    static NSDateFormatter *dateFormatter = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        dateFormatter = [[NSDateFormatter alloc] init];
        [dateFormatter setDateFormat:@"yyyy-MM-dd_HH:mm:ss"];
    });
    return dateFormatter;
}
@end
