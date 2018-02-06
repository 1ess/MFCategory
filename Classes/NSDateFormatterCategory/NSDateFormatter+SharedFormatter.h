//
//  NSDateFormatter+SharedFormatter.h
//  微感科技
//
//  Created by 张冬冬 on 2017/6/28.
//  Copyright © 2017年 张冬冬. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDateFormatter (SharedFormatter)
+ (instancetype)sharedFormatter;
+ (instancetype)defaultFormatter;
@end
