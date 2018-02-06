//  Copyright © 2017年 张冬冬. All rights reserved.

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface MFDeviceInfoManager : NSObject
//Screen scale
+ (CGFloat)scale;
//生成GUID
+ (NSString *)GUID;
//磁盘全部空间
+ (CGFloat)diskOfAllSizeGBytes;
//磁盘可用空间
+ (CGFloat)diskOfFreeSizeGBytes;
//获取文件大小
+ (long long)fileSizeAtPath:(NSString *)filePath;
//获取文件夹下所有文件的大小
+ (long long)folderSizeAtPath:(NSString *)folderPath;
//判断手机号码格式是否正确
+ (BOOL)valiMobile:(NSString *)mobile;
//利用正则表达式验证
+ (BOOL)isAvailableEmail:(NSString *)email;
//将十六进制颜色转换为 UIColor 对象
+ (UIColor *)colorWithHexString:(NSString *)color;
//获取设备 IP 地址
+ (NSString *)getIPAddress;
//压缩图片到指定文件大小
+ (NSData *)compressOriginalImage:(UIImage *)image toMaxDataSizeKBytes:(CGFloat)size;
//压缩图片到指定尺寸大小
+ (UIImage *)compressOriginalImage:(UIImage *)image toSize:(CGSize)size;
//截取view中某个区域生成一张图片
+ (UIImage *)shotWithView:(UIView *)view scope:(CGRect)scope;
//截取view生成一张图片
+ (UIImage *)shotWithView:(UIView *)view;
//全屏截图
+ (UIImage *)shotScreen;
//实时模糊
+ (UIVisualEffectView *)effectViewWithFrame:(CGRect)frame;
// CIGaussianBlur ---> 高斯模糊
// CIBoxBlur      ---> 均值模糊(Available in iOS 9.0 and later)
// CIDiscBlur     ---> 环形卷积模糊(Available in iOS 9.0 and later)
// CIMedianFilter ---> 中值模糊, 用于消除图像噪点, 无需设置radius(Available in iOS 9.0 and later)
// CIMotionBlur   ---> 运动模糊, 用于模拟相机移动拍摄时的扫尾效果(Available in iOS 9.0 and later)
+ (UIImage *)blurWithOriginalImage:(UIImage *)image blurName:(NSString *)name radius:(NSInteger)radius;
// 怀旧 --> CIPhotoEffectInstant                         单色 --> CIPhotoEffectMono
// 黑白 --> CIPhotoEffectNoir                            褪色 --> CIPhotoEffectFade
// 色调 --> CIPhotoEffectTonal                           冲印 --> CIPhotoEffectProcess
// 岁月 --> CIPhotoEffectTransfer                        铬黄 --> CIPhotoEffectChrome
// CILinearToSRGBToneCurve, CISRGBToneCurveToLinear, CIGaussianBlur, CIBoxBlur, CIDiscBlur, CISepiaTone, CIDepthOfField
+ (UIImage *)filterWithOriginalImage:(UIImage *)image filterName:(NSString *)name;
@end
