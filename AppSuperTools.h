//
//  AppSuperTools.h
//  PropertyApp
//
//  Created by fenglei on 16/9/28.
//  Copyright © 2016年 netall.propertyapp. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AppSuperTools : NSObject

/** 获取导航栏高度 */
+ (CGFloat)getNavigationHeight:(UIViewController*)nav;

//获取状态栏高度
+ (CGFloat)getStatusbarHeight;

//获取主窗体尺寸，去掉导航栏
+ (CGSize)getWinSize:(CGFloat)barHeight;

//为对象增加属性用来传值
+ (void)setAttribute:(NSObject *)obj Key:(NSString*)key Value:(NSObject *)value;
+ (id)getAttribute:(NSObject *)obj forKey:(NSString*)key;

//单色图片 用于按钮或图片的修饰
+ (UIImage*)imageWithColor:(UIColor*)color;

//获取appdelegate实例
+ (id)getAppDelegate;

//普通的弹出提示
+ (void)alertNormal:(NSString*)str;

//indexof方法
+ (BOOL)isIndexOf:(NSString*)src range:(NSString*)str;

/** 修改图片尺寸  */
+ (UIImage*)imageWithImage:(UIImage*)image scaledToSize:(CGSize)newSize;

/** 存储全局变量 */
+ (void)saveUserDefault:(NSObject*)obj forKey:(NSString*)key;
/** 获取全局变量 */
+ (NSObject*)loadUserDefault:(NSString*)key;
/** 判断变量是否存在 */
+ (BOOL)isUserDefaultExist:(NSString*)key;

@end
