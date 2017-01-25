//
//  AppSuperTools.m
//  PropertyApp
//
//  Created by fenglei on 16/9/28.
//  Copyright © 2016年 netall.propertyapp. All rights reserved.
//

#import "AppSuperTools.h"
#import <objc/runtime.h>

@implementation AppSuperTools

+ (CGFloat)getStatusbarHeight
{
    return [UIApplication sharedApplication].statusBarFrame.size.height;
}

+ (CGFloat)getNavigationHeight:(UIViewController*)nav
{
    return nav.navigationController.navigationBar.frame.size.height;
}

+ (CGSize)getWinSize:(CGFloat)barHeight
{
    CGSize winSize = [UIScreen mainScreen].bounds.size;
    return CGSizeMake(winSize.width, winSize.height-barHeight);
}

+ (UITextField*)addTextFieldInView:(UIView*)view spaceFrom:(UIView*)upView space:(float)space placeHolder:(NSString*)holder leftStr:(NSString*)leftStr
{
    return [AppTools addTextFieldInView: view frameTop: CGRectGetMaxY(upView.frame)+space placeHolder: holder leftStr: leftStr];
}


//runtime attribute set and get
+ (void)setAttribute:(NSObject *)obj Key:(NSString*)key Value:(NSObject *)value
{
    objc_setAssociatedObject(obj, [key UTF8String], value, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

+ (id)getAttribute:(NSObject *)obj forKey:(NSString*)key
{
    return objc_getAssociatedObject(obj, [key UTF8String]);
}


+ (UIImage*)imageWithColor:(UIColor*)color
{
    CGRect rect = CGRectMake(0, 0, 1, 1);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, color.CGColor);
    CGContextFillRect(context, rect);
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}


+ (AppDelegate*)getAppDelegate
{
    return (AppDelegate*)[UIApplication sharedApplication].delegate;
}

+ (void)alertNormal:(NSString*)str
{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle: @"提示" message: str delegate: nil cancelButtonTitle: @"好" otherButtonTitles: nil];
    [alert show];
}


+ (BOOL)isIndexOf:(NSString*)src range:(NSString*)str
{
    NSRange range = [src rangeOfString: str];
    if (range.location != NSNotFound) {
        return YES;
    }
    return NO;
}

+ (UIImage*)imageWithImage:(UIImage*)image scaledToSize:(CGSize)newSize
{
    UIGraphicsBeginImageContext(newSize);
    [image drawInRect: CGRectMake(0, 0, newSize.width, newSize.height)];
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return newImage;
}

+ (void)saveUserDefault:(NSObject*)obj forKey:(NSString*)key
{
    NSUserDefaults *ndf = [NSUserDefaults standardUserDefaults];
    [ndf setObject: obj forKey: key];
    [ndf synchronize];
}

+ (NSObject*)loadUserDefault:(NSString*)key
{
    NSUserDefaults *ndf = [NSUserDefaults standardUserDefaults];
    return [ndf objectForKey: key];
}

+ (BOOL)isUserDefaultExist:(NSString*)key
{
    NSUserDefaults *ndf = [NSUserDefaults standardUserDefaults];
    return [ndf objectForKey: key]==nil?NO:YES;
}



@end
