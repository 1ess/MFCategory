//
//  UIColor+MFHexColor.h
//  ZHNCosmos
//
//  Created by 张冬冬 on 2018/2/6.
//  Copyright © 2018年 zhn. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (MFHexColor)
+ (UIColor *)colorWithHexString:(NSString *)hexString;
+ (UIColor *)colorWithHexString:(NSString *)hexString alpha:(CGFloat)alpha;
- (NSString *)hexString;
@end
