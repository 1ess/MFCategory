//
//  NSString+File.h
//  微感科技
//
//  Created by 张冬冬 on 2017/1/7.
//  Copyright © 2017年 张冬冬. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (File)
+ (instancetype)uuid;
+ (instancetype)documentPath;
+ (instancetype)homePath;
+ (instancetype)tempPath;
@end
