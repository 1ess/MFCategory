//
//  MFCookiesManager.h
//  软装
//
//  Created by 张冬冬 on 2018/1/22.
//  Copyright © 2018年 张冬冬. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MFCookiesManager : NSObject
+ (void)saveCookies;
+ (void)loadCookiesWithName:(NSString *)cookiesName;
@end
