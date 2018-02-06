//
//  NSTimer+MFWeakTimer.m
//  软装
//
//  Created by 张冬冬 on 2017/5/17.
//  Copyright © 2017年 张冬冬. All rights reserved.
//

#import "NSTimer+MFWeakTimer.h"

@implementation NSTimer (MFWeakTimer)
+ (NSTimer *)mf_scheduledTimerWithTimeInterval:(NSTimeInterval)interval repeats:(BOOL)repeats block:(void (^)(void))block {
    return [self scheduledTimerWithTimeInterval:interval target:self selector:@selector(timerhandleInvoke:) userInfo:[block copy] repeats:repeats];
}

+ (void)timerhandleInvoke:(NSTimer *)timer {
    void (^block)(void) = timer.userInfo;
    if (block) {
        block();
    }
}
@end
