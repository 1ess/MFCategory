//
//  NSDateFormatter+SharedFormatter.m
//
//  Created by 张冬冬.
//  Copyright © 2018年 张冬冬. All rights reserved.
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
