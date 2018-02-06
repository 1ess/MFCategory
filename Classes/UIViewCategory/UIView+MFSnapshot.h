//
//  UIView+MFSnapshot.h
//  ZHNCosmos
//
//  Created by 张冬冬 on 2018/2/6.
//  Copyright © 2018年 zhn. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (MFSnapshot)
- (UIImage *)viewSnapshot;
- (UIImage *)layerSnapshot;
@end
