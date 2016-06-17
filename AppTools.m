//
//  AppTools.m
//  NetallStoreManagerApp
//
//  Created by fenglei on 16/5/25.
//  Copyright © 2016年 netall. All rights reserved.
//

#import "AppTools.h"
#import <objc/runtime.h>

@implementation AppTools

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


+ (UITextField*)addTextFieldInView:(UIView*)view frameTop:(float)top placeHolder:(NSString*)holder leftStr:(NSString*)leftStr
{
    float leftSpace = 10;
    float viewH = 32;
    
    UIView *backView = [[UIView alloc] initWithFrame: CGRectMake(leftSpace, top, CGRectGetWidth(view.frame)-2*leftSpace, viewH)];
    [view addSubview: backView];
    
    UILabel *label = [[UILabel alloc] initWithFrame: CGRectMake(0, 0, 200, viewH)];
    label.autoresizingMask = UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleBottomMargin | UIViewAutoresizingFlexibleWidth;
    label.text = leftStr;
    label.textAlignment = NSTextAlignmentLeft;
    label.textColor = [AppColor getColorMainStyle];
    label.font = [UIFont systemFontOfSize: 16];
    [backView addSubview: label];
    
    [label sizeToFit];
    CGRect rect = label.frame;
    rect.size.height = viewH;
    label.frame = rect;
    
    UITextField *deptField = [[UITextField alloc] initWithFrame: CGRectMake(CGRectGetMaxX(label.frame)+5, 0, CGRectGetWidth(view.frame)-CGRectGetMaxX(label.frame)-5-2*leftSpace, viewH)];
    deptField.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleBottomMargin;
//    deptField.borderStyle = UITextBorderStyleRoundedRect;
    deptField.placeholder = holder;
    deptField.autocapitalizationType = UITextAutocapitalizationTypeNone;
    deptField.autocorrectionType = UITextAutocorrectionTypeNo;
    deptField.font = [UIFont systemFontOfSize: 16];
    deptField.clearButtonMode = UITextFieldViewModeWhileEditing;
    deptField.returnKeyType = UIReturnKeyDone;
    [backView addSubview: deptField];
    
    return deptField;
}

+ (UILabel*)addLabelInView:(UIView*)view spaceFrom:(UIView*)upView space:(float)space left:(float)left text:(NSString*)textStr
{
    return [AppTools addLabelInView:view frameTop: CGRectGetMaxY(upView.frame)+space left: left text: textStr];
}

+ (UILabel*)addLabelInView:(UIView*)view frameTop:(float)top left:(float)left text:(NSString*)textStr
{
    float viewH = 32;

    UILabel *label = [[UILabel alloc] initWithFrame: CGRectMake(left, top, 100, viewH)];
    label.text = textStr;
    label.font = [UIFont systemFontOfSize: 16];
    label.textAlignment = NSTextAlignmentLeft;
    label.textColor = [AppColor getColorMainStyle];
    [view addSubview: label];
    
    [label sizeToFit];
    CGRect rect = label.frame;
    rect.size.height = viewH;
    label.frame = rect;
    
    return label;
}


+ (UIButton*)addEnterButton:(UIView*)view top:(float)top labelText:(NSString*)str
{
    UIButton *button = [UIButton buttonWithType: UIButtonTypeCustom];
    button.frame = CGRectMake(0, top, CGRectGetWidth(view.frame), 35);
    [button setBackgroundImage: [AppTools imageWithColor: [AppColor getColorMainStyle]] forState: UIControlStateNormal];
    [button setBackgroundImage: [AppTools imageWithColor: [AppColor getColorMainGreen]] forState: UIControlStateHighlighted];
    [button setTitle: str forState: UIControlStateNormal];
    [button setTitleColor: [UIColor whiteColor] forState: UIControlStateNormal];
    button.layer.masksToBounds = YES;
    button.titleLabel.font = [UIFont systemFontOfSize: 16];
    [view addSubview: button];
    return button;
}


+ (void)coverdMe:(UIView*)coveredView target:(id)target action:(SEL)action
{
    UIView *cView = [[UIView alloc] initWithFrame: coveredView.bounds];
    cView.backgroundColor = [UIColor clearColor];
    cView.userInteractionEnabled = YES;
    [coveredView addSubview: cView];
    [cView addGestureRecognizer: [[UITapGestureRecognizer alloc] initWithTarget: target action: action]];
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



@end
