//
//  UIView+MFSnapshot.m
//  ZHNCosmos
//
//  Created by 张冬冬 on 2018/2/6.
//  Copyright © 2018年 zhn. All rights reserved.
//

#import "UIView+MFSnapshot.h"

@implementation UIView (MFSnapshot)
- (UIImage *)viewSnapshot {
    UIGraphicsBeginImageContextWithOptions(self.bounds.size, NO, [UIScreen mainScreen].scale);
    [self drawViewHierarchyInRect:self.bounds afterScreenUpdates:NO];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}
- (UIImage *)layerSnapshot {
    UIGraphicsBeginImageContextWithOptions(self.bounds.size, NO, [UIScreen mainScreen].scale);
    [self.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}
@end
