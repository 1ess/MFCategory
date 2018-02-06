//
//  MFManager.h
//  微感科技
//
//  Created by 张冬冬 on 2017/6/28.
//  Copyright © 2017年 张冬冬. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface MFManager : NSObject
+ (NSArray *)distinctUnionOfArray:(NSArray *)originArray;
+ (UIImage *)getImageFromCurrentView:(UIView *)view;
+ (UIImage *)getVideoImageByURL:(NSURL *)url;
+ (NSInteger)getVideoTimeByURL:(NSURL *)url;
+ (void)animatedSetKeyWindow:(UIViewController *)controller;
@end
