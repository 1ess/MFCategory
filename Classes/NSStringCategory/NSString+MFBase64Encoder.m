//
//  NSString+MFBase64Encoder.m
//  ZHNCosmos
//
//  Created by 张冬冬 on 2018/2/6.
//  Copyright © 2018年 zhn. All rights reserved.
//

#import "NSString+MFBase64Encoder.h"

@implementation NSString (MFBase64Encoder)
- (NSString *)base64Encoded {
    NSData *data = [self dataUsingEncoding:NSUTF8StringEncoding];
    return [data base64EncodedStringWithOptions:0];
}
@end
