//
//  MFManager.m
//  微感科技
//
//  Created by 张冬冬 on 2017/6/28.
//  Copyright © 2017年 张冬冬. All rights reserved.
//

#import "MFManager.h"
#import <AVFoundation/AVFoundation.h>
@implementation MFManager

+ (void)animatedSetKeyWindow:(UIViewController *)controller {
    [UIView transitionWithView:[UIApplication sharedApplication].keyWindow duration:0.3f options:UIViewAnimationOptionTransitionCrossDissolve animations:^{
        BOOL oldState = [UIView areAnimationsEnabled];
        [UIView setAnimationsEnabled:NO];
        [UIApplication sharedApplication].keyWindow.rootViewController = controller;
        [UIView setAnimationsEnabled:oldState];
    } completion:nil];
}

+ (NSArray *)distinctUnionOfArray:(NSArray *)originArray {
    return [originArray valueForKeyPath:@"@distinctUnionOfObjects.self"];
}

+ (UIImage *)getImageFromCurrentView:(UIView *)view {
    UIGraphicsBeginImageContextWithOptions(view.bounds.size, YES, 0.0);
    [view.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

+ (UIImage *)getVideoImageByURL:(NSURL *)url {
    AVURLAsset *asset = [[AVURLAsset alloc] initWithURL:url options:nil];
    AVAssetImageGenerator *gen = [[AVAssetImageGenerator alloc] initWithAsset:asset];
    gen.appliesPreferredTrackTransform = YES;
    CMTime time = CMTimeMake(0, 10);
    NSError *error = nil;
    CMTime actualTime;
    CGImageRef image = [gen copyCGImageAtTime:time actualTime:&actualTime error:&error];
    UIImage *thumb = [[UIImage alloc] initWithCGImage:image];
    CGImageRelease(image);
    return thumb;
}

+ (NSInteger)getVideoTimeByURL:(NSURL *)url {
    AVURLAsset *asset = [AVURLAsset assetWithURL:url];
    CMTime time = [asset duration];
    NSInteger seconds = ceil(time.value/time.timescale);
    return seconds;
}

@end
