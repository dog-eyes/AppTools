//
//  AppTools.h
//  NetallStoreManagerApp
//
//  Created by fenglei on 16/5/25.
//  Copyright © 2016年 netall. All rights reserved.
//

@interface AppTools : NSObject


//获取导航栏高度
+ (CGFloat)getNavigationHeight:(UIViewController*)nav;

//获取状态栏高度
+ (CGFloat)getStatusbarHeight;

//获取主窗体尺寸，去掉导航栏
+ (CGSize)getWinSize:(CGFloat)barHeight;

//添加文本框
+ (UITextField*)addTextFieldInView:(UIView*)view spaceFrom:(UIView*)upView space:(float)space placeHolder:(NSString*)holder leftStr:(NSString*)leftStr;
+ (UITextField*)addTextFieldInView:(UIView*)view frameTop:(float)top placeHolder:(NSString*)holder leftStr:(NSString*)leftStr;

//添加文本标签
+ (UILabel*)addLabelInView:(UIView*)view spaceFrom:(UIView*)upView space:(float)space left:(float)left text:(NSString*)textStr;
+ (UILabel*)addLabelInView:(UIView*)view frameTop:(float)top left:(float)left text:(NSString*)textStr;

//添加标准提交按钮
+ (UIButton*)addEnterButton:(UIView*)view top:(float)top labelText:(NSString*)str;

//为组件增加覆盖层并指定响应方法
+ (void)coverdMe:(UIView*)coveredView target:(id)target action:(SEL)action;

//为对象增加属性用来传值
+ (void)setAttribute:(NSObject *)obj Key:(NSString*)key Value:(NSObject *)value;
+ (id)getAttribute:(NSObject *)obj forKey:(NSString*)key;

//单色图片 用于按钮或图片的修饰
+ (UIImage*)imageWithColor:(UIColor*)color;

//获取appdelegate实例
+ (id)getAppDelegate;

@end

