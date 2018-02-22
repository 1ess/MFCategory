//
//  MFManager.h
//
//  Created by 张冬冬.
//  Copyright © 2018年 张冬冬. All rights reserved.
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
