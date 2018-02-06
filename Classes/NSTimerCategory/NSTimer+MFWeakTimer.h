//
//  NSTimer+MFWeakTimer.h
//  软装
//
//  Created by 张冬冬 on 2017/5/17.
//  Copyright © 2017年 张冬冬. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSTimer (MFWeakTimer)
+ (NSTimer *)mf_scheduledTimerWithTimeInterval:(NSTimeInterval)interval repeats:(BOOL)repeats block:(void (^)(void))block;
@end
