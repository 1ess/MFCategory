//
//  NSString+File.m
//  微感科技
//
//  Created by 张冬冬 on 2017/1/7.
//  Copyright © 2017年 张冬冬. All rights reserved.
//

#import "NSString+File.h"

@implementation NSString (File)
+ (instancetype)uuid {
    CFUUIDRef uuid = CFUUIDCreate(kCFAllocatorDefault);
    CFStringRef strUuid = CFUUIDCreateString(kCFAllocatorDefault,uuid);
    NSString * str = [NSString stringWithString:(__bridge NSString *)strUuid];
    CFRelease(strUuid);
    CFRelease(uuid);
    return  str;
}

+ (instancetype)documentPath {
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    return documentsDirectory;
}

+ (instancetype)homePath {
    return NSHomeDirectory();
}

+ (instancetype)tempPath {
    return NSTemporaryDirectory();
}
@end
