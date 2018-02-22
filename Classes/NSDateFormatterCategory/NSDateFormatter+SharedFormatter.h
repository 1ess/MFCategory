//
//  NSDateFormatter+SharedFormatter.h
//
//  Created by 张冬冬.
//  Copyright © 2018年 张冬冬. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDateFormatter (SharedFormatter)
+ (instancetype)sharedFormatter;
+ (instancetype)defaultFormatter;
@end
